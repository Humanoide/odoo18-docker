#!/usr/bin/env bash
set -euo pipefail

FILE="/data/compose/1/addons/modules_install_18.txt"

echo "== Ejecutando: $FILE =="

if [[ ! -f "$FILE" ]]; then
  echo "❌ No existe el fichero: $FILE"
  exit 1
fi

# Ejecuta el TXT como script bash
bash "$FILE"

echo "✔ Ejecución terminada"
