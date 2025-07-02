#!/bin/bash
clear

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 4: File Manipulation"
echo
echo "🎯 Mission:"
echo "1. Copy all .txt files from the 'Arena' directory"
echo "2. Paste them into a new directory called 'Backup'"
echo
echo "🧱 Prerequisites:"
echo "- The 'Arena' directory must already exist"
echo "- Only .txt files inside 'Arena' should be copied"
echo "- The 'Backup' directory must be created manually"
echo
echo "🖥️ How to complete:"
echo "1. Use 'cp' with a wildcard to copy all .txt files"
echo "2. Ensure the copied files are inside 'Backup/'"
echo "3. You can open a second terminal window to work while this checker stays open"
echo "4. If needed, delete the Backup directory using: rm -r Backup"
echo "5. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      if [[ ! -d Arena ]]; then
        echo "❌ Arena directory does not exist. Please create it first."
        continue
      fi

      txt_count=$(find Arena -maxdepth 1 -name "*.txt" | wc -l)

      if [[ ! -d Backup ]]; then
        echo "❌ Backup directory not found."
      elif [[ $(find Backup -maxdepth 1 -name "*.txt" | wc -l) -lt $txt_count ]]; then
        echo "❌ Not all .txt files were copied to Backup. Check your cp command."
      else
        echo "✅ All .txt files from Arena successfully copied to Backup!"
        break
      fi
      ;;
    exit)
      echo "Exiting Level 4..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."

