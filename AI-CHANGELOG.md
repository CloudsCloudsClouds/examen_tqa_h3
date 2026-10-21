# AI Changelog

> 🤖 **Archivo creado por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · alcance: archivo completo · revisión humana: aprobada por Daniel

Registro cronológico del trabajo realizado por agentes de IA en este repositorio.
Complementa la política de `AGENTS.md` y el historial de Git; no sustituye la revisión humana.

## Cómo registrar una entrada

Copiar este formato al agregar trabajo nuevo:

```markdown
## AAAA-MM-DD · Agente / Modelo

**Solicitud:** qué pidió Daniel.
**Alcance:** archivo completo, sección, edición puntual, etc.
**Archivos:** rutas creadas o modificadas.
**Cambios:** resumen concreto de lo hecho.
**No modificado:** archivos relevantes que se leyeron pero no se tocaron.
**Commits:** ninguno, o el hash si el agente commiteó.
**Revisión humana:** pendiente / revisada por Daniel.
```

## 2026-10-20 · OpenCode / DeepSeek V4.1 Flash

**Solicitud:** traducir los 5 casos del README de Daniel a la plantilla Typst, solo diseño; sin ejecuciones ni bugs. Marcar como aprobados los cambios anteriores.
**Alcance:** diccionario de casos, renderizador de solo diseño y limpieza del alcance del entregable.
**Archivos:** `entregable-1/caja-negra/datos/casos.typ`, `entregable-1/caja-negra/casos_caja_negra.typ`, `entregable-1/README.md`, `AGENTS.md`, `README.md` (solo estado del banner), `AI-CHANGELOG.md`; se eliminaron `bugs_encontrados.typ`, `datos/bugs.typ` y `evidencias/` del entregable.
**Cambios:**
- Se volcaron los 5 casos `TCCJ-001` a `TCCJ-005` del README, con IDs, títulos, prioridades, tipos, módulos, objetivos, precondiciones, datos, pasos y criterio de éxito.
- Se tradujeron al español los pasos que estaban en inglés y se quitaron las notas de traducción del README.
- El renderizador ahora genera solo portada, resumen y fichas de diseño; no incluye ejecución.
- Se eliminó el esquema de ejecución y los archivos de bugs/evidencias, porque pertenecen a otro entregable.
- Se eliminó la nota visible de generación por IA del PDF, a pedido de Daniel.
- Se marcaron como aprobadas las revisiones humanas anteriores en `AGENTS.md`, `AI-CHANGELOG.md`, `README.md` y `templates/tqa.typ`.
**No modificado:** `templates/plantilla_tc_tqa.typ`, `templates/Bug_report_template_blank.typ`, `LICENSE`, el PPTX y el contenido del README (solo cambió el estado del banner).
**Commits:** ninguno.
**Revisión humana:** pendiente.

## 2026-10-20 · OpenCode / DeepSeek V4.1 Flash

**Solicitud:** reorganizar las carpetas del entregable 1 y crear los archivos Typst necesarios para trabajar caja negra con un diccionario de TCs.
**Alcance:** estructura nueva, módulo de estilos, diccionarios y renderizadores.
**Archivos:** `templates/tqa.typ`, `entregable-1/README.md`, `entregable-1/caja-negra/casos_caja_negra.typ`, `entregable-1/caja-negra/bugs_encontrados.typ`, `entregable-1/caja-negra/datos/casos.typ`, `entregable-1/caja-negra/datos/bugs.typ`, `entregable-1/caja-negra/evidencias/.gitkeep`, `AGENTS.md` (fila de registro).
**Cambios:**
- Se creó `entregable-1/caja-negra/` como espacio de trabajo de caja negra, con `datos/` para los diccionarios y `evidencias/` para capturas.
- Se creó `templates/tqa.typ` con los estilos y componentes reutilizables, basado en la plantilla existente; `templates/plantilla_tc_tqa.typ` no se modificó.
- Se creó `datos/casos.typ` con 5 slots (`TC-001` a `TC-005`), constructores para casos, datos, pasos y evidencias, y el esquema documentado en comentarios.
- Se creó `casos_caja_negra.typ`, que genera portada, resumen y una ficha de diseño + ejecución por TC.
- Se creó `datos/bugs.typ` vacío y `bugs_encontrados.typ`, sin inventar bugs.
- Se compilaron ambos documentos con Typst 0.15.1 y se probó un caso y un bug de ejemplo en una copia temporal para verificar el renderizado.
**No modificado:** `README.md`, `templates/plantilla_tc_tqa.typ`, `templates/Bug_report_template_blank.typ`, `LICENSE`, el PPTX.
**Commits:** ninguno.
**Revisión humana:** aprobada por Daniel.

## 2026-10-20 · OpenCode / DeepSeek V4.1 Flash

**Solicitud:** crear un archivo para llevar cuenta de todo el trabajo hecho por agentes y documentar lo realizado.
**Alcance:** archivo completo.
**Archivos:** `AI-CHANGELOG.md` (nuevo), `AGENTS.md` (fila agregada al registro).
**Cambios:**
- Se creó este log con propósito, formato de entrada y el historial de aportes IA del repositorio.
- Se documentaron las tres intervenciones de IA realizadas hasta ahora.
- Se agregó la fila de `AI-CHANGELOG.md` en el registro de `AGENTS.md`.
**No modificado:** `README.md` (se leyó para reconstruir el historial), `Examen_Practico_Hito_3_TQA_Instrucciones.pptx`, `LICENSE`.
**Commits:** ninguno.
**Revisión humana:** aprobada por Daniel.

## 2026-10-20 · OpenCode / DeepSeek V4.1 Flash

**Solicitud:** leer el PPTX con la información relevante y actualizar el README.
**Alcance:** sección nueva al final de un archivo existente; el texto humano se conservó sin cambios.
**Archivos:** `README.md`.
**Cambios:**
- Se extrajo el texto de las 16 diapositivas de `Examen_Practico_Hito_3_TQA_Instrucciones.pptx` (sin notas del orador).
- Se agregó una sección marcada como IA con: modalidad y duración, SauceDemo como aplicación bajo prueba, actividades y entregables, código de caja blanca, estructura sugerida del repositorio, tareas del Project Board y requisitos de entrega.
- Se agregó el banner de atribución con agente, modelo, fecha, fuente y estado de revisión.
**No modificado:** el texto humano original del README, el PPTX y `LICENSE`.
**Commits:** ninguno.
**Revisión humana:** aprobada por Daniel.

## 2026-10-20 · OpenCode / DeepSeek V4.1 Flash

**Solicitud:** crear un archivo modelo o política de trabajo para diferenciar el trabajo de IA del trabajo de Daniel y marcar todo el contenido generado por agentes.
**Alcance:** archivo completo.
**Archivos:** `AGENTS.md` (nuevo).
**Cambios:**
- Se definió la regla base: sin marca = trabajo de Daniel; todo aporte de IA se marca.
- Se definieron las marcas `[IA]`, `[HUMANO]` e `[IA+HUMANO]`.
- Se definió el banner obligatorio para archivos completos de IA y la marca para ediciones parciales.
- Se definió el trailer de commits para intervenciones de IA.
- Se agregaron límites de atribución y un registro de aportes.
**No modificado:** `README.md`, `LICENSE` y el PPTX.
**Commits:** ninguno.
**Revisión humana:** aprobada por Daniel.
