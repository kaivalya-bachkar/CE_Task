#####################################################################
# Script Name : add_users_from_csv.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : Script to add new users to the system based on a list of names in a CSV file.
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory-path-to-csv-file>"
    exit 1
fi

CSV_FILE=$1

if [ ! -f "$CSV_FILE" ] || [ "${CSV_FILE##*.csv !}" ]; then
    echo "Error: csv_file not found!"
    exit 1
fi

while IFS=',' read -r username
do
	if id "$username" &>/dev/null; then
    		echo "User '$username' already exists."
  	else
    		sudo useradd -m "$username"
    		echo "User '$username' created successfully."
	fi
done < "$CSV_FILE"
