#####################################################################
# Script Name : service_status.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that checks for software updates and installs them automatically.
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 service_name"
    exit 1
fi

service_name=$1

if ! command -v systemctl &> /dev/null; then
    echo "Error: systemctl not found. This script works only on systems using systemd."
    exit 1
fi

echo "Starting system update"

sudo yum update $service_name -y
