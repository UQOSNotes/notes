#import "/lib.typ": *

= Series and Taylor Expansions

A series is an infinite sum, but convergence is still a statement about sequences: the sequence of partial sums must converge. Most of this chapter is about deciding whether that happens without explicitly finding the sum.

== Series and Partial Sums

#definition("Series")[
  Let $(a_n)$ be a sequence. The expression
  $
    sum_(n=1)^infinity a_n = a_1 + a_2 + a_3 + dots
  $
  is called a *series*. The $N$th *partial sum* is
  $
    S_N = sum_(n=1)^N a_n.
  $
]

#definition("Convergent series")[
  The series $sum_(n=1)^infinity a_n$ *converges* to $S$ if the partial sums satisfy
  $
    S_N -> S.
  $
  In that case we write
  $
    sum_(n=1)^infinity a_n = S.
  $
  If the partial sums do not converge, the series *diverges*.
]

#theorem("Term test")[
  If $sum_(n=1)^infinity a_n$ converges, then
  $
    a_n -> 0.
  $
]<thm:term-test>

#proof[
  Since $a_n = S_n - S_(n - 1)$ and both partial-sum sequences tend to the same limit $S$,
  $
    a_n -> S - S = 0.
  $
]

#note[
  The converse is false. The harmonic series has terms $1 / n -> 0$ but still diverges.
]

#theorem("Cauchy criterion for series")[
  The series $sum_(n=1)^infinity a_n$ converges if and only if for every $epsilon > 0$, there exists $N in NN$ such that whenever $q > p >= N$,
  $
    abs(sum_(n=p+1)^q a_n) < epsilon.
  $
]<thm:series-cauchy>

#proof[
  This is exactly the Cauchy criterion for the partial sums, since
  $
    S_q - S_p = sum_(n=p+1)^q a_n.
  $
]

#example[
  The harmonic series $sum_(n=1)^infinity 1 / n$ diverges. If it converged, the Cauchy criterion with $epsilon = 1 / 3$ would give $N$ such that every tail past $N$ has size less than $1 / 3$. But
  $
    sum_(n=N+1)^(2N) 1 / n
      > sum_(n=N+1)^(2N) 1 / (2N)
      = 1 / 2,
  $
  a contradiction.
]

== First Examples

#proposition("Geometric series")[
  Let $r in RR$. The geometric series $sum_(n=0)^infinity r^n$ converges if and only if $abs(r) < 1$. In that case,
  $
    sum_(n=0)^infinity r^n = 1 / (1 - r).
  $
]<prop:geometric-series>

#proof[
  For $r != 1$,
  $
    S_N = 1 + r + dots + r^N = (1 - r^(N + 1)) / (1 - r).
  $
  This converges exactly when $r^(N + 1) -> 0$, which is equivalent to $abs(r) < 1$. If $r = 1$, the partial sums diverge. If $r = -1$, the terms do not tend to $0$.
]

#example[
  For $abs(x) < 1$,
  $
    1 / (1 - x) = sum_(n=0)^infinity x^n.
  $
  This identity is the source of many Maclaurin series later in the chapter.
]

#proposition("Telescoping series")[
  If most terms cancel in the partial sums, compute the partial sums explicitly before using a convergence test.
]

#example[
  Since
  $
    1 / (n^2 + 3n + 2)
      = 1 / ((n + 1)(n + 2))
      = 1 / (n + 1) - 1 / (n + 2),
  $
  the partial sums telescope:
  $
    sum_(n=1)^N 1 / (n^2 + 3n + 2)
      = 1 / 2 - 1 / (N + 2).
  $
  Hence
  $
    sum_(n=1)^infinity 1 / (n^2 + 3n + 2) = 1 / 2.
  $
]

== Comparison Tests

#theorem("Comparison test")[
  Suppose $0 <= a_n <= b_n$ for all sufficiently large $n$.
  - If $sum b_n$ converges, then $sum a_n$ converges.
  - If $sum a_n$ diverges, then $sum b_n$ diverges.
]<thm:comparison-test>

#proof[
  For non-negative terms, the partial sums are increasing. If $sum b_n$ converges, then the partial sums of $sum a_n$ are increasing and bounded above by the partial sums of $sum b_n$ plus finitely many earlier terms. Hence they converge by the monotone convergence theorem.
]

#theorem("Limit comparison test")[
  Suppose $a_n > 0$, $b_n > 0$, and
  $
    lim_(n -> infinity) a_n / b_n = c
  $
  for some $0 < c < infinity$. Then $sum a_n$ and $sum b_n$ either both converge or both diverge.
]<thm:limit-comparison>

