#!/bin/bash
clear

# --- LECCIÓN / INSTRUCCIONES ---
cat lessons/lesson2.txt
echo
echo "📚 NIVEL 2: Fundamentos de Bucles"
echo
echo "🎯 Misión:"
echo "1. Escribe un script llamado 'script2.sh'"
echo "2. Debe mostrar los números del 1 al 10, un número por línea"
echo
echo "🧱 Prerrequisitos:"
echo "- El archivo debe llamarse exactamente: script2.sh"
echo "- La salida debe ser los números del 1 al 10, cada uno en su propia línea"
echo "- Sin espacios en blanco extra ni prompts en la salida"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Crea un nuevo archivo de script Bash"
echo "2. Dentro de él, usa un bucle para imprimir números del 1 al 10"
echo "3. Hazlo ejecutable y pruébalo"
echo "4. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      if [[ ! -f script2.sh ]]; then
        echo "❌ script2.sh no encontrado."
      else
        output=$(bash script2.sh 2>&1)
        correct=$(seq 1 10)

        if [[ "$output" == "$correct" ]]; then
          echo "✅ ¡Salida correcta!"
          break
        else
          echo "❌ Salida incorrecta."
          echo
          echo "Tu salida:"
          echo "$output"
          echo
          echo "Salida esperada:"
          echo "$correct"
        fi
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 2..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."
