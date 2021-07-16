#!/bin/bash
# lists all buckets along with their tags in the following format:
# bucket_name | { tag_name: tag_value }
# depends on AWS CLI and JQ

echo "Bucket, Name, Project, Component, ProductOwner, TechnicalOwner, Environment" > output.csv
for bucket in $(aws s3api list-buckets | jq .Buckets[].Name -r); do
    # tags=$(aws s3api get-bucket-tagging --bucket $bucket | jq -c '.[][] | (.Key): .Value,'| tr '\n' '\t')
    tags=$(aws s3api get-bucket-tagging --bucket $bucket) 
    name=$(echo $tags | jq -c '.TagSet[] | select(.Key == "Project" ) | .Value')
    project=$(echo $tags | jq -c '.TagSet[] | select(.Key == "Project" ) | .Value')
    component=$(echo $tags | jq -c '.TagSet[] | select(.Key == "Component" ) | .Value')
    productowner=$(echo $tags | jq -c '.TagSet[] | select(.Key == "ProductOwner" ) | .Value')
    technicalowner=$(echo $tags | jq -c '.TagSet[] | select(.Key == "TechnicalOwner" ) | .Value')
    environment=$(echo $tags | jq -c '.TagSet[] | select(.Key == "Environment" ) | .Value')
    row="$bucket,$name,$project,$component,$productowner,$technicalowner,$environment"
    echo $row >> output.csv
done
