#script that compares two directories and reports any differences in their content.

#!/bin/bash

read -p "Enter the Path of First directory: " dir1
read -p "Enter The Path of Second directory:" dir2

diff -qr $dir1 $dir2

if [ $? -eq 0 ];
	then
	echo "Both directories are identical"
else
	echo "Differences found between the Two directories."
fi
