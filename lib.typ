// uqosnotes — multi-discipline academic notes template
// https://github.com/UQOSNotes/template

#import "@preview/cetz:0.4.2": canvas, draw

// ── Colour palette ────────────────────────────────────────────────────────────

#let _c = (
  theorem: rgb("#1f4e8c"),
  definition: rgb("#0f766e"),
  proof: rgb("#52525b"),
  example: rgb("#9a5a16"),
  remark: rgb("#6b7280"),
  note: rgb("#0e7490"),
  important: rgb("#b42318"),
  algorithm: rgb("#5b21b6"),
  code: rgb("#1e293b"),
  diagram: rgb("#374151"),
  exercise: rgb("#a64718"),
  solution: rgb("#166534"),
)

// ── Counters ──────────────────────────────────────────────────────────────────

// Theorem, lemma, corollary, and proposition share one counter.
#let _thm-ctr = counter("uqosnotes:thm")
#let _def-ctr = counter("uqosnotes:def")
#let _ex-ctr = counter("uqosnotes:ex")
#let _exr-ctr = counter("uqosnotes:exr")

// ── Internal helpers ──────────────────────────────────────────────────────────

#let _statement-block(color, label, body) = {
  block(
    width: 100%,
    breakable: true,
    inset: (left: 12pt, right: 11pt, top: 8pt, bottom: 8pt),
    fill: color.lighten(97%),
    stroke: (
      rest: 0.45pt + color.lighten(68%),
      left: 2pt + color.lighten(18%),
    ),
    radius: 2pt,
    above: 0.75em,
    below: 0.75em,
  )[
    #block(
      spacing: 0pt,
      sticky: true,
    )[#text(size: 10pt, weight: "bold", fill: color)[#label]]
    #v(4pt)
    #body
  ]
}

#let _callout-block(color, label, body) = {
  block(
    width: 100%,
    breakable: true,
    inset: (left: 12pt, right: 11pt, top: 8pt, bottom: 8pt),
    fill: color.lighten(96%),
    stroke: (
      rest: 0.45pt + color.lighten(68%),
      left: 2pt + color.lighten(12%),
    ),
    radius: 2pt,
    above: 0.75em,
    below: 0.75em,
  )[
    #block(
      spacing: 0pt,
      sticky: true,
    )[#text(size: 10pt, weight: "bold", fill: color)[#label]]
    #v(4pt)
    #body
  ]
}

#let _proof-block(body) = {
  block(
    width: 100%,
    breakable: true,
    inset: (left: 0pt, right: 0pt, top: 2pt, bottom: 2pt),
    above: 0.45em,
    below: 0.65em,
  )[
    #text(style: "italic", fill: luma(55))[Proof.]
    #h(0.35em)
    #body
    #h(1fr)
    $square$
  ]
}

// Resolves (title, body) from ..args, supporting three call styles:
//   #box[body]                   — no title
//   #box("Title")[body]          — positional title
//   #box(title: "Title")[body]   — keyword title
#let _resolve-args(args) = {
  let pos = args.pos()
  let title = if pos.len() > 1 {
    pos.first()
  } else {
    args.named().at("title", default: none)
  }
  let body = pos.last()
  (title, body)
}

