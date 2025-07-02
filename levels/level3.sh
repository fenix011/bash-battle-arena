#!/bin/bash
clear

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 3: Conditionals"
echo
echo "🎯 Mission:"
echo "1. Write a script named 'hero_check.sh'"
echo "2. It should check whether the file 'Arena/hero.txt' exists"
echo "3. If it does, print: Hero found!"
echo "4. If it doesn't, print: Hero missing!"
echo
echo "🧱 Prerequisites:"
echo "- The file must be named exactly: hero_check.sh"
echo "- The script must check for 'Arena/hero.txt'"
echo "- It must output exactly one of the two messages"
echo
echo "🖥️ How to complete:"
echo "1. Create a new Bash script"
echo "2. Use an if-statement to check if the file exists"
echo "3. Use echo to print the correct message"
echo "4. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      if [[ -f hero_check.sh ]]; then
        output=$(bash hero_check.sh 2>&1)

        if [[ "$output" == "Hero found!" || "$output" == "Hero missing!" ]]; then
          echo "✅ Output accepted: $output"
          break
        else
          echo "❌ Incorrect output."
          echo
          echo "Your Output:"
          echo "$output"
          echo
          echo "Expected Output:"
          echo "'Hero found!' or 'Hero missing!'"
        fi
      else
        echo "❌ Missing hero_check.sh. Please write your solution script and save it as 
hero_check.sh"
      fi
      ;;
    exit)
      echo "Exiting Level 3..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."

