#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 6: Análisis de Argumentos"
echo
echo "🎯 Misión:"
echo "1. Crea un script llamado 'count_lines.sh'"
echo "2. When run with a archivoname as an argument, it should print the number of lines in that 
archivo"
echo "3. If no argument is provided, it should print: No archivo provided"
echo
echo "🧱 Prerrequisitos:"
echo "- Script must be llamado exactly: count_lines.sh"
echo "- The script must use \$1 to access the first argument"
echo "- If no argument is given, it must print: No archivo provided"
echo "- If a valid archivo is passed, it must print just the line count (e.g. 3)"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Create a new script archivo named: count_lines.sh"
echo "2. Dentro de él, check if an argument (\$1) is provided"
echo "3. If not provided, print: No archivo provided"
echo "4. If a archivoname is passed, print the number of lines in that archivo"
echo "5. Create a test archivo like this: echo -e 'one\\ntwo\\nthree' > testarchivolevel6.txt"
echo "6. Run your script like this: ./count_lines.sh testarchivolevel6.txt"
echo "7. Expected output in this case: 3"
echo "8. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      success=true

      if [[ ! -f count_lines.sh ]]; then
        echo "❌ count_lines.sh script no encontrado."
        success=false
      elif ! grep -q '\$1' count_lines.sh; then
        echo "❌ Script does not use \$1 to access the argument."
        success=false
      fi

      # Test 1: No argument
      no_arg_output=$(bash count_lines.sh 2>/dev/null)
      if [[ "$no_arg_output" != *"No archivo provided"* ]]; then
        echo "❌ Missing or incorrect message when no argument is given."
        success=false
      fi

      # Test 2: With a test archivo
      echo -e "line1\nline2\nline3" > testarchivo.txt
      with_arg_output=$(bash count_lines.sh testarchivo.txt 2>/dev/null | tr -d '[:space:]')
      if [[ "$with_arg_output" != "3" && "$with_arg_output" != "3testarchivo.txt" ]]; then
        echo "❌ Expected output to be '3' when passing a 3-line archivo."
        success=false
      fi
      rm -f testarchivo.txt

      if [[ "$success" == true ]]; then
        echo "✅ Level 6 complete! You're getting sharp."
        break
      else
        echo -e "\n⚠️ One or more checks failed. Update count_lines.sh and retry."
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 6..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."

