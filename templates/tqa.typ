// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | módulo de estilos reutilizables para documentos de caja negra | revisión humana: aprobada por Daniel
// Basado en templates/plantilla_tc_tqa.typ. La plantilla original no se modifica.
// Este archivo no genera contenido por sí solo: define la configuración y los componentes.

// ── Paleta ────────────────────────────────────────────────────────────────────
#let c-tinta  = rgb("#182030")
#let c-azul   = rgb("#2D6CDF")
#let c-verde  = rgb("#2D9B64")
#let c-rojo   = rgb("#CD4646")
#let c-ambar  = rgb("#EB912D")
#let c-gris   = rgb("#647080")
#let c-cebra  = rgb("#F5F8FC")
#let c-diseno = rgb("#E8EEF7")
#let c-ejec   = rgb("#DDF3EE")

// ── Fuentes ───────────────────────────────────────────────────────────────────
#let f-cuerpo  = ("Aptos", "Calibri", "Carlito", "Liberation Sans", "DejaVu Sans")
#let f-titulos = ("Aptos Display",) + f-cuerpo

// ── Configuración del documento ───────────────────────────────────────────────
// Uso:
//   #show: documento.with(titulo: "Mi documento", pie: "TQA • ...")
#let documento(titulo: none, pie: "", body) = {
  set document(title: titulo)
  set page(
    paper: "us-letter",
    margin: (top: 39.6pt, bottom: 45.6pt, x: 43.2pt),
    footer-descent: 0pt,
    footer: align(center, text(size: 8pt, fill: c-gris, pie)),
  )
  set text(
    font: f-cuerpo, size: 9.5pt, fill: c-tinta, lang: "es",
    top-edge: 0.92em, bottom-edge: -0.28em,
  )
  set par(leading: 0.18em, spacing: 10pt)
  show heading: it => block(
    above: 8pt, below: 4pt, sticky: true,
    text(font: f-titulos, size: 17pt, weight: "bold", fill: c-azul, it.body),
  )
  set list(marker: [•], indent: 0pt, body-indent: 14pt, tight: true)
  body
}

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

// Ficha de pares etiqueta | valor.
#let ficha(..filas, size: 8.5pt) = {
  let filas = filas.pos()
  tabla(
    filas.first().len(),
    ..filas.flatten().enumerate().map(((i, t)) =>
      if calc.even(i) { etiqueta(t, size: size) } else { valor(t, size: size) }),
  )
}

// Tabla con cabecera de color y filas alternadas.
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

// Párrafo suelto.
#let parrafo(body, alineacion: left, arriba: 0pt) = block(
  above: 0pt, below: 10pt, width: 100%, inset: (top: arriba),
  { set align(alineacion); body },
)

// Párrafo vacío entre dos tablas.
#let separador = v(22pt)

// Sección con color configurable.
#let sec(color: c-azul, nivel: 2, body) = heading(level: nivel, text(fill: color, body))

// ── Utilidades para los datos ─────────────────────────────────────────────────

// Devuelve un valor legible o el texto de respaldo.
#let texto(valor, defecto: "Pendiente") = if valor == none or valor == "" { defecto } else { valor }

// Color asociado al estado de ejecución.
#let estado-color(estado) = {
  let e = upper(estado)
  if e == "PASS" { c-verde }
  else if e == "FAIL" { c-rojo }
  else if e == "BLOCKED" { c-ambar }
  else { c-gris }
}

// Insignia de estado.
#let chip-estado(estado) = block(
  fill: estado-color(estado),
  inset: (x: 7pt, y: 2.5pt),
  radius: 2pt,
  text(size: 10pt, weight: "bold", fill: white, upper(estado)),
)
