#!/bin/bash
set -e
echo "Levantando entorno SimpleRisk..."
docker compose up -d
echo "Esperando a que la base de datos esté lista..."
sleep 20
echo "SimpleRisk disponible en https://localhost:8443"