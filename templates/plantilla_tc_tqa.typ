// =============================================================================
// Casos de prueba — Plantilla para diseño y ejecución (TQA)
// Traducción a Typst de «Plantilla_TC_y_Ejecucion_TQA.docx»
//
// Compilar:  typst compile plantilla_tc_tqa.typ
//
// Fuentes: el original usa Aptos / Aptos Display. Si no están instaladas,
// Typst toma la primera alternativa disponible de las listas de más abajo.
// =============================================================================

// ── Parámetros ────────────────────────────────────────────────────────────────
#let n-pasos = 7   // filas de las tablas de pasos (Parte 1 §4 y Parte 2 §3)

// ── Paleta ────────────────────────────────────────────────────────────────────
#let c-tinta  = rgb("#182030")   // texto base y fondo de etiquetas
#let c-azul   = rgb("#2D6CDF")
#let c-verde  = rgb("#2D9B64")
#let c-rojo   = rgb("#CD4646")
#let c-ambar  = rgb("#EB912D")
#let c-gris   = rgb("#647080")   // texto de valores / placeholders
#let c-cebra  = rgb("#F5F8FC")   // fondo de valores y filas pares
#let c-diseno = rgb("#E8EEF7")   // recuadro «01 · Diseñar el TC»
#let c-ejec   = rgb("#DDF3EE")   // recuadro «02 · Ejecutar la prueba»

// ── Fuentes ───────────────────────────────────────────────────────────────────
#let f-cuerpo  = ("Aptos", "Calibri", "Carlito", "Liberation Sans", "DejaVu Sans")
#let f-titulos = ("Aptos Display",) + f-cuerpo

// ── Documento ─────────────────────────────────────────────────────────────────
#set document(title: "Casos de prueba — Plantilla para diseño y ejecución")

#set page(
  paper: "us-letter",
  margin: (top: 39.6pt, bottom: 45.6pt, x: 43.2pt),
  footer-descent: 0pt,
  footer: align(center, text(size: 8pt, fill: c-gris)[TQA • Plantilla de Casos de Prueba]),
)

#set text(
  font: f-cuerpo, size: 9.5pt, fill: c-tinta, lang: "es",
  top-edge: 0.92em, bottom-edge: -0.28em,   // caja de línea fija ≈ 1,2 em, como Word
)
#set par(leading: 0.18em, spacing: 10pt)   // ≈ interlineado 1.15 y 10 pt entre párrafos

// Títulos: mismo aspecto para todos; el color lo decide cada uno (ver `sec`).
#show heading: it => block(
  above: 8pt, below: 4pt, sticky: true,
  text(font: f-titulos, size: 17pt, weight: "bold", fill: c-azul, it.body),
)
#let sec(color: c-azul, nivel: 2, body) = heading(level: nivel, text(fill: color, body))

// Lista con viñetas (sangría francesa de 18 pt, sin espacio entre ítems)
#set list(marker: [•], indent: 0pt, body-indent: 14pt, tight: true)

// ── Componentes ───────────────────────────────────────────────────────────────

// Tabla base: rejilla de 0,5 pt, celdas sin margen vertical, texto centrado en vertical.
#let tabla(columnas, ..celdas) = block(above: 0pt, below: 0pt, {
  set par(leading: 0pt)
  set table.cell(breakable: false)
  table(
    columns: (1fr,) * columnas,
    stroke: 0.5pt + black,
    inset: (x: 5.4pt, y: 0pt),
    align: horizon,
    ..celdas,
  )
})

// Celda-etiqueta: fondo oscuro, texto blanco en negrita, centrado.
#let etiqueta(body, size: 8.5pt) = table.cell(
  fill: c-tinta, align: center + horizon,
  text(size: size, weight: "bold", fill: white, body),
)

// Celda-valor: fondo claro, texto gris a la izquierda.
#let valor(body, size: 8.5pt) = table.cell(
  fill: c-cebra, align: left + horizon,
  text(size: size, fill: c-gris, body),
)

