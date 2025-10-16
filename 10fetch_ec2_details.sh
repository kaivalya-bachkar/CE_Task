#shell script that fetches data from an AWS EC2 API and processes the JSON response to print instance IDs and its public and private IP address.
#!/bin/bash

read -p "Enter the Region to Fetch The Deatils Of Instances : " region

echo "Fetching EC2 instance details from region: $region"

aws ec2 describe-instances --region "$region" \
  --query "Reservations[].Instances[].{InstanceID:InstanceId,PrivateIP:PrivateIpAddress,PublicIP:PublicIpAddress}"
