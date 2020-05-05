#!/bin/bash
##Add the tags all running/stopped instances key=ami,value=true
key_name=ami
tag_value=true
InstanceID=$(aws ec2 describe-instances   --query "Reservations[].Instances[].[InstanceId ,Tags]" --output text | grep -v  ami | awk '{print $1}')
for ID in $InstanceID; do
           echo "Add AMI tags: $ID"
           aws ec2 create-tags --resources  $ID  --tags  Key=$key_name,Value=$tag_value
done
