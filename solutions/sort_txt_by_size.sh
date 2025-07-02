#!/bin/bash

# Delete output file first so it's not included in *.txt list
rm -f sort_output.txt

# Loop through all .txt files, get size, and format output
for file in *.txt; do
    if [[ -f "$file" ]]; then
        size=$(stat -f%z "$file")
        echo "$file - $size bytes"
    fi
done | sort -k3 -n > sort_output.txt

echo "Files sorted by size and saved to sort_output.txt"
cat "sort_output.txt"
