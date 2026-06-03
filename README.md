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

# Notas IA

Perfecto, tengo la lista completa de ficheros y el README. Puedo hacer el análisis directamente.

Según el README, el flujo de instalación invoca estos scripts en orden: `instala-odoo18.sh` → `prepareserver.sh` → `deploy-odoo18-portainer.sh` → `prepare_modules_config.sh` → `execute_modules_install.sh` → `execute_requirements.sh` → `deploy-npm-portainer.sh`, y luego `hoja_claves.sh` para contraseñas.

Aquí tienes la clasificación de todos los ficheros:

---

## ✅ ÚTILES — Intervienen en el proceso de instalación

| Fichero | Rol |
|---|---|
| `instala-odoo18.sh` | **Orquestador principal** — arranca todo el proceso |
| `prepareserver.sh` | Paso 1 — Prepara el servidor (swap, mc, docker, portainer, webmin) |
| `deploy-odoo18-portainer.sh` | Paso 3 — Despliega Odoo 18 vía Portainer |
| `prepare_modules_config.sh` | Paso 4 — Añade `odoo.conf` y módulos OCA |
| `execute_modules_install.sh` | Paso 5 — Descarga repositorios OCA |
| `execute_requirements.sh` | Paso 6 — Instala librerías Python en el contenedor |
| `deploy-npm-portainer.sh` | Paso 7 — Instala Nginx Proxy Manager |
| `hoja_claves.sh` | Post-instalación — Genera hoja de contraseñas |
| `odoo.conf` | Configuración de Odoo (usado por `prepare_modules_config.sh`) |
| `odoo18-docker-compose.yml` | Docker Compose de Odoo (usado por `deploy-odoo18-portainer.sh`) |
| `npm-compose.yml` | Docker Compose de NPM (usado por `deploy-npm-portainer.sh`) |
| `modules_install_18.txt` | Lista de módulos OCA a instalar (leído por alguno de los scripts) |
| `makeswap.sh` | Probablemente llamado desde `prepareserver.sh` para crear swap |
| `setup_base_force_swap.sh` | Variante/complemento del swap, posiblemente llamado desde prepareserver |
| `requirements_oca.sh` | Instalación de dependencias OCA, probablemente llamado desde `execute_requirements.sh` |

---

## ❓ DUDOSOS — Relacionados pero su rol no está claro en el flujo principal

| Fichero | Observación |
|---|---|
| `orquestador.sh` | Parece un orquestador alternativo o una versión anterior de `instala-odoo18.sh` — ¿duplicado? |
| `docker-portainer.sh` | Podría ser llamado desde `prepareserver.sh` para instalar Docker+Portainer |
| `odoo_expose.yml` | Variante del compose que expone puertos directamente (sin NPM) — útil pero no está en el flujo del README |
| `odoologrotate.yaml` | Rotación de logs — no está en el flujo pero es operacional |
| `firewall` | Configuración de firewall — no mencionado en el README |
| `update_all_modules.sh` | Mantenimiento post-instalación, no es de instalación inicial |
| `update_oca.sh` | Actualización de módulos OCA, ídem |
| `actualiza.sh` | Actualización general, ídem |

---

## 🗑️ BASURA — Ficheros de notas, borrador o información redundante

| Fichero | Por qué no sirve |
|---|---|
| `dockerinstall.txt` | Notas/comandos sueltos sobre instalación de Docker — sustituido por scripts |
| `webmininstall.txt` | Notas sobre instalación de Webmin — sustituido por `webmin_install.sh` |
| `webmin_install.sh` | Instalación de Webmin — ya está integrada en `prepareserver.sh` según el README |
| `nginxproxymanager.txt` | Notas sobre NPM — sustituido por el compose y el script |
| `configuraciones_npm.txt` | Notas de configuración manual de NPM |
| `parametros_instalacion_local.txt` | Parece un borrador de parámetros — no lo llama nadie |
| `Actualización de la bd de Odoo.txt` | Notas manuales sobre actualización de BD |

---

## 📁 CARPETAS — Pendiente de revisar contenido

| Carpeta | Observación |
|---|---|
| `docker_instals-main/` | Posiblemente una versión antigua del sistema de instalación |
| `login_user_detail/` | Podría ser parte del módulo custom o algo de HTML para la hoja de claves |
| `supermodulo18/` | Módulo Odoo custom — podría ser parte activa del despliegue o un extra |

¿Quieres que me meta dentro de alguna de esas carpetas o que revise algún script concreto para confirmar si se llama o no desde el flujo principal?
