# Trabajo Práctico — Gestión de Riesgos con SimpleRisk

## Datos del estudiante

- **Nombre completo:** Alessandro Faggionato
- **LU:** 31975997
- **Email:** alefaggionato@gmail.com
- **Comisión:** G

## Descripción y objetivo

Este trabajo presenta el análisis y tratamiento inicial de riesgos de seguridad de la información para una clínica privada ficticia de 120 empleados. La clínica atiende aproximadamente 800 pacientes por día y utiliza historias clínicas digitales, información de obras sociales y sistemas de facturación.

El objetivo es identificar riesgos realistas para la operación de la clínica, evaluarlos de manera consistente y proponer acciones de tratamiento fundamentadas. La herramienta SimpleRisk se utilizará posteriormente para registrar y gestionar esos riesgos.

## Alcance

El análisis contempla los procesos y activos necesarios para la atención clínica y administrativa:

- Historias clínicas electrónicas y base de datos de pacientes.
- Sistema de turnos y atención al paciente.
- Facturación y datos de obras sociales.
- Servidores, red interna, estaciones de trabajo y copias de respaldo.
- Personal médico, administrativo y técnico que accede a la información.

No se utilizarán datos reales de pacientes, empleados ni proveedores. Todo usuario, correo, captura y credencial del entorno de práctica será ficticio.

## Metodología inicial

Se aplicará una matriz cualitativa de **probabilidad × impacto**, con una escala de 1 a 5 para cada dimensión:

| Valor | Probabilidad | Impacto |
|---:|---|---|
| 1 | Raro | Insignificante |
| 2 | Improbable | Menor |
| 3 | Posible | Moderado |
| 4 | Probable | Mayor |
| 5 | Casi seguro | Catastrófico |

El nivel se calculará multiplicando ambos valores. Los resultados se clasificarán como bajo (1–4), medio (5–9), alto (10–15) o crítico (16–25). Cada valoración tendrá una justificación basada en el contexto de la clínica, controles existentes y posibles consecuencias operativas, legales y reputacionales.

## Estructura de la entrega

```text
entorno/              Archivos para levantar SimpleRisk de forma reproducible.
informe/              Informe técnico y capturas de evidencia.
informe/capturas/     Capturas sin datos sensibles.
configuracion/        Usuarios, roles y registro de riesgos.
reporte-ejecutivo/    Reporte final dirigido al directorio.
```

## Decisiones de diseño y seguridad

- Se trabajará exclusivamente en la branch `entrega/faggionato-alessandro-31975997`.
- Se utilizarán datos de demostración y contraseñas locales, nunca credenciales reales.
- Los secretos, archivos de entorno, respaldos y dumps de bases de datos permanecerán fuera del repositorio mediante `.gitignore`.
- Las capturas serán revisadas antes de incorporarlas para evitar exponer contraseñas, tokens, direcciones IP reales o datos personales.
- Los riesgos incluirán confidencialidad, integridad, disponibilidad, cumplimiento legal y continuidad operativa.
- Verificación de lectura de la consigna: **girasol**.

## Próximas etapas

1. Preparar y levantar el entorno local de SimpleRisk.
2. Configurar usuarios con roles diferenciados y registrar un riesgo de prueba.
3. Identificar y evaluar al menos siete riesgos específicos de la clínica.
4. Crear planes de acción para los riesgos altos o críticos.
5. Elaborar el informe técnico, la comparación metodológica y el reporte ejecutivo.

## Checklist de seguridad y entrega

- [ ] No hay credenciales en el repositorio.
- [x] El archivo `.gitignore` está correctamente configurado.
- [ ] Las capturas de pantalla no muestran datos sensibles.
- [ ] Los archivos `.sql` o dumps no están subidos.
- [ ] El informe está en un formato legible.
- [ ] El reporte ejecutivo está completo.
- [ ] Los mensajes de commit son descriptivos.
- [ ] Mi branch está actualizada y funciona correctamente.

