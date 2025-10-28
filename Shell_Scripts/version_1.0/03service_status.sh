#shell script that checks whether a specified service is running and restarts it if it's not running.

#!/bin/bash

read -p "Enter The Service Name To Check Wether its Running or Not :" service_name
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
