#!/bin/bash

# Se descargan y descomprimen los archivos: [iniciar.sh, actualizar.sh, playit_on.sh, playit_off.sh y run.sh].
curl -L https://github.com/IpodCraft-IC/GeyserMC_CodeSpace/archive/master.tar.gz | tar -xz --strip-components=1

# Se les da permisos de ejecución a los archivos: [iniciar.sh, actualizar.sh, playit_on.sh y playit_off.sh].
chmod +x iniciar.sh
chmod +x actualizar.sh
chmod +x playit_on.sh
chmod +x playit_off.sh

# Instalación de playit.gg
curl -SsL https://playit-cloud.github.io/ppa/key.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/playit.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/playit.gpg] https://playit-cloud.github.io/ppa/data ./" | sudo tee /etc/apt/sources.list.d/playit-cloud.list
sudo apt update
sudo apt install playit -y

# Se crea y entra al directorio del Proxy GeyserMC.
mkdir GeyserMC
cd GeyserMC/

# Descargarmos el .jar de GeyserMC.
curl -L https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone -o Geyser-Standalone.jar

# Se mueve el archivo run.sh al directorio del Proxy GeyserMC.
mv ../run.sh ../GeyserMC/

# Se le da permiso de ejecución al archivo: [run.sh].
chmod +x run.sh

# Se elimina el archivo de instalación y se envia un aviso de Instalación Completa.
#rm -r instalador.sh
echo -e "Instalación Completada!"