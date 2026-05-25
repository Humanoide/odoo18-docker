# prepare_modules_config.sh (actualizado)

```bash
#!/usr/bin/env bash
set -euo pipefail

###############################################################################
# CONFIGURACIÓN MÓDULOS ODOO 18
# - Copia fichero de configuración de módulos
# - Ejecuta instalación automática modules_install_18.txt
###############################################################################

#######################################
# CONFIG
#######################################
SOURCE_FILE="./modules_install_18.txt"
DEST_DIR="/opt/odoo/config"
DEST_FILE="$DEST_DIR/modules_install_18.txt"

#######################################
# CHECK ROOT
#######################################
if [[ "$(id -u)" -ne 0 ]]; then
    echo "❌ Ejecuta como root"
    exit 1
fi

#######################################
# CREATE DEST
#######################################
mkdir -p "$DEST_DIR"

#######################################
# COPY FILE
#######################################
if [[ -f "$SOURCE_FILE" ]]; then
    echo "== Copiando modules_install_18.txt =="
    cp "$SOURCE_FILE" "$DEST_FILE"
else
    echo "❌ No existe $SOURCE_FILE"
    exit 1
fi

#######################################
# PERMISSIONS
#######################################
chmod +x "$DEST_FILE" || true

#######################################
# EJECUCIÓN AUTOMÁTICA (NUEVO)
#######################################
# Ejecuta el fichero justo después de copiarlo

echo "== Ejecutando instalación de módulos Odoo 18 =="

if command -v bash >/dev/null 2>&1; then
    bash "$DEST_FILE"
else
    echo "❌ bash no disponible"
    exit 1
fi

#######################################
# FIN
#######################################
echo "✔ Configuración de módulos completada"
```
