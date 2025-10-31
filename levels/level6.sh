#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 6: Análisis de Argumentos"
echo
echo "🎯 Misión:"
echo "1. Crea un script llamado 'count_lines.sh'"
echo "2. Al ejecutarse con un nombre de archivo como argumento, debe imprimir el número de líneas en ese archivo"
echo "3. Si no se proporciona ningún argumento, debe imprimir: No archivo provided"
echo
echo "🧱 Prerrequisitos:"
echo "- El script debe llamarse exactamente: count_lines.sh"
echo "- El script debe usar \$1 para acceder al primer argumento"
echo "- Si no se proporciona ningún argumento, debe imprimir: No archivo provided"
echo "- Si se pasa un archivo válido, debe imprimir solo el número de líneas (ej. 3)"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea un nuevo archivo de script llamado: count_lines.sh"
echo "2. Dentro de él, verifica si se proporciona un argumento (\$1)"
echo "3. Si no se proporciona, imprime: No archivo provided"
echo "4. Si se pasa un nombre de archivo, imprime el número de líneas en ese archivo"
echo "5. Crea un archivo de prueba así: echo -e 'one\\ntwo\\nthree' > testarchivolevel6.txt"
echo "6. Ejecuta tu script así: ./count_lines.sh testarchivolevel6.txt"
echo "7. Salida esperada en este caso: 3"
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
        echo "❌ El script no usa \$1 para acceder al argumento."
        success=false
      fi

      # Test 1: No argument
      no_arg_output=$(bash count_lines.sh 2>/dev/null)
      if [[ "$no_arg_output" != *"No archivo provided"* ]]; then
        echo "❌ Falta el mensaje o es incorrecto cuando no se proporciona ningún argumento."
        success=false
      fi

      # Test 2: With a test archivo
      echo -e "line1\nline2\nline3" > testarchivo.txt
      with_arg_output=$(bash count_lines.sh testarchivo.txt 2>/dev/null | tr -d '[:space:]')
      if [[ "$with_arg_output" != "3" && "$with_arg_output" != "3testarchivo.txt" ]]; then
        echo "❌ Se esperaba que la salida fuera '3' al pasar un archivo de 3 líneas."
        success=false
      fi
      rm -f testarchivo.txt

      if [[ "$success" == true ]]; then
        echo "✅ ¡Nivel 6 completado! Te estás volviendo experto."
        break
      else
        echo -e "\n⚠️ Una o más verificaciones fallaron. Actualiza count_lines.sh e inténtalo de nuevo."
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

