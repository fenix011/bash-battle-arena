#!/bin/bash
clear
cat lessons/lesson13.txt
echo ""
echo "Mission: [Insert mission instructions here for Level 13]"
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      echo "⚠️  Checker not yet implemented for Level 13."
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
