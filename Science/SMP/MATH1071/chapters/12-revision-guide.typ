#import "/lib.typ": *

= Revision Guide

This chapter is a compact checklist for pre-exam revision. It is not a substitute for the definitions, proofs, and examples in the earlier chapters.

== Key Results and Theorems

#note[
  The following results are central to the course and are natural candidates for statement, proof, or application questions:
  - monotone convergence theorem,
  - Bolzano-Weierstrass theorem,
  - Cauchy convergence criterion for sequences,
  - intermediate value theorem,
  - extreme value theorem,
  - Rolle's theorem and the mean value theorem,
  - fundamental theorem of calculus,
  - comparison criterion for series.
]

For each theorem, practise writing the assumptions before the conclusion. A correct conclusion with missing assumptions is usually not a correct theorem statement.

#example("Monotone convergence theorem")[
  A complete statement is:

  If $(a_n)$ is monotone increasing and bounded above, then $(a_n)$ converges and
  $
    lim_(n -> infinity) a_n = sup {a_n : n in NN}.
  $
  Similarly, if $(a_n)$ is monotone decreasing and bounded below, then it converges to its infimum.
]

#example("Bolzano-Weierstrass theorem")[
  A complete statement is:

  Every bounded sequence in $RR$ has a convergent subsequence.

  A standard proof route is: find a monotone subsequence, observe that it is still bounded, then apply the monotone convergence theorem to that subsequence.
]

#example("Fundamental theorem of calculus")[
  A complete FTC statement must specify the regularity assumptions. One common version is:

  If $f: [a, b] -> RR$ is continuous and
  $
    F(x) = integral_a^x f(t) dif t,
  $
  then $F$ is differentiable on $(a, b)$ and $F'(x) = f(x)$.
]

== Proof Routines

#proposition("Epsilon proof for sequences")[
  To prove $a_n -> L$ from the definition:
  1. Start with $epsilon > 0$.
  2. Estimate $abs(a_n - L)$ by something simple.
  3. Choose $N$ so that the simple expression is $< epsilon$ whenever $n >= N$.
  4. Finish by writing the implication $n >= N => abs(a_n - L) < epsilon$.
]

#example[
  To prove $1 / sqrt(n) -> 0$, let $epsilon > 0$ and choose $N > 1 / epsilon^2$. If $n >= N$, then
  $
    abs(1 / sqrt(n) - 0) = 1 / sqrt(n) <= 1 / sqrt(N) < epsilon.
  $
]

#proposition("Epsilon-delta proof for functions")[
  To prove $lim_(x -> a) f(x) = L$:
  1. Start with $epsilon > 0$.
  2. Rewrite or bound $abs(f(x) - L)$ in terms of $abs(x - a)$.
  3. Choose $delta$ so the bound is $< epsilon$.
  4. Finish with $0 < abs(x - a) < delta => abs(f(x) - L) < epsilon$.
]

#example[
  To show $lim_(x -> 2) x^2 = 4$, restrict $abs(x - 2) < 1$, so $1 < x < 3$ and $abs(x + 2) < 5$. Then
  $
    abs(x^2 - 4) = abs(x - 2) abs(x + 2) < 5 abs(x - 2).
  $
  Choose $delta = min(1, epsilon / 5)$.
]

#proposition("Continuity proof pattern")[
  To prove a function is continuous at $a$, either use the definition directly, or combine known continuous functions using limit laws. To prove discontinuity, find one-sided limits or a sequence $x_n -> a$ such that $f(x_n)$ does not tend to $f(a)$.
]

#proposition("Subspace proof pattern")[
  To prove $U$ is a subspace, show:
  $
    0 in U,
    quad
    u, v in U, c, d in RR => c u + d v in U.
  $
  To disprove it, it is enough to show one failure: no zero vector, not closed under addition, or not closed under scalar multiplication.
]

== Series Questions

#note[
  For a series $sum a_n$, first check $a_n -> 0$. If not, the series diverges. If yes, choose a test based on the form of the term.
]

#table(
  columns: (1.4fr, 2fr),
  inset: 6pt,
  stroke: 0.4pt + luma(210),
  [Term shape], [Likely tool],
  [$r^n$, constants to the $n$], [geometric series, root test],
  [factorials], [ratio test],
  [powers of $n$], [comparison or limit comparison],
  [$1 / (n (log n)^p)$], [integral test],
  [alternating signs], [alternating series test, then absolute convergence],
  [monotone positive terms with powers of $2$], [Cauchy condensation; starred in the 2026 tutorials],
)

#example[
  For
  $
    sum_(n=1)^infinity (2n)! / (5^n n!),
  $
  factorials suggest the ratio test:
  $
    a_(n + 1) / a_n
      = ((2n + 2)(2n + 1)) / (5(n + 1))
      -> infinity.
  $
  Hence the series diverges.
]

