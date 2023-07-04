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

firefox 'ext+container:name=FR-Prod AWS-Developer&url=https://us-east-1.console.aws.amazon.com/cloudwatch/home?region=us-east-1#dashboards:name=WEB-SHIELD-AVAILABILITY-PROD;autoRefresh=60;start=PT3H'
