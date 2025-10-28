#####################################################################
# Script Name : service_status.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that checks whether a specified service is running and restarts it if it's not running.
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

echo Checking Whether the $service_name is Running Or Not

if pgrep -x $service_name >/dev/null
	then
	echo "$service_name is running."
else
	echo "$service_name is not running"
	systemctl start $service_name
	if pgrep -x $service_name >/dev/null
		then
			echo "$service_name is restarted"
		else
			echo "$service_name is not restarted."
	fi
fi
