# TP: Gestión de Riesgos con SimpleRisk

## Datos personales

- **Nombre completo:** Gonzalo Carbajal
- **LU:** 31376904
- **Email institucional:** carbajalgonzalo@uch.edu.ar
- **Comisión:** G

## Escenario elegido

En lugar del escenario de ejemplo (clínica privada), este trabajo utiliza como caso real un
**cliente de la empresa donde trabajo, que opera con el sistema SIGA**. *(Sección a completar
en detalle en `informe/informe.md`, incluyendo contexto del cliente, alcance y supuestos.)*

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
- Supuestos del escenario: *(completar al desarrollar la Parte B con el caso SIGA)*.

### Verificación

Confirmo haber leído el enunciado completo del TP (`TareaClase4.pdf`). Palabra clave: **girasol**.

## Checklist de auto-revisión

- [ ] No hay credenciales en el repositorio.
- [ ] El `.gitignore` está correctamente configurado.
- [ ] Las capturas no muestran datos sensibles.
- [ ] Los archivos `.sql` o dumps no están subidos.
- [ ] El informe está en formato legible.
- [ ] El reporte ejecutivo está completo.
- [ ] Los mensajes de commit son descriptivos.
- [ ] Mi branch está actualizada y funciona.
