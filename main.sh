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

# --- Bucle del Menú Principal ---
while true; do
  show_ascii_art
  echo ""
  echo "Selecciona un nivel (1–15) o escribe 'q' para salir:"
  echo "  q - Salir del juego"
  for i in {1..15}; do
    echo "  Nivel $i - $(head -1 lessons/lesson$i.txt)"
  done
  echo ""
  read -p "Ingresa el número de nivel (o 'q' para salir): " level
  echo ""

  if [[ "$level" == "q" || "$level" == "Q" ]]; then
    echo "Saliendo del juego. ¡Adiós!"
    break
  elif [[ "$level" =~ ^[1-9]$|^1[0-5]$ ]]; then
    ./levels/level$level.sh
  else
    echo "❌ Entrada inválida. Por favor ingresa 1–15 o 'q' para salir."
    sleep 1.5
  fi
done
