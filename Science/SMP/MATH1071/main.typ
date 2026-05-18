#import "/lib.typ": *

#show: notes.with(
  course: "MATH1071",
  title: "Advanced Calculus and Linear Algebra",
  year: "Semester 1, 2026",
  authors: ("April Kidd",),
  preface: [
    These notes are a public student reference for MATH1071. They follow the 2026 lecture material, tutorial sheets, sample examinations, and the older student-written notes colloquially known as "Ducky notes", with the exposition reorganised around clear definitions, checked proofs, and exam-useful examples.

    MATH1071 is a proof-sensitive version of first-year calculus and linear algebra. The aim here is to make the underlying arguments visible without burying the course in unnecessary formalism. If a statement is used later, its hypotheses should be easy to find; if a technique appears in tutorials or exams, there should be a worked example close enough to revise from.

    This is a working draft and will be filled in chapter by chapter during Semester 1, 2026.
  ],
)

#include "chapters/01-fields-and-order.typ"
#include "chapters/02-sequences.typ"
#include "chapters/03-subsequences-and-cauchy.typ"
#include "chapters/04-function-limits-and-continuity.typ"
#include "chapters/05-differentiation.typ"
#include "chapters/06-riemann-integration.typ"
#include "chapters/07-integration-techniques.typ"
#include "chapters/08-series.typ"
#include "chapters/09-systems-and-matrices.typ"
#include "chapters/10-determinants-and-eigenvalues.typ"
#include "chapters/11-vector-spaces.typ"
