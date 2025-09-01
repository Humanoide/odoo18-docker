#!/bin/bash
################################################################################
# Script para instalar Docker, Docker Compose y Portainer CE en Ubuntu 24.04
################################################################################

set -e

# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar dependencias
sudo apt install -y ca-certificates curl gnupg lsb-release

# Añadir clave GPG oficial de Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Añadir repositorio de Docker
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Instalar Docker y Docker Compose
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Habilitar y arrancar Docker
sudo systemctl enable docker
sudo systemctl start docker

# Crear red por defecto si no existe
sudo docker network create my-main-net || true

# Crear carpeta para datos de Portainer
mkdir -p $HOME/portainer_data

# Instalar Portainer CE con puerto 9000
sudo docker run -d \
  -p 8000:8000 \
  -p 9000:9000 \
  --name portainer \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/portainer_data:/data \
  --network=my-main-net \
  portainer/portainer-ce:latest

echo "=================================================================="
echo "✅ Instalación completada"
echo "Accede a Portainer en: http://TU_IP:9000"
echo "=================================================================="
