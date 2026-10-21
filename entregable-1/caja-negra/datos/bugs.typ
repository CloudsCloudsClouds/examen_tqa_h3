// IA | OpenCode | DeepSeek V4.1 Flash | 2026-10-20 | esquema y andamiaje del diccionario de bugs
// [HUMANO] Daniel: agregar aquí los bugs reproducibles encontrados durante la ejecución.
//
// Este archivo es la fuente de verdad de los bugs de caja negra.
// El documento se genera desde bugs_encontrados.typ; no hace falta editar el renderizador.
//
// Ejemplo de un bug completo:
//   bug("BUG-001",
//     titulo: "...",
//     descripcion: "...",
//     precondiciones: "...",
//     datos: "...",
//     pasos: ("...", "..."),
//     esperado: "...",
//     actual: "...",
//     prioridad: "Alta",
//     severidad: "Crítica",
//     estado: "Abierto",
//     modulo: "...",
//     ambiente: "QA",
//     evidencias: (
//       evidencia(tipo: "Captura", referencia: "BUG-001_01.png", descripcion: "..."),
//     ),
//     observaciones: "...",
//   )

#let evidencia(tipo: "", referencia: "", descripcion: "") = (
  tipo: tipo,
  referencia: referencia,
  descripcion: descripcion,
)

#let bug(
  id,
  titulo: "",
  descripcion: "",
  precondiciones: "",
  datos: "",
  pasos: (),
  esperado: "",
  actual: "",
  prioridad: "Media",
  severidad: "Media",
  estado: "Abierto",
  modulo: "",
  ambiente: "QA",
  evidencias: (),
  observaciones: "",
) = (
  id: id,
  titulo: titulo,
  descripcion: descripcion,
  precondiciones: precondiciones,
  datos: datos,
  pasos: pasos,
  esperado: esperado,
  actual: actual,
  prioridad: prioridad,
  severidad: severidad,
  estado: estado,
  modulo: modulo,
  ambiente: ambiente,
  evidencias: evidencias,
  observaciones: observaciones,
)

// [HUMANO] Daniel: vacío hasta encontrar bugs reproducibles. No inventar defectos.
#let bugs = ()
