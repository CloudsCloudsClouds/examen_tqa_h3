// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | renderizador de casos de caja negra (solo diseño)
// Genera un PDF a partir del diccionario de TCs en datos/casos.typ.
// Compilar: typst compile --root . entregable-1/caja-negra/casos_caja_negra.typ

#import "../../templates/tqa.typ": *
#import "datos/casos.typ": casos

#show: documento.with(
  titulo: "Casos de prueba — Caja negra",
  pie: "TQA • Caja negra • SauceDemo",
)

#let autor = "Daniel Bernal"
#let fecha = "2026-10-20"

// ── Portada ───────────────────────────────────────────────────────────────────
#v(35pt)
#parrafo(alineacion: center, text(font: f-titulos, size: 30pt, weight: "bold")[CASOS DE PRUEBA])
#parrafo(alineacion: center, text(size: 17pt, weight: "bold", fill: c-azul)[Caja negra · SauceDemo (Swag Labs)])
#parrafo(alineacion: center, text(size: 11pt)[TQA · Hito 3 · Entregable 1])
#parrafo(alineacion: center, text(size: 10pt)[#autor · #fecha])

#v(18pt)
#tabla(1,
  table.cell(fill: c-diseno, align: center + horizon,
    text(size: 12pt, weight: "bold")[DISEÑO DE CASOS \ Definir qué se quiere comprobar y cómo.]),
)

#parrafo(alineacion: center, arriba: 2.5pt,
  text(size: 9pt, style: "italic", fill: c-gris)[Alcance: diseño de casos de prueba.])

// ── Resumen ───────────────────────────────────────────────────────────────────
#pagebreak()
#sec(nivel: 1)[Resumen de casos]
#parrafo[Resumen de los 5 casos definidos para caja negra.]
#registro(
  c-azul,
  ("ID", "Título", "Módulo", "Tipo", "Prioridad"),
  casos.map(tc => (
    tc.id,
    texto(tc.titulo),
    texto(tc.modulo),
    texto(tc.tipo),
    texto(tc.prioridad),
  )),
  centradas: (0, 4),
)
#parrafo[Total: #casos.len() casos.]

// ── Ficha de caso ─────────────────────────────────────────────────────────────
#let ficha-caso(tc) = {
  sec(nivel: 1)[#tc.id · #texto(tc.titulo, defecto: "Caso sin título")]

  ficha(
    ("ID DEL TC", tc.id, "PRIORIDAD", texto(tc.prioridad)),
    ("TÍTULO", texto(tc.titulo), "TIPO", texto(tc.tipo)),
    ("MÓDULO", texto(tc.modulo), "AMBIENTE", texto(tc.ambiente)),
  )

  sec("1. Objetivo")
  ficha(size: 9pt, ("¿QUÉ SE QUIERE VALIDAR?", texto(tc.objetivo)))

  sec("2. Precondiciones")
  ficha(
    ("Estado inicial", texto(tc.precondiciones.estado)),
    ("Usuario / permisos", texto(tc.precondiciones.usuario)),
    ("Configuración", texto(tc.precondiciones.configuracion)),
  )

  sec("3. Datos de prueba")
  if tc.datos.len() == 0 {
    ficha(size: 9pt, ("Datos", "Pendiente"))
  } else {
    registro(
      c-azul,
      ("Dato", "Valor", "Origen", "Observación"),
      tc.datos.map(d => (
        texto(d.dato),
        texto(d.valor),
        texto(d.origen),
        texto(d.observacion, defecto: "—"),
      )),
      centradas: (),
    )
  }

  sec("4. Pasos y resultados esperados")
  if tc.pasos.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-azul,
      ("#", "Paso / acción", "Dato utilizado", "Resultado esperado"),
      tc.pasos.enumerate().map(((i, p)) => (
        str(i + 1),
        texto(p.accion),
        texto(p.dato, defecto: "—"),
        texto(p.esperado),
      )),
      centradas: (0,),
    )
  }

  sec("5. Resultado esperado final")
  ficha(size: 9pt, ("CRITERIO DE ÉXITO", texto(tc.criterio)))
}

// ── Cuerpo ────────────────────────────────────────────────────────────────────
#for tc in casos {
  pagebreak()
  ficha-caso(tc)
}