// Ficha de pares etiqueta | valor. Cada argumento posicional es una fila:
//   ("ID DEL TC", "TC-001")                          → tabla de 2 columnas
//   ("ID DEL TC", "TC-001", "PRIORIDAD", "Alta…")    → tabla de 4 columnas
#let ficha(..filas, size: 8.5pt) = {
  let filas = filas.pos()
  tabla(
    filas.first().len(),
    ..filas.flatten().enumerate().map(((i, t)) =>
      if calc.even(i) { etiqueta(t, size: size) } else { valor(t, size: size) }),
  )
}

// Tabla con cabecera de color y filas alternadas (blanco / gris muy claro).
#let registro(color, cabecera, filas, centradas: (0,), size-cab: 8.5pt, size: 8pt) = tabla(
  cabecera.len(),
  table.header(..cabecera.map(t => table.cell(
    fill: color, align: center + horizon,
    text(size: size-cab, weight: "bold", fill: white, t),
  ))),
  ..filas.enumerate().map(((i, fila)) => fila.enumerate().map(((j, t)) => table.cell(
    fill: if calc.even(i) { white } else { c-cebra },
    align: (if j in centradas { center } else { left }) + horizon,
    text(size: size, fill: c-gris, t),
  ))).flatten(),
)

// Párrafo suelto: 10 pt de aire debajo, también cuando lo sigue una tabla.
#let parrafo(body, alineacion: left, arriba: 0pt) = block(
  above: 0pt, below: 10pt, width: 100%, inset: (top: arriba),
  { set align(alineacion); body },
)

// Párrafo vacío que el original deja entre dos tablas (≈ 22 pt)
#let separador = v(22pt)

// ═════════════════════════════════════════════════════════════════════════════
// PORTADA
// ═════════════════════════════════════════════════════════════════════════════
#v(35pt)
#parrafo(alineacion: center, text(font: f-titulos, size: 30pt, weight: "bold")[CASOS DE PRUEBA])
#parrafo(alineacion: center, text(size: 17pt, weight: "bold", fill: c-azul)[Plantilla para diseño y ejecución])
#parrafo(alineacion: center, text(size: 11pt)[TQA • Documento base para prácticas e integrador])

#tabla(2,
  table.cell(fill: c-diseno, align: center + horizon,
    text(size: 12pt, weight: "bold")[01 \ DISEÑAR EL TC \ Definir qué se quiere comprobar y cómo.]),
  table.cell(fill: c-ejec, align: center + horizon,
    text(size: 12pt, weight: "bold")[02 \ EJECUTAR LA PRUEBA \ Registrar qué ocurrió realmente.]),
)
#parrafo(alineacion: center, arriba: 2.5pt,
  text(size: 9pt, style: "italic", fill: c-gris)[Solo incluye diseño y ejecución. La trazabilidad se incorporará más adelante.])

// ═════════════════════════════════════════════════════════════════════════════
// PARTE 1 · DISEÑO
// ═════════════════════════════════════════════════════════════════════════════
#sec(nivel: 1)[PARTE 1 · PLANTILLA PARA CREAR EL CASO DE PRUEBA]

#parrafo(text(weight: "bold")[Completar antes de ejecutar la prueba.])

#ficha(
  ("ID DEL TC", "TC-001", "PRIORIDAD", "Alta / Media / Baja"),
  ("TÍTULO", "[Nombre claro del comportamiento]", "TIPO", "Funcional / Negativa / Regresión / etc."),
  ("MÓDULO", "[Módulo o funcionalidad]", "AMBIENTE", "QA / Staging / Local"),
)

#sec("1. Objetivo")
#ficha(size: 9pt,
  ("¿QUÉ SE QUIERE VALIDAR?", "[Comportamiento específico que se desea comprobar.]"),
)

#sec("2. Precondiciones")
#ficha(
  ("Estado inicial", "[Qué debe estar preparado antes de comenzar.]"),
  ("Usuario / permisos", "[Tipo de usuario y permisos necesarios.]"),
  ("Configuración", "[Configuraciones o dependencias necesarias.]"),
)

#sec("3. Datos de prueba")
#ficha(
  ("Dato", "[Nombre del dato]"),
  ("Valor", "[Valor utilizado]"),
  ("Origen", "[Generado / preparado / ambiente]"),
  ("Observación", "[Dato especial o condición relevante]"),
)

