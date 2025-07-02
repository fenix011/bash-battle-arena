#!/bin/bash
clear

cat << "EOF"
______   _______  _______  _______                   
(  ___ \ (  ___  )(  ____ \(  ____ \                  
| (   ) )| (   ) || (    \/| (    \/                  
| (__/ / | |   | || (_____ | (_____                   
|  __ (  | |   | |(_____  )(_____  )                  
| (  \ \ | |   | |      ) |      ) |                  
| )___) )| (___) |/\____) |/\____) |                  
|/ \___/ (_______)\_______)\_______)                  
                                                      
 ______   _______ __________________ _        _______ 
(  ___ \ (  ___  )\__   __/\__   __/( \      (  ____ \
| (   ) )| (   ) |   ) (      ) (   | (      | (    \/
| (__/ / | (___) |   | |      | |   | |      | (__    
|  __ (  |  ___  |   | |      | |   | |      |  __)   
| (  \ \ | (   ) |   | |      | |   | |      | (      
| )___) )| )   ( |   | |      | |   | (____/\| (____/\
|/ \___/ |/     \|   )_(      )_(   (_______/(_______/
                                                      
  __      _                                           
 /  \    ( )                                          
 \/) )   | |                                          
   | |   | |                                          
   | |   | |                                          
   | |   (_)                                          
 __) (_   _                                           
 \____/  (_)   
EOF

# --- INSTRUCTIONS ---
echo
echo "📚 LEVEL 5: Boss Battle 1 - Combine Concepts"
echo
echo "🎯 Mission:"
echo "1. Create a directory named 'Battlefield'"
echo "2. Inside it, create the files: knight.txt, sorcerer.txt, and rogue.txt"
echo "3. Move 'knight.txt' into a new directory called 'Archive'"
echo "4. (Optional) List contents of both directories to verify"
echo
echo "🧱 Prerequisites:"
echo "- 'Battlefield' directory must exist"
echo "- 'sorcerer.txt' and 'rogue.txt' must remain in Battlefield"
echo "- 'knight.txt' must be moved from Battlefield to Archive"
echo "- You must manually create the 'Archive' directory before moving knight.txt"
echo "- Archive must exist and contain knight.txt"
echo
echo "🖥️ How to complete:"
echo "1. Use 'mkdir' and 'touch' to create directories and files"
echo "2. Use 'mv' to move knight.txt"
echo "3. Note: The 'mv' command does NOT create folders — use 'mkdir Archive' first"
echo "4. You can open a second terminal to work while this stays open"
echo "5. If needed, reset with: rm -r Battlefield Archive"
echo "6. Type: check (in this window) when ready"
echo

# --- CHECK LOOP ---
while true; do
  read -p $'\nType "check" to verify your solution or "exit" to quit: ' input
  case $input in
    check)
      success=true

      if [[ ! -d Battlefield ]]; then
        echo "❌ Battlefield directory not found."
        success=false
      fi

      if [[ ! -f Battlefield/sorcerer.txt ]]; then
        echo "❌ sorcerer.txt not found in Battlefield."
        success=false
      fi

      if [[ ! -f Battlefield/rogue.txt ]]; then
        echo "❌ rogue.txt not found in Battlefield."
        success=false
      fi

      if [[ -f Battlefield/knight.txt ]]; then
        echo "❌ knight.txt should have been moved from Battlefield."
        success=false
      fi

      if [[ ! -d Archive ]]; then
        echo "❌ Archive directory not found."
        success=false
      fi

      if [[ ! -f Archive/knight.txt ]]; then
        echo "❌ knight.txt not found in Archive."
        success=false
      fi

      if [[ "$success" == true ]]; then
        echo "✅ Boss Battle 1 complete! All checks passed."
        break
      else
        echo -e "\n⚠️ One or more checks failed. Run your boss1.sh script again and retry."
      fi
      ;;
    exit)
      echo "Exiting Level 5..."
      break
      ;;
    *)
      echo "Invalid input. Please type 'check' or 'exit'."
      ;;
  esac
done

read -p "Press Enter to return to menu..."
