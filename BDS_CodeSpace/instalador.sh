#!/bin/bash

# Establece la versión a instalar del servidor
# Lista de versiones: 
bds_version="1.20.61.01"

# Establece si quieres descargar versiones oficiales o versiones beta/preview
# "bin-linux" - Esto establece para descargar versiones oficiales.
# "bin-linux-preview" - Esto establece para descargar versiones beta/preview.
bds_prefijo="bin-linux"

curl -L https://github.com/IpodCraft-IC/BDS_CodeSpace/archive/master.tar.gz | tar -xz --strip-components=1

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

# Crear directorio donde se instalara el servidor y entrar en el directorio
mkdir Minecraft_Bedrock_Server
cd Minecraft_Bedrock_Server

# Descargar los archivos del servidor, descomprimirlos y por ultimo eliminar el zip
wget "https://minecraft.azureedge.net/${bds_prefijo}/bedrock-server-${bds_version}.zip"
unzip "bedrock-server-${bds_version}.zip"
rm -r bedrock-server-${bds_version}.zip

# Borramos el archivo instalador.sh y enviamos un mensaje para saber que la instalación finalizó!
rm -r ../instalador.sh
echo -e "Instalación Finalizada!"