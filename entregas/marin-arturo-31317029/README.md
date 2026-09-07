# Entrega — TP Gestión de Riesgos con SimpleRisk

**Nombre completo:** Arturo Marín
**LU:** 31317029
**Email institucional:** marinarturo@uch.edu.ar
**Comisión:** G

## Cómo levantar el entorno

Requisitos: Docker o Podman con soporte de `docker compose` / `podman-compose`.

```bash
cd entorno/
# crear entorno/.env con el siguiente contenido (no versionado, ver .gitignore):
#   DB_SETUP_PASS=Passw0rd!Demo
#   MYSQL_ROOT_PASSWORD=Passw0rd!Demo
docker compose up -d
```

Esperar ~30 segundos a que MySQL inicialice. Acceder a:

- **https://localhost:8443** (HTTPS — usar esta URL directamente, certificado autofirmado, aceptar el warning del navegador)
- No usar `http://localhost:8080` directamente: SimpleRisk redirige internamente a `https://localhost/` (puerto 443 implícito) y puede confundir al navegador si no se navega a la URL HTTPS de forma explícita.

En el primer acceso, SimpleRisk pide crear la cuenta de administrador inicial (usuario `admin_demo`, contraseña ficticia `Passw0rd!Demo` usada en este TP).

## Decisiones de diseño

- **Metodología de riesgos:** matriz clásica Probabilidad × Impacto (escala 1-5), consistente con el motor "Clásico" de SimpleRisk. Se documentó explícitamente la diferencia entre el nivel calculado con la matriz de la cátedra (rango 1-25) y el score interno de SimpleRisk (normalizado a 0-10) — ver `informe/informe.md`, sección 3.1 y 4.1.
- **Supuestos del escenario:** clínica privada ficticia de 120 empleados y ~800 pacientes/día (dato dado por la consigna), con activos críticos = servidor de historias clínicas electrónicas y servidor de facturación.
- **Entorno de despliegue:** Docker Compose con el stack oficial de SimpleRisk (`simplerisk-minimal` + `mysql:8.0` + `namshi/smtp`), en lugar de OVA/Vagrant, por reproducibilidad y menor peso del repositorio.
- **Credenciales:** todas las contraseñas usadas son ficticias (`Passw0rd!Demo`), aisladas en `entorno/.env` (no versionado) tras detectar en la Parte D que el `docker-compose.yml` original las tenía hardcodeadas.
- **Propietario de riesgos:** por simplicidad del entorno de laboratorio (un solo administrador de TI real), todos los riesgos quedaron asignados a `admin_demo`, documentado como "Responsable de TI" en `configuracion/riesgos.md`.

## Verificación

Palabra clave de verificación de lectura completa de la consigna: **girasol**.

## Estructura de la entrega

```
├── README.md                  # este archivo
├── .gitignore
├── entorno/
│   ├── docker-compose.yml
│   └── .env                   # NO versionado (ver .gitignore) — credenciales ficticias
├── informe/
│   ├── informe.md             # desarrollo completo del TP (Partes A-D)
│   └── capturas/
├── configuracion/
│   ├── usuarios.md            # usuarios y permisos (sin contraseñas)
│   └── riesgos.md             # registro de los 7 riesgos de la clínica
└── reporte-ejecutivo/
    └── reporte.pdf            # reporte ejecutivo (1 página, para el directorio)
```

## Checklist de Auto-Revisión

- [x] No hay credenciales en el repositorio.
- [x] El archivo `.gitignore` está correctamente configurado.
- [x] Las capturas de pantalla no muestran datos sensibles.
- [x] Los archivos `.sql` o dumps no están subidos.
- [x] El informe está en un formato legible.
- [x] El reporte ejecutivo está completo.
- [x] Los mensajes de commit son descriptivos.
- [x] Mi branch está actualizada y funciona correctamente.
