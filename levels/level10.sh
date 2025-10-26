#!/bin/bash

# Clear screen and show ASCII art
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
                                                      
 _______    _                                         
/ ___   )  ( )                                        
\/   )  |  | |                                        
    /   )  | |                                        
  _/   /   | |                                        
 /   _/    (_)                                        
(   (__/\   _                                         
\_______/  (_)                                        
EOF

echo
echo "📚 NIVEL 10: Batalla Final 2 - Intermediate Scripting"
echo
echo "🎯 Misión:"
echo "1. Crea un directorio called 'Arena_Boss'"
echo "2. Dentro de él, create 5 archivos: archivo1.txt to archivo5.txt"
echo "3. Each archivo should have a random number of lines (between 10 and 20)"
echo "4. Sort the archivos by size and display the sorted list"
echo "5. If any archivo contains the word 'Victory', move it to 'Victory_Archive'"
echo
echo "🧱 Prerrequisitos:"
echo "- Your script must be named: boss_battle2.sh"
echo "- When you run this level, Arena_Boss and Victory_Archive are reset automatically"
echo "- Type 'check' to verify your solution"
echo "- Type 'reset' to reset the folders manually"
echo "- Press ENTER to return to the main menu after completion"
echo

# Auto-reset folders
rm -rf Arena_Boss Victory_Archive
mkdir Arena_Boss Victory_Archive

echo "♻️  Folders reset. Please re-run your boss_battle2.sh script now."
echo

while true; do
  read -rp "> " input
  case $input in
    check)
      echo "🔍 Checking boss_battle2.sh results..."
      pass=true

      archivo_count=$(find Arena_Boss Victory_Archive -maxdepth 1 -name "archivo*.txt" 2>/dev/null | 
wc -l)
      if [[ "$archivo_count" -ne 5 ]]; then
        echo "❌ Expected 5 archivos across Arena_Boss and Victory_Archive but found $archivo_count"
        pass=false
      fi

      for archivo in Arena_Boss/archivo*.txt Victory_Archive/archivo*.txt; do
        if [[ -f "$archivo" ]]; then
          line_count=$(wc -l < "$archivo" | tr -d ' ')
          if (( line_count < 10 || line_count > 20 )); then
            echo "❌ $archivo has $line_count lines (expected 10–20)."
            pass=false
          fi
        fi
      done

      moved_archivos=$(find Victory_Archive -name "archivo*.txt")
      if [[ -n "$moved_archivos" ]]; then
        echo "✅ Moved archivos to Victory_Archive:"
        echo "$moved_archivos"
      else
        echo "⚠️ No archivos were moved to Victory_Archive (maybe none had 'Victory')"
      fi

      if $pass; then
        echo "✅ Level 10 complete!"
        echo
        echo "👉 You can type 'reset' to try again"
        echo "or just press ENTER to return to the main menu."
      else
        echo "❌ Level 10 not yet complete. Fix the issues and try again."
      fi
      ;;
    reset)
      echo "♻️  Resetting folders..."
      rm -rf Arena_Boss Victory_Archive
      mkdir Arena_Boss Victory_Archive
      echo "✅ Reset complete. Re-run your boss_battle2.sh script and type 'check' again."
      ;;
    "")
      echo
      read -rp "Press ENTER to return to the main menu..."
      break
      ;;
    *)
      echo "Invalid input. Type 'check', 'reset', or press ENTER to quit."
      ;;
  esac
done

