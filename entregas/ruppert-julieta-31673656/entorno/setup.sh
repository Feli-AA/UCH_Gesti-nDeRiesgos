#!/bin/bash

# Actualización e instalación de dependencias para utilizar Docker
sudo apt update
sudo apt install docker.io -y

# Configuración del servicio Docker
sudo systemctl enable --now docker
sudo usermod -aG docker $USER

# Despliegue de SimpleRisk
sudo docker pull simplerisk/simplerisk
sudo docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk

echo "Despliegue finalizado. Ingresar a https://ip_vm>/"
