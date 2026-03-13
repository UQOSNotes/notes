#import "/lib.typ": *

#show: notes.with(
  course: "MATH1061",
  title: "Discrete Mathematics",
  year: "2026",
  authors: (),
  preface: [
    #lorem(60)

    #lorem(40)
  ],
)

#include "chapters/01-sets.typ"
#include "chapters/02-functions.typ"
#include "chapters/03-induction.typ"
