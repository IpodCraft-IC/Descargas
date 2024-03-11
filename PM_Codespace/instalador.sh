#!/bin/bash

# Descarga y descomprime los siguientes archivos: [iniciar_server.sh, actualizar_server.sh, playit_on.sh y playit_off.sh]
curl -L https://github.com/IpodCraft-IC/PM_CodeSpace/archive/master.tar.gz | tar -xz --strip-components=1

# Se le dan permisos a los archivos para que los pueda ejecutar el usuario.
chmod +x iniciar_server.sh
chmod +x actualizar_server.sh
chmod +x playit_on.sh
chmod +x playit_off.sh

# Se inatala playit.gg
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update
sudo apt install playit -y

# Crea y entrar en el directorio del servidor.
mkdir PocketMine-MP_Server
cd PocketMine-MP_Server/

# Descarga e instala todos los archivos necesario de PocketMine-MP.
#wget -q -O - https://get.pmmp.io | bash -s -
curl -sL https://get.pmmp.io | bash -s -

# Borrar los archivos basura de la instalación.
rm -r CONTRIBUTING.md
rm -r LICENSE
rm -r README.md

# Borramos el archivo instalador.sh y enviamos un mensaje para saber que la instalación finalizó!
rm -r ../instalador.sh
echo -e "Instalación Completa!"