#proof[
  Since $a_n / b_n -> c > 0$, eventually
  $
    c / 2 <= a_n / b_n <= 2c.
  $
  Thus $(c / 2)b_n <= a_n <= 2c b_n$ eventually. Apply the comparison test in both directions.
]

#example[
  The series
  $
    sum_(n=1)^infinity (n^2 + 2) / (n^4 + 5)
  $
  converges by limit comparison with $1 / n^2$, since
  $
    ((n^2 + 2) / (n^4 + 5)) / (1 / n^2)
      = (n^4 + 2n^2) / (n^4 + 5) -> 1.
  $
]

#example[
  The series
  $
    sum_(n=1)^infinity n^2 log n / (n^3 + 1)
  $
  diverges, since the terms are comparable to $(log n) / n$, and
  $
    sum_(n=2)^infinity (log n) / n
  $
  diverges by the integral test.
]

#example[
  Consider
  $
    sum_(n=N)^infinity e^(-a n + 1 / n) / n,
  $
  where $N$ is fixed and $a in RR$. If $a > 0$, then the terms are eventually bounded by a constant multiple of $e^(-a n) / n$, so the series converges by comparison with a geometric series. If $a = 0$, then $e^(1 / n) / n >= 1 / n$, so the series diverges. If $a < 0$, the terms do not tend to $0$. Hence the series diverges exactly when $a <= 0$.
]

== Integral Test and p-Series

#theorem("Integral test")[
  Let $f: [1, infinity) -> RR$ be continuous, non-negative, and decreasing. Then
  $
    sum_(n=1)^infinity f(n)
  $
  and
  $
    integral_1^infinity f(x) dif x
  $
  converge or diverge together.
]<thm:integral-test>

#proof[
  For a decreasing function, the rectangles of height $f(n)$ trap the integral:
  $
    sum_(n=2)^N f(n) <= integral_1^N f(x) dif x <= sum_(n=1)^(N - 1) f(n).
  $
  These inequalities show that the partial sums are bounded exactly when the improper integrals are bounded.
]

#diagram(caption: [
  For a decreasing positive function, unit-width rectangles compare the series with the area under the graph.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.2, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.1), stroke: 0.75pt + black, mark: (end: ">"))

      let heights = (3.1, 2.2, 1.65, 1.3, 1.05, 0.88)
      for i in range(0, heights.len()) {
        let x0 = 1.0 + i * 0.85
        let x1 = x0 + 0.85
        draw.rect((x0, 0.5), (x1, heights.at(i)), fill: blue.lighten(88%), stroke: 0.45pt + blue)
      }
      let pts = ((1.0, 3.1), (1.4, 2.7), (1.85, 2.25), (2.7, 1.7), (3.55, 1.32), (4.4, 1.05), (5.25, 0.88), (6.1, 0.75))
      draw.line(..pts, stroke: 1pt + black)
      draw.content((4.2, 2.8), text(size: 8.5pt, fill: green)[area and sum control each other])
    })
  ]
]

#proposition("p-series")[
  The series
  $
    sum_(n=1)^infinity 1 / n^p
  $
  converges if and only if $p > 1$.
]<prop:p-series>

#proof[
  If $p <= 0$, the terms do not tend to $0$. If $0 < p <= 1$, compare with the harmonic series when $p < 1$, and use the harmonic series when $p = 1$. If $p > 1$, the integral test gives convergence because
  $
    integral_1^infinity 1 / x^p dif x
  $
  converges exactly when $p > 1$.
]

#example[
  The series
  $
    sum_(n=2)^infinity 1 / (n (log n)^p)
  $
  converges if and only if $p > 1$. This follows from the integral test using $u = log x$:
  $
    integral_2^infinity 1 / (x (log x)^p) dif x
      = integral_(log 2)^infinity 1 / u^p dif u.
  $
]

== Root and Ratio Tests

#theorem("Root test")[
  Let $a_n$ be a sequence and set
  $
    rho = lim sup_(n -> infinity) root(n, abs(a_n)).
  $
  If $rho < 1$, then $sum a_n$ converges absolutely. If $rho > 1$, then $sum a_n$ diverges. If $rho = 1$, the test is inconclusive.
]<thm:root-test>

#example[
  For
  $
    sum_(n=1)^infinity n^n / 3^(1 + 2n),
  $
  the root test gives
  $
    root(n, n^n / 3^(1 + 2n))
      = n / (9 root(n, 3)) -> infinity.
  $
  Hence the series diverges.
]

