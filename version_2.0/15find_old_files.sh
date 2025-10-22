#####################################################################
# Script Name : find_old_files.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that finds and lists all files in a directory tree that have not been accessed in a specified number of days.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0  </path/to/directory> <Day> "
    exit 1
fi

DIRECTORY=$1
Day=$2

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory not found!"
    exit 1
fi

echo "Files in '$DIRECTORY' not accessed in the last &Day Days:"
find "$DIRECTORY" -type f -atime +"$Day" -print
