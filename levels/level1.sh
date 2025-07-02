#!/bin/bash
clear

# --- LESSON / INSTRUCTIONS ---
cat lessons/lesson1.txt
echo
echo "📚 LEVEL 1: Arena Setup"
echo
echo "🎯 Mission:"
echo "1. Create a directory named 'Arena'"
echo "2. Inside it, create three files: warrior.txt, mage.txt, and archer.txt"
echo "3. List the directory contents to confirm they're there"
echo
echo "🧱 Prerequisites:"
echo "- You must name the directory exactly: Arena"
echo "- Files must be placed inside the Arena directory"
echo "- Your working directory should be this Bash Arena folder"
echo
echo "🖥️ How to complete:"
echo "1. Use terminal to create the directory and files"
echo "2. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      if [[ ! -d Arena ]]; then
        echo "❌ Directory 'Arena' not found."
      else
        missing_files=()
        [[ ! -f Arena/warrior.txt ]] && missing_files+=("warrior.txt")
        [[ ! -f Arena/mage.txt ]] && missing_files+=("mage.txt")
        [[ ! -f Arena/archer.txt ]] && missing_files+=("archer.txt")

        if [[ ${#missing_files[@]} -eq 0 ]]; then
          echo "✅ Success! All required files are present in Arena."
          break
        else
          echo "❌ Missing file(s) in Arena: ${missing_files[*]}"
        fi
      fi
      ;;
    exit)
      echo "Exiting Level 1..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."
