// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | renderizador de casos de caja negra
// Genera un PDF a partir del diccionario de TCs en datos/casos.typ.
// Compilar: typst compile entregable-1/caja-negra/casos_caja_negra.typ

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
#tabla(2,
  table.cell(fill: c-diseno, align: center + horizon,
    text(size: 12pt, weight: "bold")[01 \ DISEÑAR EL TC \ Definir qué se quiere comprobar y cómo.]),
  table.cell(fill: c-ejec, align: center + horizon,
    text(size: 12pt, weight: "bold")[02 \ EJECUTAR LA PRUEBA \ Registrar qué ocurrió realmente.]),
)

#parrafo(alineacion: center, arriba: 2.5pt,
  text(size: 8pt, style: "italic", fill: c-gris)[Documento generado por IA a partir del diccionario de casos de Daniel. Revisión humana pendiente.])

// ── Resumen ───────────────────────────────────────────────────────────────────
#pagebreak()
#sec(nivel: 1)[Resumen de casos]
#parrafo[Estado actual del diccionario. Los campos vacíos se muestran como «Pendiente».]
#registro(
  c-azul,
  ("ID", "Título", "Módulo", "Prioridad", "Estado"),
  casos.map(tc => (
    tc.id,
    texto(tc.titulo),
    texto(tc.modulo),
    texto(tc.prioridad),
    tc.ejecucion.estado,
  )),
  centradas: (0, 3, 4),
)
#parrafo[Total: #casos.len() casos.]

// ── Fichas ────────────────────────────────────────────────────────────────────
#let ficha-diseno(tc) = {
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
      tc.datos.map(d => (texto(d.dato), texto(d.valor), texto(d.origen), texto(d.observacion, defecto: "—"))),
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

#let ficha-ejecucion(tc) = {
  sec(color: c-verde, nivel: 1)[#tc.id · Ejecución]

  ficha(
    ("ID DEL TC", tc.id, "EJECUTADO POR", texto(tc.ejecucion.ejecutado_por)),
    ("FECHA", texto(tc.ejecucion.fecha), "HORA", texto(tc.ejecucion.hora)),
    ("AMBIENTE", texto(tc.ejecucion.ambiente), "VERSIÓN", texto(tc.ejecucion.version)),
  )

  align(center, chip-estado(tc.ejecucion.estado))

  sec("1. Resultado de la ejecución")
  let estados = ("PASS", "FAIL", "BLOCKED", "NOT RUN")
  let actual = upper(tc.ejecucion.estado)
  tabla(4, ..estados.map(e => table.cell(
    fill: if actual == e { estado-color(e) } else { c-cebra },
    align: center + horizon,
    text(size: 10pt, weight: "bold", fill: if actual == e { white } else { c-gris }, e),
  )))

  sec("2. Resultado observado")
  ficha(size: 9pt, ("¿QUÉ OCURRIÓ REALMENTE?", texto(tc.ejecucion.observado)))
  separador
  ficha(size: 9pt, ("COMPARACIÓN", texto(tc.ejecucion.comparacion)))

  sec("3. Registro de ejecución por paso")
  if tc.ejecucion.pasos.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-verde,
      ("#", "Paso ejecutado", "Resultado observado", "Estado", "Observación"),
      tc.ejecucion.pasos.enumerate().map(((i, p)) => (
        str(i + 1),
        texto(p.accion),
        texto(p.observado),
        texto(p.estado),
        texto(p.observacion, defecto: "—"),
      )),
      centradas: (0, 3), size-cab: 8pt, size: 7.5pt,
    )
  }

  sec("4. Evidencia")
  if tc.ejecucion.evidencias.len() == 0 {
    parrafo[Pendiente.]
  } else {
    registro(
      c-verde,
      ("Tipo", "Nombre o referencia", "Descripción"),
      tc.ejecucion.evidencias.map(e => (texto(e.tipo), texto(e.referencia), texto(e.descripcion, defecto: "—"))),
      centradas: (),
    )
  }

  sec(color: c-rojo, "5. Si el resultado es FAIL")
  ficha(size: 9pt, ("DESVIACIÓN ENCONTRADA", texto(tc.ejecucion.desviacion, defecto: "N/A")))
  separador
  ficha(size: 9pt, ("REFERENCIA DEL DEFECTO", texto(tc.ejecucion.bug, defecto: "N/A")))

  sec("6. Observaciones de ejecución")
  ficha(size: 9pt, ("OBSERVACIONES", texto(tc.ejecucion.observaciones, defecto: "—")))
}

// ── Cuerpo ────────────────────────────────────────────────────────────────────
#for tc in casos {
  pagebreak()
  ficha-diseno(tc)
  pagebreak()
  ficha-ejecucion(tc)
}
