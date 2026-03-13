#import "/lib.typ": *

#show: notes.with(
  course: "MATH1061",
  title: "Discrete Mathematics",
  year: "2026",
  authors: ("April Kidd",),
  preface: [
    These notes were created as the first input into the UQ Open Source notes repository. Majority of these notes were taken from the 2025 rendition of the course (as it is now), and were constructed from memory, Susanna Epp's book "Discrete Mathematics with Applications", and the UQ Extend pre-reading. Feel free to correct or extend (pun intended) any of the content in this text.

    As a personal note, the reason I began with writing this compilation is because Discrete Mathematics, and Dr. Barbara Maenhaut's teaching of it, holds a quite special place in my heart. When I arrived at university, I was beginning a Bachelor of Computer Science / Economics. MATH1061, Discrete Mathematics, was among my first courses in my first semester, and the passion Maenhaut showed for the subject, and her exceptional teaching, invited me to fall back in love with mathematics. Its to her that I owe my eventual change in degree to Pure Mathematics, and the passion I've had reignited in me for the subject. So, truly, thank you, and I hope these notes allow some other students to fall in love with mathematics as I have.
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
