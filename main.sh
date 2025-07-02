#!/bin/bash

# --- Function to show title ---
show_ascii_art() {
clear
cat << "EOF"
______   _______  _______
(  ___ \ (  ___  )(  ____ \|\     /|
| (   ) )| (   ) || (    \/| )   ( |
| (__/ / | (___) || (_____ | (___) |
|  __ (  |  ___  |(_____  )|  ___  |
| (  \ \ | (   ) |      ) || (   ) |
| )___) )| )   ( |/\____) || )   ( |
|/ \___/ |/     \|\_______)|/     \|

 ______   _______ __________________ _        _______
(  ___ \ (  ___  )\__   __/\__   __/( \      (  ____ \
| (   ) )| (   ) |   ) (      ) (   | (      | (    \/
| (__/ / | (___) |   | |      | |   | |      | (__
|  __ (  |  ___  |   | |      | |   | |      |  __)
| (  \ \ | (   ) |   | |      | |   | |      | (
| )___) )| )   ( |   | |      | |   | (____/\| (____/\
|/ \___/ |/     \|   )_(      )_(   (_______/(_______/

 _______  _______  _______  _        _______    _
(  ___  )(  ____ )(  ____ \( (    /|(  ___  )  ( )
| (   ) || (    )|| (    \/|  \  ( || (   ) |  | |
| (___) || (____)|| (__    |   \ | || (___) |  | |
|  ___  ||     __)|  __)   | (\ \) ||  ___  |  | |
| (   ) || (\ (   | (      | | \   || (   ) |  (_)
| )   ( || ) \ \__| (____/\| )  \  || )   ( |   _
|/     \||/   \__/(_______/|/    )_)|/     \|  (_)
EOF
}

# --- Main Menu Loop ---
while true; do
  show_ascii_art
  echo ""
  echo "Select a level (1–15) or enter 'q' to quit:"
  echo "  q - Quit the game"
  for i in {1..15}; do
    echo "  Level $i - $(head -1 lessons/lesson$i.txt)"
  done
  echo ""
  read -p "Enter level number (or 'q' to quit): " level
  echo ""

  if [[ "$level" == "q" || "$level" == "Q" ]]; then
    echo "Exiting game. Goodbye!"
    break
  elif [[ "$level" =~ ^[1-9]$|^1[0-5]$ ]]; then
    ./levels/level$level.sh
  else
    echo "❌ Invalid input. Please enter 1–15 or 'q' to quit."
    sleep 1.5
  fi
done
