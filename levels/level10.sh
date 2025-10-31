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
echo "📚 NIVEL 10: Batalla Final 2 - Scripting Intermedio"
echo
echo "🎯 Misión:"
echo "1. Crea un directorio llamado 'Arena_Boss'"
echo "2. Dentro de él, crea 5 archivos: archivo1.txt a archivo5.txt"
echo "3. Cada archivo debe tener un número aleatorio de líneas (entre 10 y 20)"
echo "4. Ordena los archivos por tamaño y muestra la lista ordenada"
echo "5. Si algún archivo contiene la palabra 'Victory', muévelo a 'Victory_Archive'"
echo
echo "🧱 Prerrequisitos:"
echo "- Tu script debe llamarse: boss_battle2.sh"
echo "- Cuando ejecutes este nivel, Arena_Boss y Victory_Archive se reinician automáticamente"
echo "- Escribe 'check' para verificar tu solución"
echo "- Escribe 'reset' para reiniciar las carpetas manualmente"
echo "- Presiona ENTER para volver al menú principal después de completar"
echo

# Auto-reset folders
rm -rf Arena_Boss Victory_Archive
mkdir Arena_Boss Victory_Archive

echo "♻️  Carpetas reiniciadas. Por favor vuelve a ejecutar tu script boss_battle2.sh ahora."
echo

while true; do
  read -rp "> " input
  case $input in
    check)
      echo "🔍 Verificando resultados de boss_battle2.sh..."
      pass=true

      archivo_count=$(find Arena_Boss Victory_Archive -maxdepth 1 -name "archivo*.txt" 2>/dev/null |
wc -l)
      if [[ "$archivo_count" -ne 5 ]]; then
        echo "❌ Se esperaban 5 archivos entre Arena_Boss y Victory_Archive pero se encontraron $archivo_count"
        pass=false
      fi

      for archivo in Arena_Boss/archivo*.txt Victory_Archive/archivo*.txt; do
        if [[ -f "$archivo" ]]; then
          line_count=$(wc -l < "$archivo" | tr -d ' ')
          if (( line_count < 10 || line_count > 20 )); then
            echo "❌ $archivo tiene $line_count líneas (se esperaban 10–20)."
            pass=false
          fi
        fi
      done

      moved_archivos=$(find Victory_Archive -name "archivo*.txt")
      if [[ -n "$moved_archivos" ]]; then
        echo "✅ Archivos movidos a Victory_Archive:"
        echo "$moved_archivos"
      else
        echo "⚠️ No se movieron archivos a Victory_Archive (quizás ninguno tenía 'Victory')"
      fi

      if $pass; then
        echo "✅ ¡Nivel 10 completado!"
        echo
        echo "👉 Puedes escribir 'reset' para intentar de nuevo"
        echo "o simplemente presiona ENTER para volver al menú principal."
      else
        echo "❌ Nivel 10 aún no completado. Corrige los problemas e intenta de nuevo."
      fi
      ;;
    reset)
      echo "♻️  Reiniciando carpetas..."
      rm -rf Arena_Boss Victory_Archive
      mkdir Arena_Boss Victory_Archive
      echo "✅ Reinicio completado. Vuelve a ejecutar tu script boss_battle2.sh y escribe 'check' de nuevo."
      ;;
    "")
      echo
      read -rp "Presiona ENTER para volver al menú principal..."
      break
      ;;
    *)
      echo "Entrada inválida. Escribe 'check', 'reset', o presiona ENTER para salir."
      ;;
  esac
done

