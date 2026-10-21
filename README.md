# examen_tqa_h3
Daniel Bernal

Esto es principalmente un examen de TQA, pero en cierta forma tambien es un experimento sobre hacer TQA de forma correcta con asistencia de IA. O agentes de IA.

Ojo. El bulto del trabajo es hecho por mi persona, pero me estoy asistiendo por agentes de IA locales. Todo el contenido hecho por IA es marcado como tal.

(En cierta forma siento que me estoy disparando en el pie al usar agentes de IA, porque no tengo mucha experiencia con esto. ¿¿Porque estoy haciendo esto?? Seria más rapido hacerlo todo de golpe a mano.)

En todo caso, estoy creando un AGENTS.md

Realmente seria más rapido hacerlo por mi cuenta...

## Commits
Quiero notar que los commits que hago son algo desordenados.

Pero mantengo algo constante. Cada actividad del examen tiene su commit. No veo proposito a complicarme la vida en esta ocacion con ramas.

Cierto. Github. El board y eso...

Voy a seguir un flow correcto.

---

> 🤖 **Sección generada por IA** · agente: OpenCode · modelo: DeepSeek V4.1 Flash · 2026-10-20 · fuente: `Examen_Practico_Hito_3_TQA_Instrucciones.pptx` · revisión humana: pendiente
>
> `[IA]` Resumen del enunciado del Hito 3. Daniel debe revisarlo y corregirlo.

## Resumen del examen (Hito 3) · [IA]

**Modalidad:** individual · **Tiempo sugerido:** 90 minutos.
**Aplicación bajo prueba:** [SauceDemo (Swag Labs)](https://www.saucedemo.com/). Usar los usuarios de demostración indicados en la página.

### Actividades y entregables

| Actividad | Entregable | Puntos clave |
| --- | --- | --- |
| Caja negra | 5 casos funcionales ejecutados | Casos distintos y con propósito. Cada uno: ID/título, precondiciones, datos, pasos, resultado esperado y obtenido, Passed/Failed y evidencia. |
| Caja blanca | Análisis + 3 casos diseñados | Identificar decisiones y condiciones, indicar criterio (sentencias, decisiones o condiciones), calcular el mínimo de casos, justificar cobertura y explicar qué ajuste haría falta si 3 casos no alcanzan. |
| Gherkin | Al menos 2 escenarios | Uno exitoso y uno alternativo o de error. Usar `Feature`, `Scenario`, `Given`, `When`, `Then`; se permite `And`/`But`. |
| Bugs | Defectos reproducibles | ID/título, descripción, precondiciones y datos, pasos, resultado esperado y actual, evidencia y severidad/prioridad. Si la prueba pasa, registrar `Passed`; no inventar bugs. |
| GitHub | Repositorio individual | README, archivos Markdown, Issues y Project Board. Usar Git desde terminal y commits descriptivos. |
| Informe | 1 PDF consolidado | Introducción y URL, los 5 casos y resultados, bugs y evidencias, análisis de caja blanca, escenarios Gherkin y conclusiones. |

### Código de caja blanca

```python
def validar_compra(edad, cuenta_activa, saldo, monto):
    if edad < 18:
        return "Compra no permitida: edad"
    if not cuenta_activa:
        return "Compra no permitida: cuenta"
    if saldo >= monto and monto > 0:
        return "Compra aprobada"
    return "Compra rechazada"
```

Entradas: `edad`, `cuenta_activa`, `saldo`, `monto`. Salidas: no permitida (edad), no permitida (cuenta), aprobada o rechazada.

### Estructura sugerida del repositorio

```text
Examen-Hito-3-TQA/
├── README.md
├── docs/
│   ├── casos_caja_negra.md
│   ├── analisis_caja_blanca.md
│   └── escenarios_gherkin.md
├── bugs/
│   └── bugs_encontrados.md
├── evidencias/
│   └── capturas/
└── entregable/
    └── informe_hito3.pdf
```

### Board de GitHub

Columnas: `To Do`, `In Progress`, `In Review`, `Done`.

Tareas: diseñar casos, analizar código, redactar Gherkin, ejecutar pruebas, registrar resultados, documentar bugs, revisar evidencias, revisar informe, preparar PDF y actualizar README.

### Entrega final

Enviar por Moodle el enlace del repositorio y el informe final en PDF. El repositorio debe incluir los 5 casos con resultados, el análisis de caja blanca con 3 casos, los bugs con evidencia, los escenarios Gherkin, el Project Board con Issues y el PDF consolidado.

---

Esto es contenido mio. Que interesante. Pero debo diferenciar mejor entre el trabajo hecho por IA y por mi.

No voy a dejar que la IA vuelva a trabajar en este archivo.

Por conveniencia, converti las plantillas a typst - basicamente latex pero mas bonito de usar.
(Tambien lo uso para mi integrador y un generador de reportes.)

## Objetivos
### Caja negra
Voy a documentar aquí mi trabajo hecho en www.saucedeomo.com y entonces dejare que la IA llene las plantillas y los reportes de bugs. Incluire documentacion y pruebas.

Porsiacaso tambien añadire git lfs
