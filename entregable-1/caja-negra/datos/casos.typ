// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | esquema y andamiaje del diccionario de TCs
// [HUMANO] Daniel: completar los valores de cada caso. La IA solo llena este diccionario cuando se lo pidas.
//
// Este archivo es la fuente de verdad de los casos de caja negra.
// El documento se genera desde casos_caja_negra.typ; no hace falta editar el renderizador.
//
// Estructura de un caso:
//   caso("TC-001",
//     titulo: "...",
//     prioridad: "Alta",
//     tipo: "Funcional",
//     modulo: "...",
//     ambiente: "QA",
//     objetivo: "...",
//     precondiciones: (estado: "...", usuario: "...", configuracion: "..."),
//     datos: (
//       dato(dato: "Usuario", valor: "...", origen: "...", observacion: ""),
//     ),
//     pasos: (
//       paso(accion: "...", dato: "...", esperado: "..."),
//     ),
//     criterio: "...",
//     ejecucion: (
//       estado: "PASS", // PASS / FAIL / BLOCKED / NOT RUN
//       ejecutado_por: "Daniel Bernal",
//       fecha: "dd/mm/aaaa",
//       hora: "hh:mm",
//       ambiente: "QA",
//       version: "...",
//       observado: "...",
//       comparacion: "...",
//       desviacion: "...",
//       pasos: (
//         paso-ejecutado(accion: "...", observado: "...", estado: "PASS", observacion: ""),
//       ),
//       evidencias: (
//         evidencia(tipo: "Captura", referencia: "TC-001_01.png", descripcion: "..."),
//       ),
//       bug: "BUG-001 / N/A",
//       observaciones: "...",
//     ),
//   )

#let dato(dato: "", valor: "", origen: "", observacion: "") = (
  dato: dato,
  valor: valor,
  origen: origen,
  observacion: observacion,
)

#let paso(accion: "", dato: "", esperado: "") = (
  accion: accion,
  dato: dato,
  esperado: esperado,
)

#let paso-ejecutado(accion: "", observado: "", estado: "N/A", observacion: "") = (
  accion: accion,
  observado: observado,
  estado: estado,
  observacion: observacion,
)

#let evidencia(tipo: "", referencia: "", descripcion: "") = (
  tipo: tipo,
  referencia: referencia,
  descripcion: descripcion,
)

#let ejecucion-vacia() = (
  estado: "NOT RUN",
  ejecutado_por: "",
  fecha: "",
  hora: "",
  ambiente: "QA",
  version: "",
  observado: "",
  comparacion: "",
  desviacion: "",
  pasos: (),
  evidencias: (),
  bug: "N/A",
  observaciones: "",
)

#let caso(
  id,
  titulo: "",
  prioridad: "Media",
  tipo: "Funcional",
  modulo: "",
  ambiente: "QA",
  objetivo: "",
  precondiciones: (estado: "", usuario: "", configuracion: ""),
  datos: (),
  pasos: (),
  criterio: "",
  ejecucion: none,
) = {
  let ejecucion = if ejecucion == none { (:) } else { ejecucion }
  let precondiciones = if precondiciones == none { (:) } else { precondiciones }
  (
    id: id,
    titulo: titulo,
    prioridad: prioridad,
    tipo: tipo,
    modulo: modulo,
    ambiente: ambiente,
    objetivo: objetivo,
    precondiciones: (: estado: "", usuario: "", configuracion: "", ..precondiciones),
    datos: datos,
    pasos: pasos,
    criterio: criterio,
    ejecucion: (: ..ejecucion-vacia(), ..ejecucion),
  )
}

// [IA] Los módulos son sugerencias extraídas del PPTX; Daniel debe ajustarlos a sus casos reales.
// Los IDs y el andamiaje son de IA; el contenido de cada TC es de Daniel.
#let casos = (
  caso("TC-001", modulo: "Inicio de sesión"),
  caso("TC-002", modulo: "Catálogo y carrito"),
  caso("TC-003", modulo: "Carrito"),
  caso("TC-004", modulo: "Checkout"),
  caso("TC-005", modulo: "Navegación"),
)
