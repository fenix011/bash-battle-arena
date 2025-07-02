#!/bin/bash
clear

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 7: Sorting Files by Size"
echo
echo "🎯 Mission:"
echo "1. Scan all .txt files in the current directory"
echo "2. Sort them by size (smallest to largest)"
echo "3. Output the result to a file called: sort_output.txt"
echo "4. Each line must follow this format: filename - SIZE bytes"
echo
echo "🧱 Prerequisites:"
echo "- All .txt files must be scanned (excluding sort_output.txt itself)"
echo "- Output must be sorted numerically by size"
echo "- Output must be saved in a file named: sort_output.txt"
echo "- Output lines must look exactly like: example.txt - 42 bytes"
echo
echo "🖥️ How to complete:"
echo "1. Create and save your script as sort_txt_by_size.sh"
echo "2. Use 'stat' or 'wc -c' to get file sizes"
echo "   • macOS users: stat -f%z filename"
echo "   • Linux users: stat -c%s filename"
echo "3. Use 'sort -k3 -n' to sort by size"
echo "4. Type: check (in this window) when you're ready"
echo "⚠️ Important: If you create or change any .txt files, you must re-run your script before 
checking!"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input

  case $input in
    exit)
      echo "Exiting Level 7..."
      break
      ;;
    check)
      echo
      echo "🔍 Checking sort_output.txt..."
      output_file="sort_output.txt"

      if [[ ! -f "$output_file" ]]; then
        echo "❌ '$output_file' not found. Run your script before checking."
        continue
      fi

      # Build expected output
      expected=""
      for file in *.txt; do
        [[ "$file" == "$output_file" ]] && continue

        if [[ -f "$file" ]]; then
          if [[ "$(uname)" == "Darwin" ]]; then
            size=$(stat -f%z "$file")
          else
            size=$(stat -c%s "$file")
          fi
          expected+="$file - $size bytes"$'\n'
        fi
      done

      # Sort expected output and clean blank lines
      expected_sorted=$(echo "$expected" | sed '/^$/d' | sort -k3 -n)

      # Clean actual output
      actual=$(cat "$output_file" | sed '/^$/d')

      if [[ "$expected_sorted" == "$actual" ]]; then
        echo "✅ Success! Your output is correct and sorted."
        break
      else
        echo "❌ Incorrect output in $output_file. Here's the difference:"
        diff <(echo "$expected_sorted") <(echo "$actual")
      fi
      ;;
    *)
      echo "Invalid input. Please type 'check' to verify your solution or 'exit' to quit."
      ;;
  esac
done

read -p "Press Enter to return to menu..."

