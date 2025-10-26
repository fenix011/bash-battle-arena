#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 7: Sorting Archivos by Size"
echo
echo "🎯 Misión:"
echo "1. Scan all .txt archivos in the current directorio"
echo "2. Sort them by size (smallest to largest)"
echo "3. Output the result to a archivo called: sort_output.txt"
echo "4. Each line must follow this format: archivoname - SIZE bytes"
echo
echo "🧱 Prerrequisitos:"
echo "- All .txt archivos must be scanned (excluding sort_output.txt itself)"
echo "- Output must be sorted numerically by size"
echo "- Output must be saved in a archivo named: sort_output.txt"
echo "- Output lines must look exactly like: example.txt - 42 bytes"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Create and save your script as sort_txt_by_size.sh"
echo "2. Use 'stat' or 'wc -c' to get archivo sizes"
echo "   • macOS users: stat -f%z archivoname"
echo "   • Linux users: stat -c%s archivoname"
echo "3. Use 'sort -k3 -n' to sort by size"
echo "4. Escribe: check (en esta ventana) cuando estés listo"
echo "⚠️ Important: If you create or change any .txt archivos, you must re-run your script before 
checking!"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input

  case $input in
    exit)
      echo "Saliendo del Nivel 7..."
      break
      ;;
    check)
      echo
      echo "🔍 Checking sort_output.txt..."
      output_archivo="sort_output.txt"

      if [[ ! -f "$output_archivo" ]]; then
        echo "❌ '$output_archivo' no encontrado. Run your script before checking."
        continue
      fi

      # Build expected output
      expected=""
      for archivo in *.txt; do
        [[ "$archivo" == "$output_archivo" ]] && continue

        if [[ -f "$archivo" ]]; then
          if [[ "$(uname)" == "Darwin" ]]; then
            size=$(stat -f%z "$archivo")
          else
            size=$(stat -c%s "$archivo")
          fi
          expected+="$archivo - $size bytes"$'\n'
        fi
      done

      # Sort expected output and clean blank lines
      expected_sorted=$(echo "$expected" | sed '/^$/d' | sort -k3 -n)

      # Clean actual output
      actual=$(cat "$output_archivo" | sed '/^$/d')

      if [[ "$expected_sorted" == "$actual" ]]; then
        echo "✅ ¡Éxito! Your output is correct and sorted."
        break
      else
        echo "❌ Incorrect output in $output_archivo. Here's the difference:"
        diff <(echo "$expected_sorted") <(echo "$actual")
      fi
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' to verify your solution or 'exit' to quit."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."

