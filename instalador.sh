#!/bin/bash

# Descarga los archivos [playit_on.sh, playit_off.sh, iniciar_server.sh, actualizar_server.sh,]
curl -L https://github.com/IpodCraft-IC/PM_CodeSpace/archive/master.tar.gz | tar -xz --strip-components=1

# Se le da permisos de ejecución a los archivos: [iniciar_server_bedrock.sh, actualizar_server.sh, playit_on.sh, playit_off.sh]
chmod +x iniciar_server.sh
chmod +x actualizar_server.sh
chmod +x playit_on.sh
chmod +x playit_off.sh

# Instalación de Playit.gg
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update
sudo apt install playit -y

# Crea el directorio donde se instalara el servidor y entrar en el directorio
mkdir PocketMine-MP_Server
cd PocketMine-MP_Server/

# Descarga e Instala PocketMine-MP y los archivos necesarios para funcionar.
# Esto lo descarga desde la página oficial de PocketMine-MP.
# Si no te funciona el "wget" usa "curl"
wget -q -O - https://get.pmmp.io | bash -s -
#curl -sL https://get.pmmp.io | bash -s -

# Borra los archivos basura que no son necesarios.
rm -r CONTRIBUTING.md
rm -r README.md
rm -r LICENSE

echo -e "Instalación Finalizada!"