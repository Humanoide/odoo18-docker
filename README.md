# odoo18-docker

## El script instala-odoo18.sh hace lo siguiente:
1. Ejecuta el script prepareserver.sh , que crea swap de 3 Gb, instala mc, docker, docker compose, portainer y webmin.
2. Se detiene y nos invita a crearle la contraseña provisional a portainer, debe ser 000000000000 , (doce ceros). Para ello debemos ir a http://[ipdelamaquina]:9000
3. Ejecuta el script deploy-odoo18-portainer.sh que hace una instalación de odoo