#let _numbered(name, color, ctr, title, body) = {
  ctr.step()
  context {
    let n = ctr.get().first()
    let label = if title == none { [#name #n] } else { [#name #n (#title)] }
    _statement-block(color, label, body)
  }
}

// ── Template ──────────────────────────────────────────────────────────────────

/// Set up the document. Call as:
/// ```typ
/// #show: notes.with(
///   course: "MATH1061",
///   title: "Discrete Mathematics",
///   year: "Semester 1, 2026",
///   authors: ("Alice Smith",),
/// )
/// ```
#let _in_body = state("in-body", false)

#let notes(
  course: "",
  title: "Notes",
  year: "",
  authors: (),
  preface: none,
  body,
) = {
  let authors = if type(authors) == str { (authors,) } else { authors }
  show heading.where(level: 1): it => {
    _thm-ctr.update(0)
    _def-ctr.update(0)
    _ex-ctr.update(0)
    _exr-ctr.update(0)
    it
  }

  set document(title: title, author: authors)

  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
    header: context {
      if _in_body.at(here()) {
        set text(size: 9pt, fill: luma(130))
        let h1s = query(heading.where(level: 1).before(here())).filter(h => h.numbering != none)
        let h2s = query(heading.where(level: 2).before(here()))
        let chapter = if h1s.len() > 0 { h1s.last().body } else { none }
        let section = if h2s.len() > 0 { h2s.last().body } else { none }
        let rparts = (chapter, section).filter(x => x != none)
        if course != "" { course }
        h(1fr)
        if rparts.len() > 0 { rparts.join([  ·  ]) }
      }
    },
    footer: context {
      if _in_body.at(here()) {
        set text(size: 9pt, fill: luma(130))
        datetime.today().display("[day] [month repr:long] [year]")
        h(1fr)
        counter(page).display()
      }
    },
  )

  set text(size: 11.5pt, lang: "en", font: "New Computer Modern")
  set heading(numbering: "1.1")
  set par(justify: true, leading: 0.74em)
  show heading: it => {
    v(0.8em, weak: true)
    it
    v(0.4em, weak: true)
  }

  // Title block
  v(2cm)
  align(center)[
    #block(text(size: 26pt, weight: "bold")[#title])
    #if course != "" or year != "" {
      v(0.4em)
      let subtitle = (course, year).filter(s => s != "").join("  \u{00b7}  ")
      text(size: 13pt, fill: luma(80))[#subtitle]
    }
    #if authors.len() > 0 {
      v(0.4em)
      text(size: 11pt)[#authors.join(", ")]
    }
    #v(0.8em)
    #line(length: 50%, stroke: 0.5pt + luma(160))
  ]
  v(1.5cm)

  pagebreak()

  {
    show outline.entry.where(level: 1): it => {
      v(0.8em, weak: true)
      strong(it)
    }
    outline(depth: 2, indent: 1em)
  }

  pagebreak()

  _in_body.update(true)

  if preface != none {
    heading(level: 1, numbering: none)[Preface]
    preface
    pagebreak()
  }

  body
}

// ── Theorem family ────────────────────────────────────────────────────────────

/// Theorem box. `#theorem[...]`, `#theorem("Title")[...]`, or `#theorem(title: "Title")[...]`
#let theorem(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Theorem", _c.theorem, _thm-ctr, title, body)
}

/// Lemma box. Shares the theorem counter.
#let lemma(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Lemma", _c.theorem, _thm-ctr, title, body)
}

/// Corollary box. Shares the theorem counter.
#let corollary(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Corollary", _c.theorem, _thm-ctr, title, body)
}

/// Proposition box. Shares the theorem counter.
#let proposition(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Proposition", _c.theorem, _thm-ctr, title, body)
}

// ── Definition ────────────────────────────────────────────────────────────────

/// Definition box. Has its own counter.
#let definition(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Definition", _c.definition, _def-ctr, title, body)
}

// ── Proof ─────────────────────────────────────────────────────────────────────

/// Proof box. Ends with a QED symbol.
#let proof(body) = {
  _proof-block(body)
}

// ── Example ───────────────────────────────────────────────────────────────────

/// Example box. Has its own counter.
#let example(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Example", _c.example, _ex-ctr, title, body)
}

// ── Unnumbered callouts ───────────────────────────────────────────────────────

/// Remark box.
#let remark(body) = { _statement-block(_c.remark, [Remark], body) }

/// Note box.
#let note(body) = { _callout-block(_c.note, [Note], body) }

/// Important box.
#let important(body) = { _callout-block(_c.important, [Important], body) }

// ── Exercise & Solution ───────────────────────────────────────────────────────

/// Exercise box. Has its own counter.
#let exercise(..args) = {
  let (title, body) = _resolve-args(args)
  _numbered("Exercise", _c.exercise, _exr-ctr, title, body)
}

/// Solution box.
#let solution(body) = { _statement-block(_c.solution, [Solution], body) }

// ── Algorithm ─────────────────────────────────────────────────────────────────

/// Algorithm box. `#algorithm[...]` or `#algorithm("Name")[...]`
#let algorithm(..args) = {
  let (title, body) = _resolve-args(args)
  let label = if title == none { [Algorithm] } else { [Algorithm \u{2014} #title] }
  _statement-block(_c.algorithm, label, body)
}

// ── Code ──────────────────────────────────────────────────────────────────────

/// Code block wrapper. Place a fenced raw block inside.
#let code-block(body) = {
  block(
    width: 100%,
    breakable: true,
    inset: (x: 14pt, y: 10pt),
    fill: _c.code.lighten(93%),
    stroke: (left: 3pt + _c.code),
    radius: (right: 2pt),
    body,
  )
}

// ── Diagram ───────────────────────────────────────────────────────────────────

/// Diagram container with a dashed border. Optional `caption:` label.
#let diagram(caption: none, body) = {
  block(
    width: 100%,
    inset: 16pt,
    stroke: (paint: _c.diagram, dash: "dashed", thickness: 0.5pt),
    radius: 3pt,
  )[
    #set align(center)
    #body
    #if caption != none {
      v(6pt)
      text(size: 9pt, fill: luma(90), style: "italic")[#caption]
    }
  ]
}
