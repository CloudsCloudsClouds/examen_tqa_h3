// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | renderizador de bugs de caja negra
// Genera un PDF a partir del diccionario de bugs en datos/bugs.typ.
// Compilar: typst compile entregable-1/caja-negra/bugs_encontrados.typ

#import "../../templates/tqa.typ": *
#import "datos/bugs.typ": bugs

#show: documento.with(
  titulo: "Bugs — Caja negra",
  pie: "TQA • Bugs • SauceDemo",
)

#let autor = "Daniel Bernal"
#let fecha = "2026-10-20"

// ── Portada ───────────────────────────────────────────────────────────────────
#v(40pt)
#parrafo(alineacion: center, text(font: f-titulos, size: 30pt, weight: "bold")[BUGS ENCONTRADOS])
#parrafo(alineacion: center, text(size: 17pt, weight: "bold", fill: c-rojo)[Caja negra · SauceDemo (Swag Labs)])
#parrafo(alineacion: center, text(size: 11pt)[TQA · Hito 3 · Entregable 1])
#parrafo(alineacion: center, text(size: 10pt)[#autor · #fecha])
#parrafo(alineacion: center, arriba: 2.5pt,
  text(size: 8pt, style: "italic", fill: c-gris)[Documento generado por IA a partir del diccionario de bugs de Daniel. Revisión humana pendiente.])

// ── Ficha de bug ──────────────────────────────────────────────────────────────
#let ficha-bug(b) = {
  sec(color: c-rojo, nivel: 1)[#b.id · #texto(b.titulo, defecto: "Bug sin título")]

  ficha(
    ("ID", b.id, "PRIORIDAD", texto(b.prioridad)),
    ("SEVERIDAD", texto(b.severidad), "ESTADO", texto(b.estado)),
    ("MÓDULO", texto(b.modulo), "AMBIENTE", texto(b.ambiente)),
  )

  sec("1. Descripción")
  parrafo(texto(b.descripcion))

  sec("2. Precondiciones y datos")
  ficha(
    ("PRECONDICIONES", texto(b.precondiciones)),
    ("DATOS", texto(b.datos)),
  )

  sec("3. Pasos para reproducir")
  if b.pasos.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-rojo,
      ("#", "Paso"),
      b.pasos.enumerate().map(((i, p)) => (str(i + 1), texto(p))),
      centradas: (0,),
    )
  }

  sec("4. Resultado esperado")
  parrafo(texto(b.esperado))

  sec("5. Resultado actual")
  parrafo(texto(b.actual))

  sec("6. Evidencia")
  if b.evidencias.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-rojo,
      ("Tipo", "Nombre o referencia", "Descripción"),
      b.evidencias.map(e => (texto(e.tipo), texto(e.referencia), texto(e.descripcion, defecto: "—"))),
      centradas: (),
    )
  }

  sec("7. Observaciones")
  parrafo(texto(b.observaciones, defecto: "—"))
}

// ── Cuerpo ────────────────────────────────────────────────────────────────────
#pagebreak()
#sec(nivel: 1)[Registro de defectos]
#parrafo[Defectos reproducibles encontrados durante la ejecución de los casos de caja negra. Si una prueba pasa, se registra como PASS en el caso; no se inventa un bug.]

#if bugs.len() == 0 [
  #parrafo[Sin bugs registrados todavía.]
] else [
  #for b in bugs {
    pagebreak()
    ficha-bug(b)
  }
]
