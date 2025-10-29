#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 3: Condicionales"
echo
echo "🎯 Misión:"
echo "1. Escribe un script llamado 'hero_check.sh'"
echo "2. Debe verificar si el archivo 'Arena/hero.txt' existe"
echo "3. Si existe, imprime: Hero found!"
echo "4. Si no existe, imprime: Hero missing!"
echo
echo "🧱 Prerrequisitos:"
echo "- El archivo debe llamarse exactamente: hero_check.sh"
echo "- El script debe verificar 'Arena/hero.txt'"
echo "- Debe mostrar exactamente uno de los dos mensajes"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea un nuevo script Bash"
echo "2. Usa una declaración if para verificar si el archivo existe"
echo "3. Usa echo para imprimir el mensaje correcto"
echo "4. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      if [[ -f hero_check.sh ]]; then
        output=$(bash hero_check.sh 2>&1)

        if [[ "$output" == "Hero found!" || "$output" == "Hero missing!" ]]; then
          echo "✅ Salida aceptada: $output"
          break
        else
          echo "❌ Salida incorrecta."
          echo
          echo "Tu salida:"
          echo "$output"
          echo
          echo "Salida esperada:"
          echo "'Hero found!' o 'Hero missing!' (exactamente así, en inglés)"
        fi
      else
        echo "❌ Falta hero_check.sh. Por favor escribe tu script de solución y guárdalo como hero_check.sh"
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 3..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."
