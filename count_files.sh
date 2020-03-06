#!/bin/bash
# count_files.sh

#echo "Which directory?"
#read directory

if [ "$1" != "" ]; then
    echo "Counting files in $1"
    directory="$1"
else
    echo "Counting files in $PWD"
    directory="$PWD"
fi

#echo "Count number of files and group in extensions in $directory: "
sudo find $directory -type f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | sort | uniq -c | sort -n

echo "------------------------------"
total=$( sudo find $directory -type f | grep -E ".*\.[a-zA-Z0-9]*$" | sed -e 's/.*\(\.[a-zA-Z0-9]*\)$/\1/' | wc -l )
echo -e "Total: ${LIGHTGREEN}$total ${NOCOLOR}"
