#####################################################################
# Script Name : fetch_ec2_details.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : Script to Fetch data from AWS EC2 API
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <region>"
    exit 1
fi

region=$1

if ! command -v aws &> /dev/null; then
    echo "Error: AWS CLI not found! Please Check its Install or not."
    exit 1
fi

echo "Fetching EC2 instance details from region: $region"

aws ec2 describe-instances --region "$region" \
 --query "Reservations[].Instances[].{InstanceID:InstanceId,PrivateIP:PrivateIpAddress,PublicIP:PublicIpAddress}"
