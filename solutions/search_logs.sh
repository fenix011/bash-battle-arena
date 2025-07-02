#!/bin/bash

word=$1

for file in *.log; do
    if [[ -f "$file" ]]; then
        if grep -q "$word" "$file"; then
            # Output without spaces, blank lines, or extra formatting
            printf "%s\n" "$file"
        fi
    fi
done
