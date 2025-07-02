#!/bin/bash

# Clean up previous runs
rm -f Arena_Boss/file*.txt
rm -f Victory_Archive/file*.txt

# Create required directories
mkdir -p "Arena_Boss"
mkdir -p "Victory_Archive"

# Move into Arena_Boss directory
cd Arena_Boss || exit 1

# Create 5 files and add 10–20 random lines to each
touch file1.txt file2.txt file3.txt file4.txt file5.txt

for file in file*.txt; do
    num_lines=$(( RANDOM % 11 + 10 ))
    for ((i = 1; i <= num_lines; i++)); do
        echo "Line $i" >> "$file"
    done
done

# Randomly insert the word 'Victory' into one random file
random_file="file$((RANDOM % 5 + 1)).txt"
echo "Victory" >> "$random_file"

# Display sorted files by size
for file in file*.txt; do
    size=$(stat -f%z "$file")  # Use -c%s for Linux
    echo "$file - $size bytes"
done | sort -k3 -n

# Move any file containing 'Victory' to Victory_Archive
for file in file*.txt; do
    if grep -q "Victory" "$file"; then
        mv "$file" ../Victory_Archive
    fi
done
