# Informe técnico — Gestión de Riesgos

## 1. Implementación inicial

Se desplegó SimpleRisk en un entorno local reproducible mediante Docker Compose. La arquitectura separa la aplicación SimpleRisk de la base de datos MySQL 8 y utiliza volúmenes de Docker para conservar los datos, las cargas y los logs entre reinicios.

El acceso se realiza localmente mediante HTTPS en `https://localhost`. El certificado es autofirmado y se utiliza únicamente para el entorno de práctica; no corresponde a una configuración de producción.

Las instrucciones detalladas de inicio, diagnóstico y resguardo de secretos se encuentran en `../entorno/README.md`.

## 2. Usuarios y permisos

Se configuraron tres cuentas ficticias con responsabilidades diferenciadas: administrador, analista de riesgos y auditor. Los roles aplican el principio de mínimo privilegio: el administrador gestiona la instancia, el analista trabaja sobre los riesgos y el auditor consulta evidencias sin modificar el registro.

El detalle se documenta en `../configuracion/usuarios.md`.

## 3. Validación funcional

Se registró el riesgo de prueba `PRUEBA-001`, referido al acceso no autorizado a historias clínicas electrónicas. Su propósito fue verificar el funcionamiento del formulario de carga, la asignación de propietario, la asociación de activos y la metodología de puntuación Classic.

El detalle del registro se documenta en `../configuracion/riesgos.md`.

## 4. Evidencias disponibles

| Archivo | Contenido |
|---|---|
| `capturas/01-admin-demo.png` | Usuario administrador de demostración. |
| `capturas/02-analista-demo.png` | Usuario analista de riesgos de demostración. |
| `capturas/03-auditor-demo.png` | Usuario auditor de demostración. |
| `capturas/04-riesgo-prueba.png` | Riesgo de prueba registrado en SimpleRisk. |

