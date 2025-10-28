#####################################################################
# Script Name : file_lists.sh
# Version     : 2.0
# Date        : 22 Oct 2025
# Purpose     : script that lists all files in a specified directory and saves the output to a text file.
####################################################################

#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 </path/to/directory>"
    exit 1
fi

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory not found!"
    exit 1
fi

OUTPUT_FILE="file_list_$(date +%Y%m%d_%H%M%S).txt"

find "$DIRECTORY" -type f > "$OUTPUT_FILE"

echo "File list saved to: $OUTPUT_FILE"



