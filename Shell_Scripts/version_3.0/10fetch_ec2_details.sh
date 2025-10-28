#####################################################################
# Script Name : fetch_ec2_details.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : Script to Fetch data from AWS EC2 API
####################################################################

#!/bin/bash

region=$1

if [ "$#" -ne 1 ] || ! command -v aws &> /dev/null ; then
    echo "Usage: $0 <region>"
    ! command -v aws &> /dev/null && echo "Error: AWS CLI not found! Please Check its Install or not."
    exit 1
fi

echo "Fetching EC2 instance details from region: $region"

aws ec2 describe-instances --region "$region" \
 --query "Reservations[].Instances[].{InstanceID:InstanceId,PrivateIP:PrivateIpAddress,PublicIP:PublicIpAddress}"
