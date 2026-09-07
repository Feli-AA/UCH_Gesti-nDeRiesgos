#!/bin/bash
# ==============================================================================
# Script de Respaldo Automatizado - SimpleRisk DB
# Mitigación técnica para Riesgo R06 (Fallas en Backups)
# ==============================================================================

BACKUP_DIR="./backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
CONTAINER_NAME="simplerisk-db"
DB_NAME="simplerisk"
DB_USER="simplerisk"
DB_PASS="simplerisk"

# Crear directorio de backups si no existe
mkdir -p "$BACKUP_DIR"

echo "[+] Iniciando respaldo de la base de datos SimpleRisk..."

# Ejecución del dump de MySQL dentro del contenedor Docker
docker exec "$CONTAINER_NAME" mysqldump -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" > "$BACKUP_DIR/simplerisk_backup_$TIMESTAMP.sql" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "[✓] Respaldo completado con éxito: $BACKUP_DIR/simplerisk_backup_$TIMESTAMP.sql"
else
    echo "[✗] Error: No se pudo generar el respaldo. Verifique que el contenedor Docker esté en ejecución."
    exit 1
fi