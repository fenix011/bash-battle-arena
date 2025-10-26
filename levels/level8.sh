#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 8: Búsqueda en Archivos"
echo
echo "🎯 Misión:"
echo "1. Crea un script llamado 'search_logs.sh'"
echo "2. Debe accept one argument: a word or phrase to search for"
echo "3. Search through all .log archivos in the current directorio"
echo "4. Print only the names of archivos that contain the search word"
echo
echo "🧱 Prerrequisitos:"
echo "- The script must be llamado exactly: search_logs.sh"
echo "- Output should list only matching archivonames, one per line"
echo "- Sin espacios en blanco extra or archivo contents should be printed"
echo "- Output must be sorted (optional but ensures consistency)"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea un script named: search_logs.sh"
echo "2. Your script must accept one argument — a word to search for"
echo "3. Debe search for that word inside all '.log' archivos in the current directorio"
echo "4. For every .log archivo that contains the word, print ONLY the archivoname (one per line)"
echo "   - Do NOT print the matched line or any extra text"
echo
echo "🔧 Example:"
echo "   ./search_logs.sh error"
echo
echo "📂 About the test archivos:"
echo "• You do NOT need to create your own .log archivos."
echo "• When you type 'check', this level will automatically create test .log archivos for you."
echo "• These archivos will contain a mix of logs with and without the word 'error'."
echo "• Your script should detect which archivos contain 'error' and print just their names."
echo
echo "🧹 To clear all test logs and start fresh, run:"
echo "   rm -f *.log"
echo
echo "✅ When you're ready, type: check (en esta ventana)"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input

  case $input in
    exit)
      echo "Saliendo del Nivel 8."
      break
      ;;
    check)
      echo
      echo "🔍 Preparing test environment..."

      # Cleanup any old log archivos
      rm -f *.log

      # Create test log archivos
      echo "This is a clean log." > clean.log
      echo "An error occurred here." > test1.log
      echo "Just another line." > test2.log
      echo "Critical error detected." > test3.log

      # Run user script with 'error' as argument
      echo "Running: ./search_logs.sh error"
      output=$(bash ./search_logs.sh error 2>/dev/null | sed 's/ *$//' | sort)

      # Expected output (sorted)
      expected=$(echo -e "test1.log\ntest3.log")

      if [[ "$output" == "$expected" ]]; then
        echo
        echo "✅ ¡Éxito! Your script correctly found matching archivos."
        echo
        echo "🔎 Search term used: 'error'"
        echo
        echo "📂 Matching archivos:"
        echo "$output"
        echo
        echo "📄 Example matches:"
        for archivo in $output; do
          match=$(grep -i 'error' "$archivo" | head -1)
          echo "- $archivo: $match"
        done
        break
      else
        echo "❌ Salida incorrecta."
        echo
        echo "Expected:"
        echo "$expected"
        echo
        echo "Tu salida:"
        echo "$output"
        echo
        echo "💡 Tip: Print only the archivonames (not contents), one per line, no extra spaces."
      fi
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' to verify your solution or 'exit' to quit."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."

