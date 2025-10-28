#shell script that finds and lists all files in a directory tree that have not been accessed in a specified number of days.

#!/bin/bash
#set -x
read -p "Enter the Directory path to check which files are accessed form certain time : " Directory
read -p "Enter the Days to check : " Day

echo "Files in '$Directory' not accessed in the last &Day Days:"
find "$Directory" -type f -atime +"$Day"
#set +x
