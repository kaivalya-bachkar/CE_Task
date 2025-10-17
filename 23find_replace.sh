#Write a script that performs a search and replace operation on multiple files in a directory

#!/bin/bash

read -p "Enter The Path of File : " DIRECTORY
read -p "Enter The Word To Replace " SEARCH
raed -p "Enter The New Word To Replace:" REPLACE

for FILE in "$DIRECTORY"/*; do
    if [ -f "$FILE" ]; then
        sed -i "s/${SEARCH}/${REPLACE}/g" "$FILE"
        echo "Updated $FILE"
    fi
done

echo "Search and replace completed."
