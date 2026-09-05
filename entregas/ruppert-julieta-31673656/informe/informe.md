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

## 4. Matriz de Riesgos y Planes de Mitigación (Escenario Clínico)
Tras validar el funcionamiento básico de SimpleRisk, se procedió a documentar la matriz de riesgos de una clínica privada simulada (120 empleados, 800 pacientes diarios), estructurando 7 riesgos específicos evaluados mediante la metodología clásica y proponiendo tratamientos orientados a mitigar las brechas más críticas.

### Resumen de Riesgos Identificados
1. **Infección por Ransomware (Crítico - 20):** Cifrado de bases de datos por falta de backups inmutables. Tratamiento: Mitigar.
2. **Fraude por Phishing al área de finanzas (Crítico - 16):** Compromiso de cuentas por ausencia de MFA. Tratamiento: Mitigar.
3. **Exposición de datos por exceso de privilegios (Alto - 12):** Uso de credenciales genéricas en recepción. Tratamiento: Mitigar.
4. **Interrupción de Obras Sociales por corte de ISP (Alto - 12):** Dependencia de un único enlace de red. Tratamiento: Mitigar.
5. **Apagón general del Data Center local (Alto - 10):** Capacidad de UPS insuficiente ante cortes eléctricos. Tratamiento: Transferir / Mitigar.
6. **Robo de dispositivos físicos (Medio - 9):** Notebooks de guardia sin cifrado en zonas de tránsito. Tratamiento: Mitigar.
7. **Destrucción de equipos por incendio (Medio - 5):** Cuarto de servidores con extintores manuales de polvo. Tratamiento: Mitigar.

### Planes de Acción Prioritarios (Riesgos Altos y Críticos)
Para contener las amenazas de mayor impacto institucional, se desarrollaron los siguientes planes de tratamiento dentro de la plataforma:
* **Plan 1 (Ransomware):** Despliegue de una arquitectura de copias de seguridad 3-2-1 inmutables fuera de línea y reemplazo de antivirus por EDR. *(Vencimiento: 30/10/2026 - Presupuesto: $5,500 USD - Responsable: Gerencia de TI)*.
* **Plan 2 (Phishing):** Activación obligatoria de Autenticación Multifactor (MFA) e implementación de simulacros de concientización. *(Vencimiento: 15/10/2026 - Presupuesto: $1,200 USD - Responsable: Gerencia Financiera)*.
* **Plan 3 (Excepciones de Privilegios):** Transición a Control de Acceso Basado en Roles (RBAC) y eliminación de cuentas compartidas en recepción. *(Vencimiento: 15/11/2026 - Presupuesto: $0 - Responsable: Jefe de Recepción)*.