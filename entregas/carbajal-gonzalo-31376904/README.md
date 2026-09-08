# TP: Gestión de Riesgos con SimpleRisk

## Datos personales

- **Nombre completo:** Gonzalo Carbajal
- **LU:** 31376904
- **Email institucional:** carbajalgonzalo@uch.edu.ar
- **Comisión:** G

## Escenario elegido

En lugar del escenario de ejemplo (clínica privada), este trabajo utiliza como caso real
a **"Cable Sur S.A."** (nombre ficticio, representativo de un cliente real de la empresa
donde trabajo, ICITELCO), una empresa de triple play (TV por cable, internet, telefonía)
que opera con el sistema **SIGA** on-premise en su propio datacenter. El nombre del
cliente se anonimizó a propósito porque este repositorio es público. Detalle completo del
escenario, los 8 riesgos identificados y los planes de acción en `informe/informe.md`
(Parte B) y `configuracion/riesgos.md`.

## Cómo levantar el entorno

1. Requisitos: Docker Desktop instalado y en ejecución.
2. Desde `entorno/`, ejecutar `docker compose up -d` (o `./setup.sh`).
3. Esperar ~20-30 segundos a que el contenedor pase de `health: starting` a `healthy`.
4. Acceder a `https://localhost:8444/` (se usa este puerto en lugar del 443 estándar
   porque el puerto 443/80 puede estar ocupado por otros servicios en el host; ajustar el
   mapeo de puertos en `docker-compose.yml` si hiciera falta). El navegador va a mostrar
   una advertencia de certificado autofirmado — es esperable, aceptarla para continuar.
5. Completar el asistente "Default Admin Account Creation" con credenciales ficticias.
6. Iniciar sesión con los usuarios documentados en `configuracion/usuarios.md`
   (**nunca con contraseñas reales**; los roles `Analista de Riesgos` y `Auditor` son
   roles custom creados en *Settings → Role Management*, detallados en ese archivo).

## Decisiones de diseño

- Metodología de riesgo: matriz clásica Probabilidad × Impacto (escala 1-5) provista por
  SimpleRisk, contrastada en `informe/informe.md` (Parte C) con una metodología alternativa.
- Supuestos del escenario: se optó por un despliegue **on-premise** (en lugar de nube)
  porque expone una superficie de riesgo más rica para el análisis (continuidad física
  del datacenter, accesos privilegiados de terceros, integraciones externas). El cliente
  se anonimizó ("Cable Sur S.A.") porque el repositorio es público y el nombre real de un
  cliente de ICITELCO es información de un tercero, no un secreto propio.

### Verificación

Confirmo haber leído el enunciado completo del TP (`TareaClase4.pdf`). Palabra clave: **girasol**.

## Checklist de auto-revisión

- [x] No hay credenciales en el repositorio.
- [x] El `.gitignore` está correctamente configurado.
- [ ] Las capturas no muestran datos sensibles. *(pendiente: recortar la barra de
      marcadores del navegador visible en `settings-roles.png`, ver nota en informe.md)*
- [x] Los archivos `.sql` o dumps no están subidos (`scripts/seed_risks.sql` es un script
      de código, no un dump de datos; excepción explícita y justificada en `.gitignore`).
- [x] El informe está en formato legible.
- [ ] El reporte ejecutivo está completo. *(pendiente de generar el PDF)*
- [x] Los mensajes de commit son descriptivos.
- [x] Mi branch está actualizada y funciona.
