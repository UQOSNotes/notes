#import "/lib.typ": *

#show: notes.with(
  course: "MATH1061",
  title: "Discrete Mathematics",
  year: "2026",
  authors: ("April Kidd",),
  preface: [
    #lorem(60)

    #lorem(40)
  ],
)

#include "chapters/01-logic.typ"
#include "chapters/02-proofs.typ"
#include "chapters/03-number-theory.typ"
#include "chapters/04-induction.typ"
#include "chapters/05-sets-and-functions.typ"
#include "chapters/06-relations.typ"
#include "chapters/07-algebraic-structures.typ"
#include "chapters/08-counting.typ"
#include "chapters/09-graph-theory.typ"
