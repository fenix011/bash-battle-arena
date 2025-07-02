#!/bin/bash

directory=$1

# Clear previous log before starting
> changes.log

if [[ -z "$directory" ]]; then
    echo "No directory given"
    exit 1
fi

if [[ ! -d "$directory" ]]; then
    echo "Directory not found"
    exit 1
fi

echo "Monitoring '$directory' directory..."
ls -lR "$directory" > snapshot.txt

echo "Make any changes in the directory now (e.g., add/delete/edit files), then press ENTER to 
continue..."
read

ls -lR "$directory" > snapshot_new.txt

echo "==== $(date) ====" >> changes.log
diff snapshot.txt snapshot_new.txt >> changes.log
echo "Changes (if any) saved to changes.log"

