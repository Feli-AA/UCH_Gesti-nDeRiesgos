\# REPORTE EJECUTIVO DE GESTIÓN DE RIESGOS DE CIBERSEGURIDAD



\*\*Dirigido a:\*\* Directorio de la Clínica Privada  

\*\*Elaborado por:\*\* Responsable de Ciberseguridad (Ignacio De Paz)  

\*\*Fecha:\*\* Septiembre de 2026  



\---



\## 1. Resumen Ejecutivo

Análogamente a la historia del \*\*Lobo Feroz y Caperucita Roja\*\*, las amenazas externas (ciberdelincuentes) no atacan siempre por la fuerza bruta, sino que emplean engaños como el \*Phishing\* para disfrazarse de contactos legítimos y vulnerar nuestros activos más valiosos (la Historia Clínica Digital y los datos de pacientes). La ciberseguridad requiere visibilidad activa y educación continua para evitar caer en estas trampas.



\---



\## 2. Top 5 Riesgos Prioritarios



| ID | Riesgo / Amenaza | Nivel de Riesgo | Valoración (P x I) |

| :--- | :--- | :---: | :---: |

| \*\*R01\*\* | Compromiso de credenciales por Phishing | \*\*Crítico\*\* | \*\*16\*\* (4 x 4) |

| \*\*R02\*\* | Infección por Ransomware en servidor de HCD | \*\*Alto\*\* | \*\*15\*\* (3 x 5) |

| \*\*R03\*\* | Fuga de datos de pacientes mediante USB en consultorios | \*\*Alto\*\* | \*\*12\*\* (4 x 3) |

| \*\*R06\*\* | Corrupción de Backups e imposibilidad de restauración | \*\*Alto\*\* | \*\*12\*\* (3 x 4) |

| \*\*R07\*\* | Riesgo de incendio o filtración física en el Data Center | \*\*Alto\*\* | \*\*10\*\* (2 x 5) |



\---



\## 3. Estado de los Planes de Acción

Basado en la parábola de \*\*Los Tres Cerditos\*\*, nuestro modelo de defensa actual no puede sostenerse sobre estructuras frágiles de paja o madera (antivirus tradicionales o políticas solo en papel). Debemos construir una fortaleza de ladrillo con capas de contención robustas e inmutables:



1\. \*\*Plan 1 (Para R01):\*\* Implementación de Autenticación Multifactor (MFA) y programa continuo de concienciación.  

&#x20;  \* \*\*Inversión estimada:\*\* USD $1,200.

2\. \*\*Plan 2 (Para R02 y R06):\*\* Despliegue de tecnología EDR en endpoints y esquema de copias de seguridad inmutables/offline.  

&#x20;  \* \*\*Inversión estimada:\*\* USD $3,500.

3\. \*\*Plan 3 (Para R03):\*\* Bloqueo centralizado de puertos USB por Directivas de Grupo (GPO).  

&#x20;  \* \*\*Inversión estimada:\*\* USD $0 (Recursos internos).



\---



\## 4. Recomendaciones para el Directorio

1\. \*\*Aprobación Presupuestaria:\*\* Priorizar de manera inmediata la partida de inversión para MFA y EDR para mitigar los riesgos Crítico y Alto sobre la HCD.

2\. \*\*Infraestructura Física Obligatoria:\*\* Relocalización inmediata del servidor central. Por especificación técnica estricta, \*\*los Data Centers nunca deben ubicarse al lado de cocinas (riesgo crítico de incendio) ni debajo de piletas o cañerías principales (riesgo crítico de filtración e inundación)\*\*.

