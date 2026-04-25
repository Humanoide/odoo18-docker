#!/usr/bin/env bash
set -euo pipefail

PORTAINER_URL="http://localhost:9000"
USER="admin"
PASS="000000000000"

echo "== Login Portainer =="

RESPONSE=$(curl -s -X POST "$PORTAINER_URL/api/auth" \
  -H "Content-Type: application/json" \
  -d "{\"Username\":\"$USER\",\"Password\":\"$PASS\"}")

echo "DEBUG LOGIN RESPONSE:"
echo "$RESPONSE"

TOKEN=$(echo "$RESPONSE" | jq -r '.jwt // empty')

if [[ -z "$TOKEN" ]]; then
  echo "❌ ERROR: no se pudo obtener token"
  exit 1
fi

echo "✔ Token OK"

echo "== Creando stack Nginx Proxy Manager =="

RESPONSE_STACK=$(curl -s -X POST "$PORTAINER_URL/api/stacks" \
  -H "Authorization: Bearer $TOKEN" \
  -F "Name=npm" \
  -F "file=@npm-compose.yml")

echo "DEBUG STACK RESPONSE:"
echo "$RESPONSE_STACK"

echo "✅ Stack NPM creado"
