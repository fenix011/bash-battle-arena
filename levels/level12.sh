#!/bin/bash
clear
cat lessons/lesson12.txt
echo ""
echo "Mission: [Insert mission instructions here for Level 12]"
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      echo "⚠️  Checker not yet implemented for Level 12."
      ;;
    exit)
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done
read -p "Press Enter to return to menu..."
