#!/bin/bash
clear

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 6: Argument Parsing"
echo
echo "🎯 Mission:"
echo "1. Create a script named 'count_lines.sh'"
echo "2. When run with a filename as an argument, it should print the number of lines in that 
file"
echo "3. If no argument is provided, it should print: No file provided"
echo
echo "🧱 Prerequisites:"
echo "- Script must be named exactly: count_lines.sh"
echo "- The script must use \$1 to access the first argument"
echo "- If no argument is given, it must print: No file provided"
echo "- If a valid file is passed, it must print just the line count (e.g. 3)"
echo
echo "🖥️ How to complete:"
echo "1. Create a new script file named: count_lines.sh"
echo "2. Inside it, check if an argument (\$1) is provided"
echo "3. If not provided, print: No file provided"
echo "4. If a filename is passed, print the number of lines in that file"
echo "5. Create a test file like this: echo -e 'one\\ntwo\\nthree' > testfilelevel6.txt"
echo "6. Run your script like this: ./count_lines.sh testfilelevel6.txt"
echo "7. Expected output in this case: 3"
echo "8. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      success=true

      if [[ ! -f count_lines.sh ]]; then
        echo "❌ count_lines.sh script not found."
        success=false
      elif ! grep -q '\$1' count_lines.sh; then
        echo "❌ Script does not use \$1 to access the argument."
        success=false
      fi

      # Test 1: No argument
      no_arg_output=$(bash count_lines.sh 2>/dev/null)
      if [[ "$no_arg_output" != *"No file provided"* ]]; then
        echo "❌ Missing or incorrect message when no argument is given."
        success=false
      fi

      # Test 2: With a test file
      echo -e "line1\nline2\nline3" > testfile.txt
      with_arg_output=$(bash count_lines.sh testfile.txt 2>/dev/null | tr -d '[:space:]')
      if [[ "$with_arg_output" != "3" && "$with_arg_output" != "3testfile.txt" ]]; then
        echo "❌ Expected output to be '3' when passing a 3-line file."
        success=false
      fi
      rm -f testfile.txt

      if [[ "$success" == true ]]; then
        echo "✅ Level 6 complete! You're getting sharp."
        break
      else
        echo -e "\n⚠️ One or more checks failed. Update count_lines.sh and retry."
      fi
      ;;
    exit)
      echo "Exiting Level 6..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."

