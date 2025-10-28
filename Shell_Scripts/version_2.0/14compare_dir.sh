#####################################################################
# Script Name : compare_dir.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that compares two directories and reports any differences in their content.
####################################################################

#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 </path/to/directory1> </path/to/directory2>"
    exit 1
fi

DIRECTORY1=$1
DIRECTORY2=$2

if [ ! -d "$DIRECTORY1" ]; then
    echo "Error: Directory1 not found!"
    exit 1
fi

if [ ! -d "$DIRECTORY2" ]; then
    echo "Error: Directory2 not found!"
    exit 1
fi

diff -qr $DIRECTORY1 $DIRECTORY2

if [ $? -eq 0 ];
	then
	echo "Both directories are identical"
else
	echo "Differences found between the Two directories."
fi
