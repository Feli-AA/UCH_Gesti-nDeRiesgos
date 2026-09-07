# TP: Gestión de Riesgos con SimpleRisk

## Datos personales

- **Nombre completo:** Facundo Calderón
- **LU/DNI:** 46162078
- **Email institucional:** calderonfacundo@uch.edu.ar

## Cómo levantar el entorno

## Requisitos previos
- Windows 11 con WSL2 habilitado
- Docker Desktop instalado (backend WSL2, instalación "Per-user")

### Pasos

1. Descargar la imagen de SimpleRisk desde DockerHub:
   ```
   docker pull simplerisk/simplerisk
   ```

2. Levantar el contenedor:
   ```
   docker run --name simplerisk -d -p 80:80 -p 443:443 simplerisk/simplerisk
   ```

3. Acceder desde el navegador a `https://localhost/`. El navegador va a mostrar una advertencia de
   certificado no confiable, (SimpleRisk usa un certificado autofirmado en este entorno de
   desarrollo) aceptar la excepción para continuar

4. Completar el formulario de **Default Admin Account Creation** con credenciales ficticias
   (ver sección de Decisiones de Diseño)

## Decisiones de diseño

- **Sistema operativo de trabajo:** Windows 11 con Docker Desktop (backend WSL2), ya que la guía
  original de la cátedra estaba orientada a Linux pero los comandos de Docker son
  multiplataforma y no requirieron adaptación funcional, solo la instalación previa de
  Docker Desktop
- **Metodología de riesgos:** Se utilizó el método clásico de SimpleRisk (Probabilidad × Impacto),
  con las categorías propias de la herramienta (Access Management, Technical Vulnerability
  Management, Sensitive Data Management, Environmental Resilience, Physical Security,
  Third-Party Management), mapeadas conceptualmente a los criterios de
  confidencialidad/integridad/disponibilidad/legal/operativo
- **Escenario elegido:** Clínica privada de 120 empleados y 800 pacientes/día, con foco en historias clínicas digitales, facturación con
  obras sociales y los hallazgos de una auditoría externa previa
- **Usuarios y roles:** se crearon 3 usuarios con credenciales ficticias
  (`admin_demo`, `analista_riesgos`, `auditor_demo`), aplicando separación de funciones:
  el analista puede proponer y modificar riesgos pero no cerrarlos, y el auditor solo tiene
  permisos de revisión y auditoría, sin capacidad de edición
- **Reporte ejecutivo:** se optó por generar el documento de forma independiente, tomando como fuente de datos la tabla del Dynamic Risk
  Report de la herramienta, para poder redactar un resumen ejecutivo y recomendaciones en
  lenguaje dirigido al Directorio

## Verificación

girasol

## Checklist de auto-revisión

- [x] No hay credenciales en el repositorio
- [x] El .gitignore está correctamente configurado
- [x] Las capturas no muestran datos sensibles
- [x] Los archivos .sql o dumps no están subidos
- [x] El informe está en formato legible
- [x] El reporte ejecutivo está completo
- [X] Los mensajes de commit son descriptivos
- [X] Mi branch está actualizada y funciona
