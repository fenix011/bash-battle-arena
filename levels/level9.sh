#!/bin/bash

# --- LESSON + INSTRUCTIONS ---
clear
echo "📚 LEVEL 9: Directory Change Monitor"
echo
echo "🎯 Mission: Write a script that:"
echo "- Takes a directory path as an argument"
echo "- Captures the current state of that directory"
echo "- Waits for the user to make changes (like adding/deleting files)"
echo "- Captures the new state"
echo "- Logs the difference with a timestamp to a file: changes.log"
echo
echo "🧱 Prerequisites:"
echo "1. Create a test directory, e.g. test_dir"
echo "2. Put at least 1–2 files inside it"
echo "3. Your script must be named: monitor_changes.sh"
echo
echo "🖥️ How to complete:"
echo "- Open this terminal (the game window)"
echo "- In a second terminal, run: ./monitor_changes.sh test_dir"
echo "- It will wait after the first snapshot — do not press ENTER yet"
echo "- In a *third terminal*, modify test_dir (add/delete files)"
echo "- Then press ENTER in the second terminal"
echo
echo "📄 Output expected in changes.log:"
echo "- One line showing the timestamp (e.g. ==== Mon Jul 1 22:30:41 BST 2025 ===="
echo "- Followed by any lines that changed, starting with '<' or '>'"
echo "- Your script should overwrite changes.log each run (not append)"
echo
echo "💡 Tip: If your script doesn't detect changes, make sure you're modifying the directory 
between snapshots."
echo
echo "Type 'check' to verify your solution or 'exit' to quit."

# --- CHECK LOOP ---
while true; do
  read -rp "> " input
  case $input in
    check)
      echo "🔍 Checking output..."

      if [[ ! -f "changes.log" ]]; then
        echo "❌ changes.log not found."
        continue
      fi

      if [[ ! -s "changes.log" ]]; then
        echo "❌ changes.log exists but is empty."
        continue
      fi

      if ! grep -q "^==== .* ====" changes.log; then
        echo "❌ Timestamp line missing in changes.log."
        continue
      fi

      if ! grep -Eq '^<|^>' changes.log; then
        echo "❌ No changes detected in changes.log."
        echo "💡 Tip: Did you actually change the directory before pressing ENTER?"
        continue
      fi

      echo
      echo "✅ Success! Your log captured the following changes:"
      echo
      grep -E '^<|^>' changes.log | head -10
      echo
      echo "📅 Timestamp:"
      grep "^==== .* ====" changes.log | tail -1
      echo

      break
      ;;
    exit)
      echo "Exiting Level 9."
      break
      ;;
    *)
      echo "❌ Invalid input. Type 'check' to verify or 'exit' to quit."
      ;;
  esac
done

echo
read -p "Press ENTER to return to the main menu..."

