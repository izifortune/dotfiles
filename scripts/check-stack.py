import sys
import boto3

cf = boto3.client('cloudformation')
stack = cf.describe_stack_resources(PhysicalResourceId=sys.argv[1])
print sys.argv[1] + " -> " + stack['StackResources'][0]['StackName']
