#!/bin/bash
clear

# --- LECCIÓN / INSTRUCCIONES ---
cat lessons/lesson1.txt
echo
echo "📚 NIVEL 1: Configuración de Arena"
echo
echo "🎯 Misión:"
echo "1. Crea un directorio llamado 'Arena'"
echo "2. Dentro de él, crea tres archivos: warrior.txt, mage.txt y archer.txt"
echo "3. Lista el contenido del directorio para confirmar que están ahí"
echo
echo "🧱 Prerrequisitos:"
echo "- Debes nombrar el directorio exactamente: Arena"
echo "- Los archivos deben estar dentro del directorio Arena"
echo "- Tu directorio de trabajo debe ser esta carpeta Bash Arena"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Usa la terminal para crear el directorio y los archivos"
echo "2. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      if [[ ! -d Arena ]]; then
        echo "❌ Directorio 'Arena' no encontrado."
      else
        missing_archivos=()
        [[ ! -f Arena/warrior.txt ]] && missing_archivos+=("warrior.txt")
        [[ ! -f Arena/mage.txt ]] && missing_archivos+=("mage.txt")
        [[ ! -f Arena/archer.txt ]] && missing_archivos+=("archer.txt")

        if [[ ${#missing_archivos[@]} -eq 0 ]]; then
          echo "✅ ¡Éxito! Todos los archivos requeridos están presentes en Arena."
          break
        else
          echo "❌ Archivo(s) faltante(s) en Arena: ${missing_archivos[*]}"
        fi
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 1..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."
