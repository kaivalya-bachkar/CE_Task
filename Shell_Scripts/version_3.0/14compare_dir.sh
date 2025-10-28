#####################################################################
# Script Name : compare_dir.sh
# Version     : 3.0
# Date        : 28 Oct 2025
# Purpose     : script that compares two directories and reports any differences in their content.
####################################################################

#!/bin/bash

DIRECTORY1=$1
DIRECTORY2=$2

if [ "$#" -ne 2 ] || [ ! -d "$DIRECTORY1" ] || [ ! -d "$DIRECTORY2" ]; then
    [ "$#" -ne 2 ] && echo "Usage: $0 </path/to/directory1> </path/to/directory2>"
    [ ! -d "$DIRECTORY1" ] && echo "Error: Directory1 not found!"
    [ ! -d "$DIRECTORY2" ] && echo "Error: Directory2 not found!"
    exit 1
fi

diff -qr $DIRECTORY1 $DIRECTORY2

if [ $? -eq 0 ];
        then
        echo "Both directories are identical"
else
        echo "Differences found between the Two directories."
fi
