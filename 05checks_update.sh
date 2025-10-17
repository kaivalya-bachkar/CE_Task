#shell script that checks for software updates and installs them automatically.

#!/bin/bash

read -p "Enter Service name to Check its Updated or not :" service_name
echo "Starting system update"

sudo yum update $service_name -y
