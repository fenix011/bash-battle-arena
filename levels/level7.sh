#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 7: Ordenar Archivos por Tamaño"
echo
echo "🎯 Misión:"
echo "1. Escanea todos los archivos .txt en el directorio actual"
echo "2. Ordénalos por tamaño (del más pequeño al más grande)"
echo "3. Guarda el resultado en un archivo llamado: sort_output.txt"
echo "4. Cada línea debe seguir este formato: nombrearchivo - TAMAÑO bytes"
echo
echo "🧱 Prerrequisitos:"
echo "- Todos los archivos .txt deben ser escaneados (excluyendo sort_output.txt)"
echo "- La salida debe estar ordenada numéricamente por tamaño"
echo "- La salida debe guardarse en un archivo llamado: sort_output.txt"
echo "- Las líneas de salida deben verse exactamente así: ejemplo.txt - 42 bytes"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea y guarda tu script como sort_txt_by_size.sh"
echo "2. Usa 'stat' o 'wc -c' para obtener los tamaños de archivo"
echo "   • Usuarios de macOS: stat -f%z nombrearchivo"
echo "   • Usuarios de Linux: stat -c%s nombrearchivo"
echo "3. Usa 'sort -k3 -n' para ordenar por tamaño"
echo "4. Escribe: check (en esta ventana) cuando estés listo"
echo "⚠️ Importante: Si creas o modificas algún archivo .txt, debes volver a ejecutar tu script antes de verificar!"
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
      echo "🔍 Verificando sort_output.txt..."
      output_archivo="sort_output.txt"

      if [[ ! -f "$output_archivo" ]]; then
        echo "❌ '$output_archivo' no encontrado. Ejecuta tu script antes de verificar."
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
        echo "✅ ¡Éxito! Tu salida es correcta y está ordenada."
        break
      else
        echo "❌ Salida incorrecta en $output_archivo. Aquí está la diferencia:"
        diff <(echo "$expected_sorted") <(echo "$actual")
      fi
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' para verificar tu solución o 'exit' para salir."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."

