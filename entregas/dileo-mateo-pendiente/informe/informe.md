\# Informe del Trabajo Práctico: Gestión de Riesgos con SimpleRisk



\## 1. Introducción



El presente trabajo práctico tiene como objetivo aplicar un proceso de gestión de riesgos de seguridad mediante SimpleRisk. Para ello se utiliza el escenario simulado de una clínica privada con 120 empleados, una atención aproximada de 800 pacientes diarios y sistemas que administran historias clínicas digitales, información de obras sociales y datos de facturación.



El trabajo comprende la instalación reproducible de SimpleRisk, la configuración de usuarios con responsabilidades diferenciadas, la identificación y evaluación de riesgos, la definición de planes de tratamiento y el análisis crítico de la metodología utilizada.



\## 2. Instalación y configuración del entorno



SimpleRisk fue instalado localmente mediante Docker Desktop sobre Windows y WSL 2. Se utilizó la imagen oficial `simplerisk/simplerisk`.



Para facilitar la reproducción del entorno se creó un archivo `docker-compose.yml`, junto con un script `setup.ps1` para Windows. La aplicación se configuró para utilizar los puertos locales 8081 para HTTP y 8444 para HTTPS.



El acceso a la aplicación se realiza mediante:



```text

https://localhost:8444



3\. Configuración de usuarios y permisos



Se crearon tres usuarios con responsabilidades diferenciadas:



Usuario	Función	Responsabilidades

admin\_clinica	Administrador de Seguridad	Administración general, configuración y gestión de usuarios.

analista\_riesgos	Analista de Riesgos	Registro y modificación de riesgos, planificación de mitigaciones y administración de proyectos.

auditor\_clinica	Auditor de Seguridad	Revisión de riesgos y registro de observaciones sin capacidad de modificación.



Los permisos se asignaron aplicando el principio de mínimo privilegio y procurando separar las tareas de registro, modificación, revisión y aprobación.



Las contraseñas utilizadas no se documentan ni se incluyen en el repositorio.



4\. Riesgo de prueba



Antes de registrar los riesgos definitivos se creó el riesgo TEST-001, denominado “Vulnerabilidad técnica en el sistema de turnos”.



Este registro permitió verificar:



La creación y evaluación de riesgos.

El funcionamiento del método de puntuación Classic.

La asociación de activos.

La visualización del riesgo inherente y residual.



El riesgo fue evaluado con nivel bajo y no forma parte del análisis definitivo.



5\. Escenario y supuestos



El análisis se realizó considerando los siguientes supuestos:



La clínica utiliza sistemas digitales para las historias clínicas y los turnos.

Los empleados utilizan correo electrónico y credenciales individuales.

Existen controles básicos, pero la auditoría externa detectó debilidades en su gestión.

La organización dispone de antivirus, contraseñas y copias de seguridad básicas.

No se asume la existencia de autenticación multifactor, protección EDR, segmentación completa ni pruebas periódicas de recuperación.

Todos los datos, usuarios y activos registrados son ficticios.

6\. Metodología de evaluación



Se utilizó una matriz de probabilidad e impacto con valores de 1 a 5.



Valor	Probabilidad	Impacto

1	Muy improbable	Insignificante

2	Poco probable	Menor

3	Posible	Moderado

4	Probable	Grave

5	Muy probable	Crítico



El nivel académico se calculó mediante:



Nivel de riesgo = Probabilidad × Impacto



Los resultados fueron clasificados de la siguiente manera:



Resultado	Clasificación

1 a 4	Bajo

5 a 9	Medio

10 a 16	Alto

17 a 25	Crítico



SimpleRisk utiliza internamente el método Classic, por lo que los valores numéricos mostrados por la aplicación pueden diferir de la multiplicación académica. Sin embargo, se mantuvo la escala de 1 a 5 para justificar la probabilidad y el impacto de manera uniforme.



7\. Riesgos identificados



Se registraron siete riesgos específicos del contexto de la clínica:



Ataque de ransomware sobre las historias clínicas digitales.

Acceso no autorizado mediante credenciales comprometidas.

Campaña de phishing dirigida al personal.

Alteración accidental o maliciosa de historias clínicas.

Falla en las copias de seguridad y recuperación.

Indisponibilidad del sistema clínico por falla de infraestructura.

Pérdida o robo de dispositivos con información clínica.



El detalle completo de categorías, activos, niveles, controles y tratamientos se encuentra en configuracion/riesgos.md.



8\. Planes de acción



Se crearon tres planes de acción asociados a riesgos críticos.



8.1. Protección y recuperación frente a ransomware

Responsable: Administrador de Seguridad.

Fecha de vencimiento: 15 de diciembre de 2026.

Presupuesto estimado: USD 30.000.

Estado inicial: No iniciado.

Acciones: estrategia de copias 3-2-1, protección EDR, autenticación multifactor, segmentación de red, actualizaciones y pruebas de recuperación.

8.2. Fortalecimiento del control de acceso

Responsable: Administrador de Seguridad.

Fecha de vencimiento: 30 de noviembre de 2026.

Presupuesto estimado: USD 15.000.

Estado inicial: No iniciado.

Acciones: autenticación multifactor, mínimo privilegio, eliminación de cuentas compartidas y revisiones trimestrales de permisos.

8.3. Prevención y detección de phishing

Responsable: Analista de Riesgos.

Fecha de vencimiento: 31 de octubre de 2026.

Presupuesto estimado: USD 10.000.

Estado inicial: No iniciado.

Acciones: protección avanzada del correo, autenticación multifactor, capacitación y simulaciones trimestrales.

9\. Evidencias



En la carpeta informe/capturas se incorporarán capturas de:



Pantalla principal de SimpleRisk.

Usuarios y permisos configurados.

Listado de riesgos.

Detalle de un riesgo crítico.

Planes de mitigación.

Inventario de activos verificados.



Las capturas no deberán contener contraseñas, credenciales ni información personal real.

