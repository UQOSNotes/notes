#import "/lib.typ": *

= Riemann Integration

The Riemann integral makes the idea of signed area precise by trapping a function between lower rectangles and upper rectangles. The central question is whether these two approximations can be made arbitrarily close.

== Partitions and Sums

#definition("Partition")[
  Let $a < b$. A *partition* of $[a, b]$ is a finite set
  $
    P = {x_0, x_1, dots, x_n}
  $
  such that
  $
    a = x_0 < x_1 < dots < x_n = b.
  $
  The subintervals of $P$ are $[x_(i - 1), x_i]$, and their lengths are
  $
    Delta x_i = x_i - x_(i - 1).
  $
]

#definition("Lower and upper sums")[
  Let $f: [a, b] -> RR$ be bounded, and let $P = {x_0, dots, x_n}$ be a partition of $[a, b]$. For each $i$, define
  $
    m_i = inf {f(x): x in [x_(i - 1), x_i]},
    quad
    M_i = sup {f(x): x in [x_(i - 1), x_i]}.
  $
  The *lower sum* and *upper sum* of $f$ with respect to $P$ are
  $
    L(f, P) = sum_(i=1)^n m_i Delta x_i,
    quad
    U(f, P) = sum_(i=1)^n M_i Delta x_i.
  $
]

#diagram(caption: [
  Lower sums use the smallest value on each subinterval; upper sums use the largest value.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      let axis = 0.75pt + black
      draw.line((0.45, 0.45), (7.2, 0.45), stroke: axis, mark: (end: ">"))
      draw.line((0.65, 0.25), (0.65, 4.1), stroke: axis, mark: (end: ">"))

      let xs = (1.0, 2.0, 3.1, 4.25, 5.3, 6.3)
      let lows = (0.95, 1.25, 1.65, 1.45, 2.05)
      let highs = (1.75, 2.25, 2.6, 2.8, 3.2)

      for i in range(0, lows.len()) {
        draw.rect((xs.at(i), 0.45), (xs.at(i + 1), lows.at(i)), fill: green.lighten(80%), stroke: 0.45pt + green)
        draw.rect((xs.at(i), 0.45), (xs.at(i + 1), highs.at(i)), fill: blue.lighten(88%), stroke: 0.45pt + blue)
      }

      let pts = ((1.0, 1.3), (1.55, 1.72), (2.0, 1.45), (2.55, 2.2), (3.1, 1.8), (3.65, 2.6), (4.25, 1.55), (4.8, 2.15), (5.3, 2.35), (5.8, 3.1), (6.3, 2.75))
      draw.line(..pts, stroke: 1pt + black)
      draw.content((2.1, 3.65), text(size: 8.5pt, fill: blue)[upper rectangles])
      draw.content((4.4, 1.15), text(size: 8.5pt, fill: green)[lower rectangles])
    })
  ]
]

#proposition("Basic bounds for sums")[
  If $abs(f(x)) <= M$ for every $x in [a, b]$, then every partition $P$ satisfies
  $
    -M(b - a) <= L(f, P) <= U(f, P) <= M(b - a).
  $
]

#proof[
  Since $-M <= m_i <= M_i <= M$ on every subinterval,
  $
    -M Delta x_i <= m_i Delta x_i <= M_i Delta x_i <= M Delta x_i.
  $
  Summing over $i$ gives the result.
]

== Refinements

#definition("Refinement")[
  If $P$ and $P'$ are partitions of $[a, b]$, then $P'$ is a *refinement* of $P$ if
  $
    P subset P'.
  $
  In other words, $P'$ is obtained by adding extra partition points to $P$.
]

#lemma("Refinements improve lower and upper sums")[
  If $P'$ refines $P$, then
  $
    L(f, P) <= L(f, P')
    quad "and" quad
    U(f, P') <= U(f, P).
  $
]<lem:refinement-sums>

#proof[
  It is enough to consider adding one point $c$ inside a subinterval $[x_(i - 1), x_i]$. Let
  $
    m = inf_( [x_(i - 1), x_i] ) f,
  $
  and let $m_1, m_2$ be the corresponding infima on $[x_(i - 1), c]$ and $[c, x_i]$. Since smaller intervals have fewer points,
  $
    m <= m_1
    quad "and" quad
    m <= m_2.
  $
  Hence
  $
    m(x_i - x_(i - 1))
      <= m_1(c - x_(i - 1)) + m_2(x_i - c).
  $
  This shows the lower sum cannot decrease. The upper-sum argument is the same, using suprema and reversing the inequality.
]

