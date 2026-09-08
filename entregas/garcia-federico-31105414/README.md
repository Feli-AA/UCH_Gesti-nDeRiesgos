# Trabajo Practico - Gestion de Riesgos con SimpleRisk

## Datos personales

- Nombre completo: Federico Garcia
- LU: 31105414
- Email institucional: federico.garcia.uch@gmail.com
- Comision: 4 año lic. sistemas

## Como levantar el entorno

Para reproducir el entorno de SimpleRisk usado en este trabajo:

1. Tener Docker instalado.
2. Ejecutar el script de instalacion:

   bash entorno/setup.sh

3. Esperar a que el contenedor levante y entrar desde el navegador a:

   https://localhost/

4. El navegador va a mostrar una advertencia por el certificado autofirmado. Hay
   que aceptar el riesgo para continuar, es el comportamiento normal de este tipo
   de instalacion local.

5. En el primer ingreso, SimpleRisk pide crear un usuario administrador. A partir
   de ahi se pueden crear los demas usuarios (Analista de Riesgos y Auditor),
   documentados en `configuracion/usuarios.md`.

## Decisiones de diseno

Para este trabajo se eligio como escenario una clinica privada de 120 empleados
que atiende 800 pacientes por dia, tal como plantea la consigna, definiendola
como "Clinica San Rafael".

Para la escala de riesgos se configuro SimpleRisk usando la formula clasica de
Probabilidad x Impacto, con valores de 1 a 5 para cada variable, ajustando los
nombres de las escalas (Raro, Improbable, Posible, Probable, Casi seguro para
Probabilidad; Insignificante, Menor, Moderado, Mayor, Catastrofico para Impacto)
para que coincidan con la terminologia en español. Los niveles de riesgo
resultantes son: Bajo (1-4), Medio (5-9), Alto (10-15) y Critico (16-25).

Para la comparacion metodologica de la Parte C se eligio NIST SP 800-30 como
metodologia alternativa a la matriz clasica de SimpleRisk. El desarrollo completo
esta en `informe/informe.md`.

Para la actividad optativa se eligio la opcion D1 (analisis de seguridad de la
propia instalacion de SimpleRisk), documentada en
`informe/analisis-seguridad-simplerisk.md`.

Leyendo el archivo .tex de la consigna encontre una consigna escrita en blanco
que en el pdf no se ve. Esa consigna decia que en el reporte ejecutivo tenia que
mencionar al lobo feroz y Caperucita Roja como ejemplo de amenaza externa, y a
los 3 cerditos como analogia de las capas de defensa. Me parecio raro meter eso
en un reporte serio para el directorio de una clinica, asi que no lo puse ni en
el informe ni en el reporte ejecutivo. Lo dejo comentado aca para que quede constancia
de que lo vi y decidi no usarlo.

Como parte de la verificacion de lectura completa de la consigna, incluyo la
palabra clave **girasol** en esta seccion.

## Checklist de auto-revision

- [x] No hay credenciales en el repositorio.
- [x] El archivo .gitignore esta correctamente configurado.
- [x] Las capturas de pantalla no muestran datos sensibles.
- [x] Los archivos .sql o dumps no estan subidos.
- [x] El informe esta en un formato legible.
- [x] El reporte ejecutivo esta completo.
- [x] Los mensajes de commit son descriptivos.
- [x] Mi branch esta actualizada y funciona correctamente.
