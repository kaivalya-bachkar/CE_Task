#!/bin/bash

read -p "Enter The Path :" path
echo lists all files and saves the output to a file.
ls  "$path" > output.txt
