#shell script that adds new users to the system based on a list of names in a CSV file.

#!/bin/bash

read -p "Enter the path of the CSV file : " csv_file

while IFS=',' read -r username
do
	if id "$username" &>/dev/null; then
    		echo "User '$username' already exists."
  	else
    		sudo useradd -m "$username"
    		echo "User '$username' created successfully."
	fi
done < "$csv_file"