#example[
  For
  $
    sum_(n=1)^infinity ((5n - 3n^3) / (7n^3 + 2))^n,
  $
  the root test gives
  $
    abs((5n - 3n^3) / (7n^3 + 2)) -> 3 / 7 < 1,
  $
  so the series converges absolutely.
]

#theorem("Ratio test")[
  Suppose $a_n != 0$ eventually and
  $
    r = lim_(n -> infinity) abs(a_(n + 1) / a_n)
  $
  exists.
  - If $r < 1$, then $sum a_n$ converges absolutely.
  - If $r > 1$, then $sum a_n$ diverges.
  - If $r = 1$, the test is inconclusive.
]<thm:ratio-test>

#diagram(caption: [
  Ratio and root tests compare the tail of a series with a geometric tail. If the eventual shrink factor is below $1$, the tail is controlled by a convergent geometric series.
])[
  #canvas(length: 1cm, {
    let axis = 0.75pt + black
    let weak = 0.45pt + luma(170)
    let bar = blue
    let geom = green
    draw.line((0.4, 0.45), (8.0, 0.45), stroke: axis, mark: (end: ">"))
    draw.line((0.6, 0.25), (0.6, 3.7), stroke: axis, mark: (end: ">"))
    for i in range(0, 7) {
      let x = 1.1 + i * 0.9
      let h = 2.75 * calc.pow(0.68, i)
      draw.rect((x, 0.45), (x + 0.35, 0.45 + h), fill: bar.lighten(82%), stroke: 0.45pt + bar)
      draw.line((x + 0.45, 0.45), (x + 0.45, 0.45 + 2.75 * calc.pow(0.72, i)), stroke: 0.8pt + geom)
    }
    draw.content((5.2, 2.8), text(size: 8.5pt, fill: green)[geometric comparison])
    draw.content((7.75, 0.15), text(size: 8.5pt)[$n$])
    draw.content((0.2, 3.55), text(size: 8.5pt)[$abs(a_n)$])
  })
]

#example[
  For
  $
    sum_(n=1)^infinity (2n)! / (5^n n!),
  $
  the ratio is
  $
    a_(n + 1) / a_n
      = ((2n + 2)(2n + 1)) / (5(n + 1))
      = 2(2n + 1) / 5 -> infinity.
  $
  Hence the series diverges.
]

#example[
  For
  $
    sum_(n=1)^infinity n! / (2n)!,
  $
  the ratio is
  $
    a_(n + 1) / a_n
      = (n + 1) / ((2n + 2)(2n + 1))
      = 1 / (2(2n + 1)) -> 0.
  $
  Hence the series converges.
]

== Alternating and Absolute Convergence

#theorem("Alternating series test")[
  Suppose $b_n >= 0$, $b_(n + 1) <= b_n$ for all sufficiently large $n$, and $b_n -> 0$. Then
  $
    sum_(n=1)^infinity (-1)^(n + 1) b_n
  $
  converges.
]<thm:alternating-series>

#proof[
  The even and odd partial sums are monotone and bound each other. Their difference is one term $b_n$, which tends to $0$, so they converge to the same limit.
]

#definition("Absolute and conditional convergence")[
  The series $sum a_n$ is *absolutely convergent* if $sum abs(a_n)$ converges. It is *conditionally convergent* if $sum a_n$ converges but $sum abs(a_n)$ diverges.
]

#proposition("Absolute convergence implies convergence")[
  If $sum abs(a_n)$ converges, then $sum a_n$ converges.
]<prop:absolute-implies-convergent>

#proof[
  This follows from the Cauchy criterion and the triangle inequality:
  $
    abs(sum_(n=p+1)^q a_n) <= sum_(n=p+1)^q abs(a_n).
  $
]

#corollary("Absolute convergence estimates")[
  If $sum abs(a_n)$ converges, then
  $
    abs(sum_(n=1)^infinity a_n) <= sum_(n=1)^infinity abs(a_n).
  $
  If $(b_n)$ is bounded, then $sum a_n b_n$ also converges absolutely.
]

#proof[
  The first inequality follows by applying the finite triangle inequality to the partial sums and taking limits. If $abs(b_n) <= M$, then
  $
    sum abs(a_n b_n) <= M sum abs(a_n),
  $
  so $sum a_n b_n$ converges by comparison.
]

