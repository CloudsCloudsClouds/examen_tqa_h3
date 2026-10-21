// Bug report template (blank). Converted from Bug_report_template_ejemplo.docx.

#let banner-blue = rgb("#4472c4")
#let rule-blue = rgb("#4f81bd")
#let id-fill = rgb("#d9e2f3")
#let label-fill = rgb("#dddddd")

#set document(title: "Bug report template")
#set page(
  paper: "a4",
  margin: 2.54cm,
  // thin rule near the top of each page (lives in the header in the original)
  background: place(top + left, dx: 2.40cm, dy: 2.12cm,
    line(length: 16.8cm, stroke: 0.75pt + rule-blue)),
)
#set text(font: ("Calibri", "Carlito", "Liberation Sans"), size: 10pt, lang: "es", hyphenate: false)
#set par(justify: true, leading: 0.76em)

#v(4.6pt)
#move(dx: -3pt, block(width: 100% + 6pt, fill: banner-blue, inset: (x: 3pt, y: 6.2pt))[
  #text(size: 11pt, fill: white)[B#text(size: 8.8pt)[UG REPORT TEMPLATE]]
])

#v(15.9pt)

#table(
  columns: (2.85cm, 1fr),
  stroke: 0.5pt + black,
  inset: (x: 0.19cm, y: 4.05pt),

  table.cell(inset: (x: 0.19cm, y: 0.5pt))[#block(width: 100%, fill: id-fill, inset: (x: 2.5pt, y: 5.2pt))[\#BUG-XX-F]],
  table.cell(inset: (x: 0.19cm, y: 0.5pt))[#block(width: 100%, fill: id-fill, inset: (x: 2.5pt, y: 5.2pt))[B#text(size: 8pt)[UG] R#text(size: 8pt)[EPORT]]],

  table.cell(fill: label-fill)[Title], [],
  table.cell(fill: label-fill)[Descripción], [],
  table.cell(fill: label-fill)[Pasos],
  [1.- \
   2.- \
   3.- \
   \
   Referencia: ],
  table.cell(fill: label-fill)[RESULTADO ACTUAL], [],
  table.cell(fill: label-fill)[RESULTADO ESPERADO], [],
  table.cell(fill: label-fill)[PRIORIDAD #v(14pt)], [Alta 1-5 → ],
  table.cell(fill: label-fill)[SEVERIDAD], [Critica 1-5 #"-->" #v(14pt)],
  table.cell(fill: label-fill)[AMBIENTE],
  [Dispositivo = \
   Sistema operativo = \
   Navegador = \
   Version del software = ],
  // space for screenshots
  table.cell(fill: label-fill)[ADJUNTOS], [#v(100pt)],
  table.cell(fill: label-fill)[COMENTARIOS], [],
)
