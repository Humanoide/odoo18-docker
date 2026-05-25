#!/usr/bin/env bash
set -euo pipefail

CONTAINER="odoo18-web-1"
SCRIPT_PATH="/mnt/extra-addons/requirements_oca.sh"

echo "== Comprobando contenedor $CONTAINER =="

if ! docker ps --format '{{.Names}}' | grep -qx "$CONTAINER"; then
  echo "❌ El contenedor $CONTAINER no está en ejecución"
  exit 1
fi

echo "== Ejecutando script dentro del contenedor =="

docker exec -it "$CONTAINER" bash -c "
if [ ! -f '$SCRIPT_PATH' ]; then
  echo '❌ No existe el script dentro del contenedor: $SCRIPT_PATH'
  exit 1
fi

chmod +x '$SCRIPT_PATH'
bash '$SCRIPT_PATH'
"

echo "✔ Script ejecutado correctamente dentro de Odoo"
