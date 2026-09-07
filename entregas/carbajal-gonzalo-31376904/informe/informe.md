# Informe del TP: Gestión de Riesgos con SimpleRisk

## Parte A — Instalación y Configuración Básica

### Instalación

SimpleRisk se instaló mediante Docker Compose, usando la imagen oficial
`simplerisk/simplerisk:latest` (ver `entorno/docker-compose.yml`). El servicio se publica
en `https://localhost:8444/` (HTTPS) y `http://localhost:8081/` (redirige a HTTPS). Se
usaron puertos no estándar (8081/8444 en lugar de 80/443) porque el puerto 80 ya estaba
ocupado por otro proceso en el host de desarrollo.

Pasos: `docker compose up -d` desde `entorno/`, y completar el asistente inicial
("Default Admin Account Creation") con credenciales ficticias.

### Usuarios y roles

Se crearon 3 usuarios con roles diferenciados (detalle completo en
`configuracion/usuarios.md`):

- `admin_demo` — rol **Administrator** (nativo de SimpleRisk).
- `analista_demo` — rol custom **Analista de Riesgos**, creado en *Settings → Role
  Management* con permisos operativos sobre Risk Management (alta/modificación de
  riesgos, planificación y aceptación de mitigaciones, gestión de proyectos) y acceso a
  Asset Management. Sin permisos administrativos.
- `auditor_demo` — rol custom **Auditor**, con permisos de solo revisión/comentario sobre
  riesgos (sin crear, modificar ni cerrar) y acceso al módulo Compliance (iniciar/modificar
  auditorías, aprobar tests) más vista de excepciones en Governance.

Los roles custom se diseñaron aplicando el principio de mínimo privilegio: cada uno tiene
únicamente los permisos necesarios para su función, evitando que el analista pueda auditar
su propio trabajo con permisos de administrador ni que el auditor pueda alterar el registro
de riesgos que está revisando (segregación de funciones).

### Riesgo de prueba

Se creó un riesgo de prueba ("Riesgo de prueba — validación de instalación", ID #1001)
para validar el funcionamiento end-to-end de la instalación. Resultado: riesgo Inherente y
Residual de 1.6 (Low), coherente con los valores de Likelihood "Unlikely" e Impact "Minor"
cargados — confirma que el motor de scoring de SimpleRisk funciona correctamente.

## Parte B — Escenario Real (Cliente SIGA)

_Pendiente._

## Parte C — Análisis Crítico y Profundización

_Pendiente._

## Parte D — Actividad Optativa

_Pendiente._
