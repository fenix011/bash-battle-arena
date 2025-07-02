#!/bin/bash
clear

# --- LESSON / INSTRUCTIONS ---
cat lessons/lesson2.txt
echo
echo "📚 LEVEL 2: Loop Basics"
echo
echo "🎯 Mission:"
echo "1. Write a script named 'script2.sh'"
echo "2. It should output the numbers 1 to 10, one number per line"
echo
echo "🧱 Prerequisites:"
echo "- The file must be named exactly: script2.sh"
echo "- The output must be numbers 1 to 10, each on its own line"
echo "- No extra whitespace or prompts in the output"
echo
echo "🖥️ How to complete:"
echo "1. Create a new Bash script file"
echo "2. Inside it, use a loop to print numbers from 1 to 10"
echo "3. Make it executable and test it"
echo "4. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      if [[ ! -f script2.sh ]]; then
        echo "❌ script2.sh not found."
      else
        output=$(bash script2.sh 2>&1)
        correct=$(seq 1 10)

        if [[ "$output" == "$correct" ]]; then
          echo "✅ Correct output!"
          break
        else
          echo "❌ Incorrect output."
          echo
          echo "Your Output:"
          echo "$output"
          echo
          echo "Expected Output:"
          echo "$correct"
        fi
      fi
      ;;
    exit)
      echo "Exiting Level 2..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."
