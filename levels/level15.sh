#!/bin/bash
clear
cat lessons/lesson15.txt
echo ""
echo "Mission: [Insert mission instructions here for Level 15]"
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      echo "⚠️  Checker not yet implemented for Level 15."
      ;;
    exit)
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done
read -p "Presiona Enter para volver al menú..."
