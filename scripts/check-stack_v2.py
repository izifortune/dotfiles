# Check if a AWS resource is used by any stack
# Usage: python check-stack.py <bucket-name>
import sys
import boto3
 
s3 = boto3.resource('s3')
cf = boto3.client('cloudformation')
 
for bucket in s3.buckets.all():
  try:
    stack = cf.describe_stack_resources(PhysicalResourceId=bucket.name)
    print bucket.name + " -> " + stack['StackResources'][0]['StackName']
  except:
    print bucket.name + " -> doenst have any StackResources"

