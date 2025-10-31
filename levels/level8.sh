#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 8: Búsqueda en Archivos"
echo
echo "🎯 Misión:"
echo "1. Crea un script llamado 'search_logs.sh'"
echo "2. Debe aceptar un argumento: una palabra o frase a buscar"
echo "3. Busca en todos los archivos .log del directorio actual"
echo "4. Imprime solo los nombres de los archivos que contienen la palabra buscada"
echo
echo "🧱 Prerrequisitos:"
echo "- El script debe llamarse exactamente: search_logs.sh"
echo "- La salida debe listar solo los nombres de archivos coincidentes, uno por línea"
echo "- No deben imprimirse espacios en blanco extra ni contenido de archivos"
echo "- La salida debe estar ordenada (opcional pero asegura consistencia)"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea un script llamado: search_logs.sh"
echo "2. Tu script debe aceptar un argumento — una palabra a buscar"
echo "3. Debe buscar esa palabra dentro de todos los archivos '.log' del directorio actual"
echo "4. Por cada archivo .log que contenga la palabra, imprime SOLO el nombre del archivo (uno por línea)"
echo "   - NO imprimas la línea coincidente ni ningún texto extra"
echo
echo "🔧 Ejemplo:"
echo "   ./search_logs.sh error"
echo
echo "📂 Acerca de los archivos de prueba:"
echo "• NO necesitas crear tus propios archivos .log."
echo "• Cuando escribas 'check', este nivel creará automáticamente archivos .log de prueba para ti."
echo "• Estos archivos contendrán una mezcla de logs con y sin la palabra 'error'."
echo "• Tu script debe detectar qué archivos contienen 'error' e imprimir solo sus nombres."
echo
echo "🧹 Para limpiar todos los logs de prueba y empezar de nuevo, ejecuta:"
echo "   rm -f *.log"
echo
echo "✅ Cuando estés listo, escribe: check (en esta ventana)"
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
      echo "🔍 Preparando entorno de prueba..."

      # Cleanup any old log archivos
      rm -f *.log

      # Create test log archivos
      echo "This is a clean log." > clean.log
      echo "An error occurred here." > test1.log
      echo "Just another line." > test2.log
      echo "Critical error detected." > test3.log

      # Run user script with 'error' as argument
      echo "Ejecutando: ./search_logs.sh error"
      output=$(bash ./search_logs.sh error 2>/dev/null | sed 's/ *$//' | sort)

      # Expected output (sorted)
      expected=$(echo -e "test1.log\ntest3.log")

      if [[ "$output" == "$expected" ]]; then
        echo
        echo "✅ ¡Éxito! Tu script encontró correctamente los archivos coincidentes."
        echo
        echo "🔎 Término de búsqueda usado: 'error'"
        echo
        echo "📂 Archivos coincidentes:"
        echo "$output"
        echo
        echo "📄 Ejemplos de coincidencias:"
        for archivo in $output; do
          match=$(grep -i 'error' "$archivo" | head -1)
          echo "- $archivo: $match"
        done
        break
      else
        echo "❌ Salida incorrecta."
        echo
        echo "Esperado:"
        echo "$expected"
        echo
        echo "Tu salida:"
        echo "$output"
        echo
        echo "💡 Consejo: Imprime solo los nombres de archivo (no el contenido), uno por línea, sin espacios extra."
      fi
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' para verificar tu solución o 'exit' para salir."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."