#example[
  The series
  $
    sum_(n=1)^infinity (-1)^(n + 1) / root(4, n)
  $
  converges by the alternating series test, but it does not converge absolutely because $sum 1 / n^(1 / 4)$ diverges. Hence it converges conditionally.
]

#pagebreak()

#example[
  The series
  $
    sum_(n=1)^infinity sin n / sqrt(n^4 + 1)
  $
  converges absolutely, since
  $
    abs(sin n / sqrt(n^4 + 1)) <= 1 / n^2
  $
  and $sum 1 / n^2$ converges.
]

== Cauchy Condensation

#note[Starred result from the 2026 tutorials.]

#theorem("Cauchy condensation test")[
  Let $(a_n)$ be non-negative and decreasing. Then
  $
    sum_(n=1)^infinity a_n
  $
  converges if and only if
  $
    sum_(k=0)^infinity 2^k a_(2^k)
  $
  converges.
]<thm:cauchy-condensation>

#proof[
  Group the original series into dyadic blocks:
  $
    a_1 + (a_2 + a_3) + (a_4 + dots + a_7) + dots.
  $
  Since $(a_n)$ is decreasing, the block from $2^k$ to $2^(k + 1) - 1$ is trapped between constant multiples of $2^k a_(2^k)$ and $2^k a_(2^(k + 1))$. These comparisons show the two series converge or diverge together.
]

#example[
  Applying condensation to $a_n = 1 / n^p$ gives
  $
    2^k a_(2^k) = 2^k / (2^k)^p = (2^(1 - p))^k.
  $
  This geometric series converges exactly when $p > 1$, recovering the p-series test.
]

== Taylor and Maclaurin Series

#definition("Taylor series")[
  Suppose $f$ has derivatives of all orders at $a$. The *Taylor series* of $f$ centred at $a$ is
  $
    sum_(n=0)^infinity (f^((n))(a)) / n! (x - a)^n.
  $
  When $a = 0$, this is called the *Maclaurin series*.
]

#note[
  A Taylor series need not equal the original function without further hypotheses. In this course, the standard expansions below may be used on their intervals of convergence.
]

#proposition("Standard Maclaurin series")[
  $
    e^x = sum_(n=0)^infinity x^n / n!,
    quad x in RR.
  $
  $
    sin x = sum_(n=0)^infinity (-1)^n x^(2n + 1) / (2n + 1)!,
    quad x in RR.
  $
  $
    cos x = sum_(n=0)^infinity (-1)^n x^(2n) / (2n)!,
    quad x in RR.
  $
  $
    1 / (1 - x) = sum_(n=0)^infinity x^n,
    quad abs(x) < 1.
  $
  $
    log(1 + x) = sum_(n=1)^infinity (-1)^(n - 1) x^n / n,
    quad -1 < x <= 1.
  $
]<prop:standard-maclaurin>

#example[
  Since
  $
    sin pi = pi - pi^3 / 3! + pi^5 / 5! - pi^7 / 7! + dots = 0,
  $
  the series
  $
    pi - pi^3 / 3! + pi^5 / 5! - pi^7 / 7! + dots
  $
  sums to $0$.
]

#example[
  Since
  $
    cos e = 1 - e^2 / 2! + e^4 / 4! - e^6 / 6! + dots,
  $
  the series
  $
    1 - e^2 / 2! + e^4 / 4! - e^6 / 6! + dots
  $
  sums to $cos e$.
]

#example[
  Using $log(1 + x)$ at $x = 1$,
  $
    1 - 1 / 2 + 1 / 3 - 1 / 4 + dots = log 2.
  $
]

#example[
  For $log(4 + x^2)$,
  $
    log(4 + x^2)
      = log 4 + log(1 + x^2 / 4)
      = 2 log 2 + sum_(n=1)^infinity (-1)^(n - 1) x^(2n) / (n 4^n).
  $
  This expansion is valid for $abs(x) < 2$, and also at $x = plus.minus 2$ by the endpoint convergence of the logarithm series.
]

#example[
  Since
  $
    log((1 + x)^2) = 2 log(1 + x),
  $
  for $x > -1$,
  we have
  $
    log((1 + x)^2)
      = 2 sum_(n=1)^infinity (-1)^(n - 1) x^n / n.
  $
  The usual interval from the logarithm series is $-1 < x <= 1$.
]

#example[
  Subtracting the two logarithm series gives
  $
    log((1 + x) / (1 - x))
      = log(1 + x) - log(1 - x)
      = 2 sum_(k=0)^infinity x^(2k + 1) / (2k + 1),
      quad abs(x) < 1.
  $
  Only the odd powers remain.
]

