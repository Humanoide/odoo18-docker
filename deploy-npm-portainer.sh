#!/usr/bin/env bash
set -euo pipefail

PORTAINER_URL="http://localhost:9000"
USER="admin"
PASS="000000000000"

echo "== Login Portainer =="

TOKEN=$(curl -s -X POST "$PORTAINER_URL/api/auth" \
  -H "Content-Type: application/json" \
  -d '{"Username":"'"$USER"'","Password":"'"$PASS"'"}' \
  | jq -r .jwt)

if [[ -z "$TOKEN" || "$TOKEN" == "null" ]]; then
  echo "❌ Error obteniendo token"
  exit 1
fi

echo "== Creando stack Nginx Proxy Manager =="

curl -s -X POST "$PORTAINER_URL/api/stacks" \
  -H "Authorization: Bearer $TOKEN" \
  -F "Name=npm" \
  -F "file=@npm-compose.yml"

echo "✅ Stack NPM creado"
