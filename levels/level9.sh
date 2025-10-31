#!/bin/bash

# --- LESSON + INSTRUCTIONS ---
clear
echo "📚 NIVEL 9: Monitor de Cambios en Directorio"
echo
echo "🎯 Misión: Escribe un script que:"
echo "- Tome una ruta de directorio como argumento"
echo "- Capture el estado actual de ese directorio"
echo "- Espere a que el usuario haga cambios (como agregar/eliminar archivos)"
echo "- Capture el nuevo estado"
echo "- Registre la diferencia con una marca de tiempo en un archivo: changes.log"
echo
echo "🧱 Prerrequisitos:"
echo "1. Crea un directorio de prueba, ej. test_dir"
echo "2. Coloca al menos 1–2 archivos dentro de él"
echo "3. Tu script debe llamarse: monitor_changes.sh"
echo
echo "🖥️ Cómo completarlo:"
echo "- Abre esta terminal (la ventana del juego)"
echo "- En una segunda terminal, ejecuta: ./monitor_changes.sh test_dir"
echo "- Esperará después del primer snapshot — no presiones ENTER aún"
echo "- En una *tercera terminal*, modifica test_dir (agrega/elimina archivos)"
echo "- Luego presiona ENTER en la segunda terminal"
echo
echo "📄 Salida esperada en changes.log:"
echo "- Una línea mostrando la marca de tiempo (ej. ==== Mon Jul 1 22:30:41 BST 2025 ===="
echo "- Seguida de cualquier línea que cambió, comenzando con '<' o '>'"
echo "- Tu script debe sobrescribir changes.log en cada ejecución (no agregar)"
echo
echo "💡 Consejo: Si tu script no detecta cambios, asegúrate de estar modificando el directorio entre snapshots."
echo
echo "Escribe 'check' para verificar tu solución o 'exit' para salir."

# --- BUCLE DE VERIFICACIÓN ---
while true; do
  read -rp "> " input
  case $input in
    check)
      echo "🔍 Verificando salida..."

      if [[ ! -f "changes.log" ]]; then
        echo "❌ changes.log no encontrado."
        continue
      fi

      if [[ ! -s "changes.log" ]]; then
        echo "❌ changes.log existe pero está vacío."
        continue
      fi

      if ! grep -q "^==== .* ====" changes.log; then
        echo "❌ Falta la línea de marca de tiempo en changes.log."
        continue
      fi

      if ! grep -Eq '^<|^>' changes.log; then
        echo "❌ No se detectaron cambios en changes.log."
        echo "💡 Consejo: ¿Realmente modificaste el directorio antes de presionar ENTER?"
        continue
      fi

      echo
      echo "✅ ¡Éxito! Tu log capturó los siguientes cambios:"
      echo
      grep -E '^<|^>' changes.log | head -10
      echo
      echo "📅 Marca de tiempo:"
      grep "^==== .* ====" changes.log | tail -1
      echo

      break
      ;;
    exit)
      echo "Saliendo del Nivel 9."
      break
      ;;
    *)
      echo "❌ Entrada inválida. Escribe 'check' para verificar o 'exit' para salir."
      ;;
  esac
done

echo
read -p "Presiona ENTER para volver al menú principal..."

