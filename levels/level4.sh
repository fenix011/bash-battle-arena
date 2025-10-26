#!/bin/bash
clear

# --- INSTRUCCIONES ---
echo
echo "📚 NIVEL 4: Manipulación de Archivos"
echo
echo "🎯 Misión:"
echo "1. Copia todos los archivos .txt del directorio 'Arena'"
echo "2. Pégalos en un nuevo directorio llamado 'Backup'"
echo
echo "🧱 Prerrequisitos:"
echo "- El directorio 'Arena' debe existir ya"
echo "- Solo archivos .txt dentro de 'Arena' deben ser copiados"
echo "- El directorio 'Backup' debe ser creado manualmente"
echo
echo "🖥️ Cómo completarlo:"
echo "1. Usa 'cp' con un comodín para copiar todos los archivos .txt"
echo "2. Asegúrate de que los archivos copiados estén dentro de 'Backup/'"
echo "3. Puedes abrir una segunda ventana de terminal para trabajar mientras este verificador permanece abierto"
echo "4. Si es necesario, elimina el directorio Backup usando: rm -r Backup"
echo "5. Escribe: check (en esta ventana) cuando esté listo"
echo

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -p $'\nEscribe "check" para verificar tu solución o "exit" para salir: ' input
  case $input in
    check)
      if [[ ! -d Arena ]]; then
        echo "❌ El directorio Arena no existe. Por favor créalo primero."
        continue
      fi

      txt_count=$(find Arena -maxdepth 1 -name "*.txt" | wc -l)

      if [[ ! -d Backup ]]; then
        echo "❌ Directorio Backup no encontrado."
      elif [[ $(find Backup -maxdepth 1 -name "*.txt" | wc -l) -lt $txt_count ]]; then
        echo "❌ No todos los archivos .txt fueron copiados a Backup. Verifica tu comando cp."
      else
        echo "✅ ¡Todos los archivos .txt de Arena fueron copiados exitosamente a Backup!"
        break
      fi
      ;;
    exit)
      echo "Saliendo del Nivel 4..."
      break
      ;;
    *)
      echo "Entrada inválida. Por favor escribe 'check' o 'exit'."
      ;;
  esac
done

read -p "Presiona Enter para volver al menú..."
