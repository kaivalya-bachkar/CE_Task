#####################################################################
# Script Name : checks_update.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that checks for software updates and installs them automatically.
####################################################################

#!/bin/bash

service_name=$1

if [ "$#" -ne 1 ] || ! command -v systemctl &> /dev/null; then
    echo "Usage: $0 service_name"
    ! command -v systemctl &> /dev/null && echo "Error: systemctl not found. This script works only on systems using systemd."
    exit 1
fi

echo "Starting system update"

sudo yum update $service_name -y
