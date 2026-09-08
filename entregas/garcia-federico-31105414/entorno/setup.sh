#!/bin/bash
# Script para levantar el entorno de SimpleRisk usado en este trabajo practico

# Descarga la imagen oficial de SimpleRisk desde DockerHub
docker pull simplerisk/simplerisk

# Levanta el contenedor exponiendo los puertos 80 (HTTP) y 443 (HTTPS)
docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk

echo "SimpleRisk deberia estar disponible en https://localhost/"
echo "Al entrar por primera vez, el navegador va a advertir sobre el certificado"
echo "autofirmado. Hay que aceptar el riesgo para continuar."