#corollary("Lower sums are below upper sums")[
  If $P$ and $Q$ are any two partitions of $[a, b]$, then
  $
    L(f, P) <= U(f, Q).
  $
]

#proof[
  Let $R = P union Q$. Then $R$ refines both $P$ and $Q$. By #link(<lem:refinement-sums>)[the refinement lemma],
  $
    L(f, P) <= L(f, R) <= U(f, R) <= U(f, Q).
  $
]

== Integrability

#definition("Lower and upper integrals")[
  Let $f: [a, b] -> RR$ be bounded. The *lower integral* and *upper integral* are
  $
    underline(integral)_a^b f = sup {L(f, P): P " is a partition of " [a, b]},
  $
  and
  $
    overline(integral)_a^b f = inf {U(f, P): P " is a partition of " [a, b]}.
  $
]

#definition("Riemann integrable")[
  A bounded function $f: [a, b] -> RR$ is *Riemann integrable* on $[a, b]$ if
  $
    underline(integral)_a^b f = overline(integral)_a^b f.
  $
  In this case, their common value is denoted
  $
    integral_a^b f(x) dif x.
  $
]

#theorem("Integrability criterion")[
  A bounded function $f: [a, b] -> RR$ is Riemann integrable if and only if for every $epsilon > 0$, there exists a partition $P$ of $[a, b]$ such that
  $
    U(f, P) - L(f, P) < epsilon.
  $
]<thm:riemann-criterion>

#proof[
  Suppose $f$ is integrable. By the definitions of supremum and infimum, choose partitions $P_1$ and $P_2$ such that
  $
    integral_a^b f - L(f, P_1) < epsilon / 2,
    quad
    U(f, P_2) - integral_a^b f < epsilon / 2.
  $
  Let $P = P_1 union P_2$. By refinement,
  $
    U(f, P) - L(f, P) <= U(f, P_2) - L(f, P_1) < epsilon.
  $

  Conversely, if such partitions exist, then
  $
    0 <= overline(integral)_a^b f - underline(integral)_a^b f <= U(f, P) - L(f, P)
  $
  can be made smaller than every $epsilon > 0$. Hence the upper and lower integrals are equal.#footnote[This criterion is often called Darboux's criterion in analysis texts, because it is phrased using upper and lower sums.]
]

#example[
  The constant function $f(x) = c$ is integrable on $[a, b]$, and
  $
    integral_a^b c dif x = c(b - a).
  $
  Indeed, every lower sum and every upper sum equals $c(b - a)$.
]

#example[
  The function
  $
    f(x) = cases(1 & "if " x in QQ, 0 & "if " x " is irrational")
  $
  is not integrable on $[0, 1]$. Every subinterval contains both rational and irrational points, so for every partition $P$,
  $
    L(f, P) = 0
    quad "and" quad
    U(f, P) = 1.
  $
  The gap can never be made small.
]

== Computing Sums

#example[
  Let
  $
    f(x) = cases(
      4 & "if " 0 <= x < 3,
      0 & "if " x = 3,
      1 & "if " 3 < x <= 5.
    )
  $
  For
  $
    P_n = {0, 3 - 1 / n, 3 + 1 / n, 5},
  $
  the lower sum uses heights $4, 0, 1$, and the upper sum uses heights $4, 4, 1$. Hence
  $
    L(f, P_n)
      = 4(3 - 1 / n) + 0(2 / n) + 1(2 - 1 / n)
      = 14 - 5 / n,
  $
  while
  $
    U(f, P_n)
      = 4(3 - 1 / n) + 4(2 / n) + 1(2 - 1 / n)
      = 14 + 3 / n.
  $
  Therefore
  $
    U(f, P_n) - L(f, P_n) = 8 / n -> 0,
  $
  so $f$ is integrable and
  $
    integral_0^5 f(x) dif x = 14.
  $
]

