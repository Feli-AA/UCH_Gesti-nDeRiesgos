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

> _Pendiente de completar en la Parte A (instalación de SimpleRisk vía Docker)._

Pasos previstos:

1. Requisitos: Docker Desktop instalado y en ejecución.
2. Ejecutar el script `entorno/setup.sh` o los comandos indicados en `entorno/docker-compose.yml`.
3. Acceder a `https://localhost/` y completar el asistente de instalación inicial de SimpleRisk.
4. Iniciar sesión con los usuarios de prueba documentados en `configuracion/usuarios.md`
   (**nunca con contraseñas reales**).

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
