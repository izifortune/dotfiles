#!/usr/bin/env python3
# This script populates SSO configuration file used by AWS CLI and Boto3 based on the logged SSO user.
# It does NOT remove and update existing configurations.
# (C) 2022 Ryanair Labs. Written by Dawid Pichen.
import sys
import boto3
import botocore
from pathlib import Path
import configparser
import os
import time
import webbrowser

VERSION = '1.1'
SAMPLE_ACCOUNT_NO = '123456'
DISALLOWED_ENV_VARS = ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY', 'AWS_SESSION_TOKEN', 'AWS_PROFILE']


def prompt(message, def_value='', value_required=True):
    if (def_value != '') or not value_required:
        message = message + f' [{def_value}]'
    while True:
        result = input(message + ': ')
        if not value_required or (result.strip() != '') or (def_value != ''):
            return def_value if value_required and result.strip() == '' else result


def generate_config_file():
    print(f'AWS-SSO-Config-Generator v. {VERSION} written by Dawid Pichen.\n(C) 2022 Ryanair Labs Sp. z o.o.\n')
    for env_var in DISALLOWED_ENV_VARS:
        if env_var in os.environ:
            print('None of the following environment variables must be set during the execution of this script as '
                  'they would interfere with Single Sign-On: ' + ', '.join(DISALLOWED_ENV_VARS) + '.\nMake sure to '
                  'unset them prior using this script.', file=sys.stderr)
            exit(1)
    config_dir = Path(Path.home(), '.aws')
    config_file = Path(config_dir, 'config')
    config_ini = configparser.ConfigParser()
    if config_file.is_file():
        config_ini.read(config_file)
    print('Step I: AWS SSO Login')
    sso_start_url = prompt('Enter the start SSO URL')
    sso_region = prompt('Enter the region', 'eu-west-1')
    client = boto3.client('sso-oidc', region_name=sso_region)
    result = client.register_client(clientName='AWSAccountConfigs', clientType='public')
    client_id, client_secret = result['clientId'], result['clientSecret']
    result = client.start_device_authorization(clientId=client_id, clientSecret=client_secret, startUrl=sso_start_url)
    print('New page should be displayed in your web browser. Use it to login to AWS and approve the authorisation '
          'request.\nONLY in case when the page did not open correctly, manually open the following link: '
          + result['verificationUriComplete'])
    webbrowser.open(result['verificationUriComplete'])
    access_token = None
    while not access_token:
        time.sleep(1)
        try:
            access_token = client.create_token(clientId=client_id, clientSecret=client_secret,
                                               grantType='urn:ietf:params:oauth:grant-type:device_code',
                                               deviceCode=result['deviceCode'])['accessToken']
        except botocore.exceptions.ClientError as error:
            if error.response['Error']['Code'] == 'AuthorizationPendingException':  # User still hasn't authorised SSO
                pass
            elif error.response['Error']['Code'] == 'AccessDeniedException':
                print('User has not approved the authorisation. Good bye!', file=sys.stderr)
                exit(2)
            else:
                raise
    client = boto3.client('sso', region_name=sso_region)
    print('Authorisation APPROVED. Fetching account information...')
    accounts = client.get_paginator('list_accounts').paginate(accessToken=access_token).search(
        'accountList[*].[accountId, accountName]')
    role_counter = {}
    account_roles = {}
    for account in accounts:
        roles = client.get_paginator('list_account_roles').paginate(accessToken=access_token,
                                                                    accountId=account[0]).search('roleList[*].roleName')
        role_array = []
        for role in roles:
            role_array.append(role)
            if role in role_counter:
                role_counter[role] += 1
            else:
                role_counter[role] = 1
        account_roles[account[0]] = (account[1], role_array)
    print('Successfully downloaded information about {} account(s) and their roles.'.format(len(account_roles.keys())))
    if not len(role_counter):
        print('Nothing to do. No roles available for logged in user.')
        exit(0)
    most_used_role = max(role_counter.items(), key=lambda item: item[1])[0]
    print('\nStep II: Config Profiles')
    print('By default generated profile names will begin with an account number followed by a role name '
          '(eg. "{}_{}"), however this behaviour can be changed by answering the next couple of '
          'questions.'.format(SAMPLE_ACCOUNT_NO, most_used_role))
    ans = prompt('Would you like to use the account name instead of the account number?', def_value='no')
    use_account_numbers = ans.lower() == 'no'
    print('For your convenience the script can generate profile names without the role names for specified (default) '
          'role (eg. "{0}" instead of "{0}_{1}" when entered role name was {1}).'.format(SAMPLE_ACCOUNT_NO,
                                                                                         most_used_role))
    ans = prompt("Would you like to enter the default role?", def_value="yes")
    if ans.lower() == 'yes':
        default_role = prompt('Enter the default role name for which profile name will consist only of account '
                              'number/name', def_value=most_used_role)
    else:
        default_role = None
    print()
    profile_stats = {'added': 0, 'skipped': 0}
    profile = None
    for account_no, account_info in account_roles.items():
        account_id = account_no if use_account_numbers else account_info[0]
        for role_name in account_info[1]:
            profile = account_id
            if role_name != default_role:
                profile += '_' + role_name
            section = f'profile {profile}'
            if section in config_ini.sections():
                print(f'Profile "{profile}" skipped because it already exists.')
                profile_stats['skipped'] += 1
            else:
                config_ini[section] = {}
                config_ini[section]['sso_start_url'] = sso_start_url
                config_ini[section]['sso_account_id'] = account_no
                config_ini[section]['sso_role_name'] = role_name
                config_ini[section]['sso_region'] = sso_region
                config_ini[section]['region'] = sso_region
                print(f'Added profile "{profile}" for account number {account_no} ({account_roles[account_no][0]}).')
                profile_stats['added'] += 1
    if not config_dir.is_dir():
        os.mkdir(config_dir)
    with open(config_file, 'w') as f:
        config_ini.write(f)
    print("\nOperation completed: {} profile(s) added, {} profile(s) skipped.".format(profile_stats['added'],
                                                                                      profile_stats['skipped']))
    print("\nNow you can use any of generated profiles to work with AWS CLI or Boto3. Examples:")
    print(f'\taws sso login --profile "{profile}"\t(SSO login)\n'
          f'\taws s3 ls --profile "{profile}"\t(lists all S3 buckets)\n'
          f'\texport AWS_PROFILE="{profile}"\t(sets the profile in environment variable)')


if __name__ == '__main__':
    try:
        generate_config_file()
    except Exception as exc:
        print('Script ended prematurely due to following error:\n' + str(exc), file=sys.stderr)
        exit(2)
