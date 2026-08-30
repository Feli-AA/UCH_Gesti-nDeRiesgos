# Informe de Despliegue y Configuración Inicial de SimpleRisk

## 1. Despliegue del Entorno
El despliegue de la plataforma SimpleRisk se realizó en un entorno local utilizando una máquina virtual con Ubuntu Server. Se utilizó una arquitectura contenerizada mediante Docker para garantizar la portabilidad y el aislamiento del sistema. 

El proceso de instalación fue documentado en un script de aprovisionamiento (`setup.sh`) y, simultáneamente, se estructuró un archivo `docker-compose.yml` para habilitar el despliegue declarativo de los servicios. A pesar de presentarse interrupciones de red durante la descarga de la imagen que requirieron ajustes temporales para estabilizar la conexión, el contenedor se ejecutó exitosamente, exponiendo los puertos web estándar (80 y 443) hacia la red local.

## 2. Configuración de Roles y Usuarios
En primer lugar, se crearon roles personalizados desde el panel de administración, definiendo las responsabilidades. Luego se dieron de alta tres perfiles de usuario diferenciados:
*   **Analista de Riesgos (Perfil Operativo):** Con permisos exclusivos para la identificación, carga y modificación técnica de riesgos, así como la planificación de mitigaciones.
*   **Auditor (Perfil de Control):** Con acceso restringido a la carga de datos, pero con permisos habilitados para revisar riesgos, iniciar auditorías y gestionar el módulo de cumplimiento (Compliance).
*   **Administrador (Perfil Gerencial):** Con acceso irrestricto a la configuración global, gobernanza y gestión de usuarios.

## 3. Carga del Primer Riesgo
A modo de validación del flujo operativo del sistema, se procedió a cargar un riesgo inicial utilizando el perfil de Analista. El riesgo documentado ("Ataque de denegación de servicio al campus virtual") fue extraído de la matriz de riesgos del Plan de Seguridad Informática del Colegio Universitario Del Sur (trabajo realizado anteriormente en la materia "Auditoría" del primer semestre de 4to año). Se parametrizaron los activos afectados, la vulnerabilidad y se aplicó la metodología clásica de evaluación (Probabilidad x Impacto) para calcular el nivel de criticidad inicial del activo dentro del sistema.
