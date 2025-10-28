#####################################################################
# Script Name : find_old_files.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that finds and lists all files in a directory tree that have not been accessed in a specified number of days.
####################################################################

#!/bin/bash

DIRECTORY=$1
Day=$2

if  [ "$#" -ne 2 ] || [ ! -d "$DIRECTORY" ]; then
    [ "$#" -ne 2 ] && echo "Usage: $0  </path/to/directory> <Day> "
    [ ! -d "$DIRECTORY" ] && echo "Error: Directory not found!"
    exit 1
fi

echo "Files in '$DIRECTORY' not accessed in the last &Day Days:"
find "$DIRECTORY" -type f -atime +"$Day" -print
