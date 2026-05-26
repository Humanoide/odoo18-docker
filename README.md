# odoo18-docker

## El script instala-odoo18.sh hace lo siguiente:
1. Ejecuta el script **prepareserver.sh** , que crea swap de 3 Gb, instala mc, docker, docker compose, portainer y webmin.
2. Se detiene y nos invita a crearle la **contraseña provisional a portainer**, debe ser 000000000000 , (doce ceros). Para ello debemos ir a http://[ipdelamaquina]:9000
3. Ejecuta el script **deploy-odoo18-portainer.sh** que hace una instalación de odoo
4. Ejecuta el script **prepare_modules_config.sh** que añade fichero de configuracion y modulos OCA a la instalación de odoo
5. Ejecuta el script **execute_modules_install.sh** que descarga repositorios oca
6. Ejecuta el script **execute_requirements.sh** que carga las librerias python en el contenedor de odoo.
7. Ejecuta el script **deploy-npm-portainer.sh** que instala nginx proxy manager

## Contraseñas
Posteriormente hay que cambiar las contraseñas. Estas se pueden obtener con el script **hoja_claves.sh**
