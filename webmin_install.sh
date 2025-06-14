#!/bin/bash

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt update
sudo apt upgrade -y

# Instalar dependencias necesarias
echo "Instalando dependencias..."
sudo apt install -y software-properties-common apt-transport-https wget gnupg2

# Añadir la clave del repositorio de Webmin
echo "Añadiendo la clave del repositorio de Webmin..."
wget -qO - http://www.webmin.com/jcameron-key.asc | sudo apt-key add -

# Añadir el repositorio de Webmin
echo "Añadiendo el repositorio de Webmin..."
sudo sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'

# Actualizar lista de paquetes e instalar Webmin
echo "Actualizando lista de paquetes e instalando Webmin..."
sudo apt update
sudo apt install -y webmin

# Finalización
echo "Webmin ha sido instalado correctamente. Puedes acceder a Webmin en https://<tu_direccion_ip>:10000/"