#sec("4. Pasos y resultados esperados")
#parrafo[Los pasos deben ser reproducibles: otro tester debería poder ejecutarlos sin pedir aclaraciones.]

#registro(
  c-azul,
  ("#", "Paso / acción", "Dato utilizado", "Resultado esperado"),
  range(1, n-pasos + 1).map(n => (str(n), "[Acción concreta]", "[Dato]", "[Comportamiento observable esperado]")),
)

#sec("5. Resultado esperado final")
#ficha(size: 9pt,
  ("CRITERIO DE ÉXITO", "[Qué debe ocurrir para considerar correcto el caso.]"),
)

// ═════════════════════════════════════════════════════════════════════════════
// PARTE 2 · EJECUCIÓN
// ═════════════════════════════════════════════════════════════════════════════
#pagebreak()
#v(8pt)   // el título conserva su espacio superior aun a inicio de página
#sec(color: c-verde, nivel: 1)[PARTE 2 · PLANTILLA PARA EJECUTAR LA PRUEBA]

#parrafo(text(weight: "bold")[Completar durante o inmediatamente después de ejecutar el TC.])

#ficha(
  ("ID DEL TC", "TC-001", "EJECUTADO POR", "[Nombre del tester]"),
  ("FECHA", "[dd/mm/aaaa]", "HORA", "[hh:mm]"),
  ("AMBIENTE", "[QA / Staging / Local]", "VERSIÓN", "[Build / versión]"),
)

#sec("1. Resultado de la ejecución")
#tabla(4,
  ..(("☐ PASS", c-verde), ("☐ FAIL", c-rojo), ("☐ BLOCKED", c-ambar), ("☐ NOT RUN", c-gris)).map(((t, color)) =>
    table.cell(fill: color, align: center + horizon,
      text(size: 11pt, weight: "bold", fill: white, t))),
)

#sec("2. Resultado observado")
#ficha(size: 9pt,
  ("¿QUÉ OCURRIÓ REALMENTE?", "[Describir el comportamiento observado.]"),
)
#separador
#ficha(size: 9pt,
  ("COMPARACIÓN", "[¿Coincide con lo esperado? Si no, describir la diferencia.]"),
)

#sec("3. Registro de ejecución por paso")
#registro(
  c-verde,
  ("#", "Paso ejecutado", "Resultado observado", "Estado", "Observación"),
  range(1, n-pasos + 1).map(n => (str(n), "[Acción realizada]", "[Qué ocurrió]", "PASS / FAIL / N/A", "[Detalle]")),
  centradas: (0, 3), size-cab: 8pt, size: 7.5pt,
)

#sec("4. Evidencia")
#ficha(
  ("Tipo", "Captura / Video / Log / Otro"),
  ("Nombre o referencia", "[evidencia_TC001_01.png]"),
  ("Descripción", "[Qué demuestra la evidencia.]"),
)

#sec(color: c-rojo, "5. Si el resultado es FAIL")
#ficha(size: 9pt,
  ("DESVIACIÓN ENCONTRADA", "[Qué no coincidió con lo esperado.]"),
)
#separador
#ficha(size: 9pt,
  ("REFERENCIA DEL DEFECTO", "[BUG-001 / N/A]"),
)

#sec("6. Observaciones de ejecución")
#ficha(size: 9pt,
  ("OBSERVACIONES", "[Información adicional relevante.]"),
)

// ═════════════════════════════════════════════════════════════════════════════
// REGLAS DE USO
// ═════════════════════════════════════════════════════════════════════════════
#sec(color: c-ambar, nivel: 1)[Reglas de uso]

- El TC se diseña primero; el resultado observado se registra durante la ejecución.
- El resultado esperado debe estar definido antes de ejecutar.
- PASS = coincide; FAIL = diferencia verificable; BLOCKED = no se pudo ejecutar; NOT RUN = aún no ejecutado.
- Las evidencias deben permitir entender el resultado.
- El TC debe ser claro, concreto y reproducible por otro tester.
