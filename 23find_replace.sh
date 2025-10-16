#Write a script that performs a search and replace operation on multiple files in a directory

#!/bin/bash

# Usage: ./search_replace.sh /path/to/directory "search_text" "replace_text"

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 /path/to/directory \"search_text\" \"replace_text\""
    exit 1
fi

DIRECTORY=$1
SEARCH=$2
REPLACE=$3

# Loop through all files in the directory
for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        # Perform search and replace using sed
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done

echo "Search and replace completed."

#grep -rl "$search_text" "$target_dir" | xargs sed -i "s/$search_text/$replace_text/g"