#example[
  For
  $
    sum_(n=2)^infinity 1 / (n (log n)^p),
  $
  the integral test gives
  $
    integral_2^infinity 1 / (x (log x)^p) dif x
      = integral_(log 2)^infinity 1 / u^p dif u.
  $
  Therefore the series converges exactly when $p > 1$.
]

== Integration Questions

#note[
  For a definite or improper integral:
  - check whether the integrand is continuous on the interval;
  - identify singular endpoints or infinite endpoints;
  - for variable limits, use the fundamental theorem before simplifying;
  - for antiderivatives, try substitution before integration by parts if a derivative is visibly present.
]

#example[
  If
  $
    F(x) = integral_(sin x)^1 e^(t^2) dif t,
  $
  then the upper limit is constant and the lower limit depends on $x$. By the variable-limit rule,
  $
    F'(x) = -e^(sin^2 x) cos x.
  $
]

#example[
  To decide
  $
    integral_2^infinity 1 / (x^2 - 1) dif x,
  $
  use partial fractions:
  $
    1 / (x^2 - 1) = 1 / 2 (1 / (x - 1) - 1 / (x + 1)).
  $
  Hence
  $
    integral_2^R 1 / (x^2 - 1) dif x
      = 1 / 2 log((R - 1) / (R + 1)) + 1 / 2 log 3,
  $
  which tends to $1 / 2 log 3$.
]

== Linear Algebra Questions

#note[
  The determinant, eigenvalue, and vector-space material below is represented strongly in the 2026 tutorials and recent exams. The current lecture transcript set does not include the full Week 12--13 determinant/eigenvalue/vector-space lectures.
]

#table(
  columns: (1.4fr, 2.1fr),
  inset: 6pt,
  stroke: 0.4pt + luma(210),
  [Question type], [Method],
  [Solve $A x = b$], [row-reduce the augmented matrix $[A | b]$],
  [Solve $A x = 0$], [row-reduce and express the free variables as parameters],
  [Find $A^(-1)$], [row-reduce $[A | I]$ to $[I | A^(-1)]$],
  [Build a matrix for $T$], [use the columns $T(e_1), dots, T(e_n)$],
  [Compute a large determinant], [use row operations or expand along a sparse row or column],
  [Find eigenvalues], [solve $det(A - lambda I) = 0$],
  [Find eigenvectors], [solve $(A - lambda I)v = 0$ for each eigenvalue],
  [Test a subspace], [check $0 in U$ and closure under linear combinations],
)

#note[
  The dot product, cross product, projections, orthogonal matrices, symmetric/skew-symmetric matrices, trace, nilpotent matrices, and Vandermonde determinant are tutorial-derived tools in these notes. Vandermonde is starred in the 2026 tutorials.
]

#example[
  For
  $
    A = mat(5, 0, 0; 1, 2, 1; 1, 1, 2),
  $
  the characteristic polynomial is
  $
    det(A - lambda I)
      = (5 - lambda)((2 - lambda)^2 - 1).
  $
  Thus $lambda = 5, 3, 1$. Then solve $(A - lambda I)v = 0$ separately for each eigenvalue.
]

#example[
  Let
  $
    V = {p(x) in P_7(RR) : p(1) = 0}.
  $
  The condition $p(1) = 0$ is linear, so $V$ is a subspace. Every polynomial in $V$ has a factor $x - 1$, and degree at most $7$, so
  $
    p(x) = (x - 1)q(x),
    quad
    deg q <= 6.
  $
  A basis is
  $
    x - 1, x(x - 1), x^2(x - 1), dots, x^6(x - 1),
  $
  and $dim V = 7$.
]

== Common Traps

#note[
  - A theorem cannot be used unless its hypotheses are checked.
  - A sequence can have terms tending to $0$ while the series still diverges.
  - Absolute convergence implies convergence, but convergence need not imply absolute convergence.
  - A Taylor series formula must be used inside its interval of convergence.
  - The zero vector is in every eigenspace, but is not an eigenvector.
  - A set described by a non-linear condition is usually not a subspace.
  - In this course, write $log$ for the natural logarithm.
]

== Complete Answer Standards

For computation questions, write enough working that the method is clear. For proof questions, state the relevant assumptions and make each implication explicit.

#example[
  A complete answer to "show the series converges absolutely" should include:
  1. the absolute-value series,
  2. the comparison or test being used,
  3. the conclusion that the absolute-value series converges,
  4. the conclusion that the original series converges absolutely.
]

#example[
  A complete answer to "find an eigenspace" should include:
  1. the eigenvalue $lambda$,
  2. the matrix $A - lambda I$,
  3. the reduced homogeneous system,
  4. the span of the non-zero eigenvectors.
]