#example[
  Let $b > 0$, let $f(x) = x^2$ on $[0, b]$, and use the equal partition $x_i = i b / n$. Since $x^2$ is increasing on $[0, b]$,
  $
    L(f, P_n) = sum_(i=1)^n ((i - 1)b / n)^2 (b / n)
      = b^3 / n^3 sum_(i=1)^n (i - 1)^2
  $
  and
  $
    U(f, P_n) = sum_(i=1)^n (i b / n)^2 (b / n)
      = b^3 / n^3 sum_(i=1)^n i^2.
  $
  Using
  $
    sum_(i=1)^n i^2 = n(n + 1)(2n + 1) / 6,
  $
  both sums tend to $b^3 / 3$. Hence
  $
    integral_0^b x^2 dif x = b^3 / 3.
  $
]

== Existence of Integrals

#theorem("Continuous functions are integrable")[
  Every continuous function $f: [a, b] -> RR$ is Riemann integrable.
]<thm:continuous-integrable>

#proof[
  Since $f$ is continuous on $[a, b]$, it is uniformly continuous by the #link(<thm:closed-interval-uniform-continuity>)[closed interval uniform continuity theorem]. Let $epsilon > 0$. Choose $delta > 0$ such that
  $
    abs(x - y) < delta quad ==> quad abs(f(x) - f(y)) < epsilon / (b - a).
  $
  Choose a partition $P$ whose subinterval lengths are all less than $delta$. On each subinterval, the difference between the supremum and infimum is at most $epsilon / (b - a)$. Hence
  $
    U(f, P) - L(f, P)
      <= sum_(i=1)^n epsilon / (b - a) Delta x_i
      = epsilon.
  $
  The #link(<thm:riemann-criterion>)[integrability criterion] proves integrability.
]

#theorem("Finite discontinuities")[
  If $f: [a, b] -> RR$ is bounded and continuous except at finitely many points, then $f$ is Riemann integrable.
]<thm:finite-discontinuities-integrable>

#proof[
  We prove the idea for one discontinuity $c in (a, b)$. The endpoint cases and finitely many discontinuities are handled by repeating the same construction.

  Let $abs(f(x)) <= M$ and let $epsilon > 0$. If $M = 0$, then $f = 0$ and there is nothing to prove. Otherwise choose $eta > 0$ so small that $c - eta, c + eta in [a, b]$ and
  $
    4 M eta < epsilon / 2.
  $
  On the middle interval $[c - eta, c + eta]$, the upper-lower contribution is at most
  $
    (M - (-M)) dot 2 eta = 4 M eta < epsilon / 2.
  $
  On the two closed intervals $[a, c - eta]$ and $[c + eta, b]$, the function is continuous, hence integrable by #link(<thm:continuous-integrable>)[the continuous integrability theorem]. Choose partitions on those intervals so their combined upper-lower gaps are less than $epsilon / 2$. Adding the points $c - eta$ and $c + eta$ gives a partition of $[a, b]$ with total gap less than $epsilon$.
]

== Integral Properties

#theorem("Basic properties of the integral")[
  Suppose $f$ and $g$ are integrable on $[a, b]$.
  1. If $lambda in RR$, then $lambda f$ is integrable and
  $
    integral_a^b lambda f(x) dif x = lambda integral_a^b f(x) dif x.
  $
  2. The function $f + g$ is integrable and
  $
    integral_a^b (f(x) + g(x)) dif x
      = integral_a^b f(x) dif x + integral_a^b g(x) dif x.
  $
  3. If $f(x) <= g(x)$ for all $x in [a, b]$, then
  $
    integral_a^b f(x) dif x <= integral_a^b g(x) dif x.
  $
  4. If $c in [a, b]$, then
  $
    integral_a^b f(x) dif x
      = integral_a^c f(x) dif x + integral_c^b f(x) dif x.
  $
  5. The function $abs(f)$ is integrable and
  $
    abs(integral_a^b f(x) dif x) <= integral_a^b abs(f(x)) dif x.
  $
]<thm:integral-properties>

#example[
  If $f$ is integrable and $f(x) >= 0$ on $[a, b]$, then
  $
    integral_a^b f(x) dif x >= 0
  $
  by the order property, comparing $f$ with the zero function.
]

