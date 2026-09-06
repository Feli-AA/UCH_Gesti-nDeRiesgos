# Trabajo Práctico: Gestión de Riesgos con SimpleRisk

## Datos Personales

- **Nombre completo:** Valentín Moya
- **LU:** 31176220
- **Email:** valemoyafernandez@gmail.com
- **Comisión:** Tarde

## Instrucciones para Levantar el Entorno

El entorno completo de SimpleRisk se levanta con Docker Compose. Requisitos previos: tener Docker y Docker Compose instalados.

1. Parado en la carpeta `entorno/` de esta entrega, ejecutar:

```bash
   docker compose up -d
```

2. Esperar a que el contenedor esté en estado `healthy` (verificar con `docker compose ps`).

3. Acceder desde el navegador a **https://localhost:8443** (aceptar la advertencia de certificado autofirmado). *Nota: es necesario usar el puerto 8443 con HTTPS; el puerto 8080 (HTTP) redirige internamente a un puerto no expuesto y no es accesible directamente.*

4. Las credenciales de los 3 usuarios creados (administrador, analista de riesgos, auditor) están documentadas por rol en `configuracion/usuarios.md` (sin contraseñas, por política de seguridad de la cátedra).

5. Para probar la integración con Discord (Parte C / actividad D2), ver el script `scripts/simplerisk_discord_alert.sh` y su documentación en `informe/informe.md`.

## Decisiones de Diseño

- **Imagen Docker:** se utilizó la imagen oficial `simplerisk/simplerisk`, que incluye el stack completo (Apache + PHP + MySQL) en un único contenedor, priorizando la reproducibilidad y simplicidad de instalación.
- **Metodología de riesgos:** se utilizó la matriz clásica de Probabilidad × Impacto (escala 1-5) que trae SimpleRisk por defecto, complementada con una comparación crítica contra la metodología FAIR en `informe/informe.md`.
- **Escenario:** se definieron 7 riesgos específicos para el escenario de la clínica privada de 120 empleados propuesto por la cátedra, cubriendo las categorías de confidencialidad, integridad, disponibilidad y aspectos legales/operativos.
- **Integración externa:** se optó por Discord (vía webhook) en lugar de la API REST oficial de SimpleRisk, ya que esta última es un módulo pago no incluido en la instalación Core/gratuita utilizada en este TP. La integración consulta directamente la base de datos interna del contenedor.

## Verificación

Se confirma la lectura completa del enunciado del trabajo práctico. Palabra clave: **girasol**.

## Checklist de Auto-Revisión

- [x] No hay credenciales en el repositorio
- [x] El archivo `.gitignore` está correctamente configurado
- [x] Las capturas no muestran datos sensibles
- [x] Los archivos `.sql` o dumps no están subidos
- [x] El informe está en formato legible
- [x] El reporte ejecutivo está completo
- [x] Los mensajes de commit son descriptivos
- [x] Mi branch está actualizada y funciona
