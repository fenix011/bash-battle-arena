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

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 5: Batalla Final 1 - Combinar Conceptos"
echo
echo "🎯 Misión:"
echo "1. Crea un directorio llamado 'Battlefield'"
echo "2. Dentro de él, crea los archivos: knight.txt, sorcerer.txt y rogue.txt"
echo "3. Mueve 'knight.txt' a un nuevo directorio llamado 'Archive'"
echo "4. (Opcional) Lista el contenido de ambos directorios para verificar"
echo
echo "🧱 Prerrequisitos:"
echo "- El directorio 'Battlefield' debe existir"
echo "- 'sorcerer.txt' y 'rogue.txt' deben permanecer en Battlefield"
echo "- 'knight.txt' debe ser movido de Battlefield a Archive"
echo "- Debes crear manualmente el directorio 'Archive' antes de mover knight.txt"
echo "- Archive debe existir y contener knight.txt"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Usa 'mkdir' y 'touch' para crear directorios y archivos"
echo "2. Usa 'mv' para mover knight.txt"
echo "3. Nota: El comando 'mv' NO crea carpetas — usa 'mkdir Archive' primero"
echo "4. Puedes abrir una segunda terminal para trabajar mientras esta permanece abierta"
echo "5. Si es necesario, reinicia con: rm -r Battlefield Archive"
echo "6. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      success=true

      if [[ ! -d Battlefield ]]; then
        echo "❌ Directorio Battlefield no encontrado."
        success=false
      fi

      if [[ ! -f Battlefield/sorcerer.txt ]]; then
        echo "❌ sorcerer.txt no encontrado en Battlefield."
        success=false
      fi

      if [[ ! -f Battlefield/rogue.txt ]]; then
        echo "❌ rogue.txt no encontrado en Battlefield."
        success=false
      fi

      if [[ -f Battlefield/knight.txt ]]; then
        echo "❌ knight.txt debería haber sido movido de Battlefield."
        success=false
      fi

      if [[ ! -d Archive ]]; then
        echo "❌ Directorio Archive no encontrado."
        success=false
      fi

      if [[ ! -f Archive/knight.txt ]]; then
        echo "❌ knight.txt no encontrado en Archive."
        success=false
      fi

      if [[ "$success" == true ]]; then
        echo "✅ ¡Batalla Final 1 completada! Todas las verificaciones pasaron."
        break
      else
        echo -e "\n⚠️ Una o más verificaciones fallaron. Ejecuta tu script boss1.sh nuevamente e intenta de nuevo."
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 5..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."
