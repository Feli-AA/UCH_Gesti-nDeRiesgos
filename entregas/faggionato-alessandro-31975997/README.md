# Trabajo Práctico — Gestión de Riesgos con SimpleRisk

## Datos del estudiante

- **Nombre completo:** Alessandro Faggionato
- **LU:** 31975997
- **Email:** alefaggionato@gmail.com
- **Comisión:** G

## Descripción y objetivo

Este trabajo presenta el análisis y tratamiento inicial de riesgos de seguridad de la información para una clínica privada ficticia de 120 empleados. La clínica atiende aproximadamente 800 pacientes por día y utiliza historias clínicas digitales, información de obras sociales y sistemas de facturación.

El objetivo es identificar riesgos realistas para la operación de la clínica, evaluarlos de manera consistente y proponer acciones de tratamiento fundamentadas. Se utiliza SimpleRisk para registrar y gestionar esos riesgos.

## Decisiones de diseño y seguridad

- Se trabajará exclusivamente en la branch `entrega/faggionato-alessandro-31975997`.
- Se utilizarán datos de demostración y contraseñas locales, nunca credenciales reales.
- Los secretos, archivos de entorno, respaldos y dumps de bases de datos permanecerán fuera del repositorio mediante `.gitignore`.
- Las capturas serán revisadas antes de incorporarlas para evitar exponer contraseñas, tokens, direcciones IP reales o datos personales.
- Verificación de lectura de la consigna: **girasol**.

## Estado actual y reproducibilidad

Se desplegó un entorno local de SimpleRisk con Docker Compose y MySQL 8. El procedimiento de instalación, arranque, diagnóstico y resguardo de credenciales está documentado en `entorno/README.md`.

Se crearon tres usuarios de demostración con roles diferenciados y se cargó un riesgo de prueba para validar la instancia. El detalle de usuarios, roles y riesgo se encuentra en:

- `configuracion/usuarios.md`
- `configuracion/riesgos.md`
- `informe/informe.md`

## Próximas etapas

1. Preparar y levantar el entorno local de SimpleRisk. 
2. Configurar usuarios con roles diferenciados y registrar un riesgo de prueba. 
3. Identificar y evaluar al menos siete riesgos específicos de la clínica.
4. Crear planes de acción para los riesgos altos o críticos.

## Checklist de seguridad y entrega

- [ ] No hay credenciales en el repositorio.
- [x] El archivo `.gitignore` está correctamente configurado.
- [ ] Las capturas de pantalla no muestran datos sensibles.
- [ ] Los archivos `.sql` o dumps no están subidos.
- [ ] El informe está en un formato legible.
- [ ] El reporte ejecutivo está completo.
- [ ] Los mensajes de commit son descriptivos.
- [ ] Mi branch está actualizada y funciona correctamente.
