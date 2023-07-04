#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Edge lambda versions
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "ENV" }

# Documentation:
# @raycast.author Fabrizio Fortunato

export AWS_CA_BUNDLE=~/zscaler.pem

if [ "$1" == "SIT" ] || [ "$1" == "UAT" ]; then
  export AWS_PROFILE=FR-NonProd
elif [ "$1" == "DEV"  ]; then
  export AWS_PROFILE=FR-Sandbox
elif [ "$1" == "PROD" ] || [ "$1" == "OAT" ]; then
  export AWS_PROFILE=FR-Prod
fi

aws lambda list-versions-by-function --function-name FR-SINGLE-API-$1-OriginRequest --region us-east-1 | jq ".Versions[-1].FunctionArn"
aws cloudformation list-stack-resources --stack-name FR-$1-EDGE-LAMBDA-UTILS --region us-east-1 | jq -c '
.StackResourceSummaries | .[] | select(.ResourceType | contains("Version")) | .PhysicalResourceId'
aws lambda list-versions-by-function --function-name FR-$1-SHIELD-FARE-OVERRIDE-LE --region us-east-1 | jq ".Versions[-1].FunctionArn"
