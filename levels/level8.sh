#!/bin/bash
clear

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 8: File Searching"
echo
echo "🎯 Mission:"
echo "1. Create a script named 'search_logs.sh'"
echo "2. It should accept one argument: a word or phrase to search for"
echo "3. Search through all .log files in the current directory"
echo "4. Print only the names of files that contain the search word"
echo
echo "🧱 Prerequisites:"
echo "- The script must be named exactly: search_logs.sh"
echo "- Output should list only matching filenames, one per line"
echo "- No extra whitespace or file contents should be printed"
echo "- Output must be sorted (optional but ensures consistency)"
echo
echo "🖥️ How to complete:"
echo "1. Create a script named: search_logs.sh"
echo "2. Your script must accept one argument — a word to search for"
echo "3. It should search for that word inside all '.log' files in the current directory"
echo "4. For every .log file that contains the word, print ONLY the filename (one per line)"
echo "   - Do NOT print the matched line or any extra text"
echo
echo "🔧 Example:"
echo "   ./search_logs.sh error"
echo
echo "📂 About the test files:"
echo "• You do NOT need to create your own .log files."
echo "• When you type 'check', this level will automatically create test .log files for you."
echo "• These files will contain a mix of logs with and without the word 'error'."
echo "• Your script should detect which files contain 'error' and print just their names."
echo
echo "🧹 To clear all test logs and start fresh, run:"
echo "   rm -f *.log"
echo
echo "✅ When you're ready, type: check (in this window)"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input

  case $input in
    exit)
      echo "Exiting Level 8."
      break
      ;;
    check)
      echo
      echo "🔍 Preparing test environment..."

      # Cleanup any old log files
      rm -f *.log

      # Create test log files
      echo "This is a clean log." > clean.log
      echo "An error occurred here." > test1.log
      echo "Just another line." > test2.log
      echo "Critical error detected." > test3.log

      # Run user script with 'error' as argument
      echo "Running: ./search_logs.sh error"
      output=$(bash ./search_logs.sh error 2>/dev/null | sed 's/ *$//' | sort)

      # Expected output (sorted)
      expected=$(echo -e "test1.log\ntest3.log")

      if [[ "$output" == "$expected" ]]; then
        echo
        echo "✅ Success! Your script correctly found matching files."
        echo
        echo "🔎 Search term used: 'error'"
        echo
        echo "📂 Matching files:"
        echo "$output"
        echo
        echo "📄 Example matches:"
        for file in $output; do
          match=$(grep -i 'error' "$file" | head -1)
          echo "- $file: $match"
        done
        break
      else
        echo "❌ Incorrect output."
        echo
        echo "Expected:"
        echo "$expected"
        echo
        echo "Your Output:"
        echo "$output"
        echo
        echo "💡 Tip: Print only the filenames (not contents), one per line, no extra spaces."
      fi
      ;;
    *)
      echo "Invalid input. Please type 'check' to verify your solution or 'exit' to quit."
      ;;
  esac
done

read -p "Press Enter to return to menu..."