#example[
  Let $a > 0$. On $[a, a + 1]$, the function $f(x) = 1 / x$ satisfies
  $
    1 / (a + 1) <= 1 / x.
  $
  Integrating and using the order property gives
  $
    1 / (a + 1) <= integral_a^(a + 1) 1 / x dif x = log(1 + 1 / a).
  $
]

#proposition("Zero integral of a non-negative continuous function")[
  Let $f: [a, b] -> RR$ be continuous and suppose $f(x) >= 0$ for all $x$. If
  $
    integral_a^b f(x) dif x = 0,
  $
  then $f(x) = 0$ for all $x in [a, b]$.
]

#proof[
  Suppose $f(c) > 0$ for some $c$. By continuity, there is a small interval around $c$ on which $f(x) >= f(c) / 2$. The integral over that small interval is positive, and $f >= 0$ elsewhere, so the integral over $[a, b]$ is positive. This contradicts the assumption.
]

== Fundamental Theorem of Calculus

#theorem("Mean value theorem for integrals")[
  If $f: [a, b] -> RR$ is continuous, then there exists $c in [a, b]$ such that
  $
    integral_a^b f(x) dif x = f(c)(b - a).
  $
]<thm:integral-mvt>

#proof[
  By the #link(<thm:extreme-value>)[extreme value theorem], $f$ attains a minimum $m$ and maximum $M$ on $[a, b]$. The order property gives
  $
    m(b - a) <= integral_a^b f(x) dif x <= M(b - a).
  $
  Dividing by $b - a$ gives a number between $m$ and $M$. By the #link(<thm:intermediate-value>)[intermediate value theorem], $f(c)$ equals that number for some $c in [a, b]$.
]

#diagram(caption: [
  The average value of a continuous function is attained somewhere on the interval.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.0, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.0), stroke: 0.75pt + black, mark: (end: ">"))
      let a = 1.1
      let b = 6.2
      let avg = 2.25
      draw.rect((a, 0.5), (b, avg), fill: green.lighten(88%), stroke: 0.6pt + green)
      let pts = ((a, 1.1), (1.8, 2.5), (2.8, 1.9), (3.8, 3.0), (4.8, 2.2), (b, 2.8))
      draw.line(..pts, stroke: 1pt + black)
      draw.line((a, avg), (b, avg), stroke: 1pt + blue)
      draw.content((6.35, avg), text(size: 8.5pt, fill: blue)[average value])
    })
  ]
]

#theorem("Fundamental theorem of calculus I")[
  Let $f: [a, b] -> RR$ be continuous and define
  $
    F(x) = integral_a^x f(t) dif t.
  $
  Then $F$ is differentiable on $(a, b)$ and
  $
    F'(x) = f(x).
  $
]<thm:ftc-one>

#proof[
  Fix $x in (a, b)$. For small $h != 0$ with $x + h in [a, b]$,
  $
    (F(x + h) - F(x)) / h
      = 1 / h integral_x^(x + h) f(t) dif t.
  $
  By the #link(<thm:integral-mvt>)[mean value theorem for integrals], this average equals $f(c_h)$ for some $c_h$ between $x$ and $x + h$. As $h -> 0$, we have $c_h -> x$, so by continuity $f(c_h) -> f(x)$. Hence $F'(x) = f(x)$.
]

#theorem("Fundamental theorem of calculus II")[
  If $f$ is continuous on $[a, b]$ and $A$ is continuous on $[a, b]$ with $A'(x) = f(x)$ for every $x in (a, b)$, then
  $
    integral_a^b f(x) dif x = A(b) - A(a).
  $
]<thm:ftc-two>

#proof[
  Let
  $
    F(x) = integral_a^x f(t) dif t.
  $
  By #link(<thm:ftc-one>)[the first fundamental theorem], $F'(x) = f(x) = A'(x)$. Hence $(F - A)' = 0$ on $(a, b)$, so $F - A$ is constant by the #link(<thm:mean-value>)[mean value theorem]. Therefore
  $
    F(b) - F(a) = A(b) - A(a).
  $
  Since $F(a) = 0$ and $F(b) = integral_a^b f(x) dif x$, the result follows.
]