#example[
  Using $sin^2 x = (1 - cos(2x)) / 2$,
  $
    sin^2 x
      = 1 / 2 (1 - sum_(n=0)^infinity (-1)^n (2x)^(2n) / (2n)!).
  $
  The constant terms cancel, leaving a series starting with $x^2$.
]

#example[
  Multiplication by a polynomial is usually cleaner than differentiating a product. For
  $
    f(x) = (sin x)(x^2 + 3),
  $
  use $sin x = sum_(n=0)^infinity (-1)^n x^(2n + 1) / (2n + 1)!$ and multiply by $x^2 + 3$:
  $
    f(x)
      = 3 sum_(n=0)^infinity (-1)^n x^(2n + 1) / (2n + 1)!
        + sum_(n=0)^infinity (-1)^n x^(2n + 3) / (2n + 1)!.
  $
]

#example[
  From the geometric series,
  $
    1 / (1 + u) = sum_(n=0)^infinity (-1)^n u^n,
    quad abs(u) < 1.
  $
  Taking $u = e^(-x)$ gives
  $
    1 / (1 + e^(-x)) = sum_(n=0)^infinity (-1)^n e^(-n x),
    quad x > 0.
  $
]

== Shifted Standard Series

#proposition("Useful Taylor series at zero")[
  For fixed $a != 0$, the following follow from the geometric series and standard binomial series, with the usual radius restrictions. For the logarithm formula, assume $a < 0$ so that $x - a$ is real and positive near $0$.
  $
    1 / (x - a)
      = -1 / a sum_(n=0)^infinity (x / a)^n,
  $
  $
    log(x - a)
      = log(-a) - sum_(n=1)^infinity x^n / (n a^n)
  $
  $
    1 / sqrt(1 - x)
      = sum_(n=0)^infinity binom(2n, n) x^n / 4^n,
    quad
    1 / sqrt(1 - x^2)
      = sum_(n=0)^infinity binom(2n, n) x^(2n) / 4^n,
  $
  and
  $
    arcsin x
      = sum_(n=0)^infinity binom(2n, n) x^(2n + 1) / (4^n (2n + 1)).
  $
]

== Radius of Convergence

#definition("Power series and radius of convergence")[
  A *power series* centred at $a$ is a series of the form
  $
    sum_(n=0)^infinity c_n (x - a)^n.
  $
  Its *radius of convergence* is the number $R in [0, infinity]$ such that the series converges absolutely for $abs(x - a) < R$ and diverges for $abs(x - a) > R$. Endpoints must be checked separately.
]

#diagram(caption: [
  A radius of convergence gives an open interval of guaranteed convergence. The endpoints $a - R$ and $a + R$ must be checked separately.
])[
  #canvas(length: 1cm, {
    let axis = 0.8pt + black
    let accent = blue
    let endpoint = green
    draw.line((0.4, 0.8), (8.0, 0.8), stroke: axis, mark: (end: ">"))
    draw.line((2.1, 0.8), (6.1, 0.8), stroke: 2.1pt + accent)
    draw.circle((2.1, 0.8), radius: 0.09, fill: white, stroke: 0.9pt + endpoint)
    draw.circle((6.1, 0.8), radius: 0.09, fill: white, stroke: 0.9pt + endpoint)
    draw.circle((4.1, 0.8), radius: 0.075, fill: accent, stroke: none)
    draw.line((4.1, 0.8), (2.1, 1.55), stroke: 0.7pt + luma(120))
    draw.line((4.1, 0.8), (6.1, 1.55), stroke: 0.7pt + luma(120))
    draw.content((2.1, 0.35), text(size: 8.5pt)[$a - R$])
    draw.content((4.1, 0.35), text(size: 8.5pt)[$a$])
    draw.content((6.1, 0.35), text(size: 8.5pt)[$a + R$])
    draw.content((4.1, 1.85), text(size: 8.5pt, fill: blue)[absolute convergence])
    draw.content((2.0, 1.15), text(size: 8pt, fill: green)[check])
    draw.content((6.2, 1.15), text(size: 8pt, fill: green)[check])
  })
]

#example[
  For
  $
    sum_(n=0)^infinity x^n / n!,
  $
  the ratio test gives
  $
    abs(x^(n + 1) / (n + 1)! dot n! / x^n) = abs(x) / (n + 1) -> 0.
  $
  Thus the radius of convergence is $infinity$.
]

#pagebreak()
