#import "/lib.typ": *

= Differentiation

Differentiation measures the best linear approximation to a function at a point. In this chapter, the main ideas are derivative rules, how differentiability interacts with continuity, and the mean value theorem, which turns local derivative information into global information about a function.

== Derivatives

#definition("Derivative at a point")[
  Let $f: I -> RR$, where $I$ is an interval, and let $c$ be an interior point of $I$. We say that $f$ is *differentiable at* $c$ if the limit
  $
    f'(c) = lim_(x -> c) (f(x) - f(c)) / (x - c)
  $
  exists. Equivalently,
  $
    f'(c) = lim_(h -> 0) (f(c + h) - f(c)) / h.
  $
  The number $f'(c)$ is the *derivative* of $f$ at $c$.
]

#diagram(caption: [
  The derivative is the limiting slope of secant lines through nearby points.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.0, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.0), stroke: 0.75pt + black, mark: (end: ">"))

      let f(x) = { 0.12 * (x - 3.2) * (x - 3.2) + 1.25 + 0.45 * (x - 2.0) }
      let pts = ()
      for i in range(0, 80) {
        let x = 1.0 + i * 0.065
        pts.push((x, f(x)))
      }
      draw.line(..pts, stroke: 1pt + black)
      let c = 3.1
      let x = 5.0
      draw.circle((c, f(c)), radius: 0.065, fill: blue, stroke: none)
      draw.circle((x, f(x)), radius: 0.065, fill: blue, stroke: none)
      draw.line((2.1, f(c) - 0.15 * (c - 2.1)), (5.9, f(c) + 0.15 * (5.9 - c)), stroke: 1pt + green)
      draw.line((c, 0.5), (c, f(c)), stroke: 0.6pt + blue)
      draw.content((c, 0.18), text(size: 8.5pt)[$c$])
      draw.content((5.35, 3.0), text(size: 8.5pt, fill: green)[secant slope $-> f'(c)$])
    })
  ]
]

#example[
  For $f(x) = x^2$, we have
  $
    f'(c)
      = lim_(h -> 0) ((c + h)^2 - c^2) / h
      = lim_(h -> 0) (2c h + h^2) / h
      = 2c.
  $
]

#example[
  The function $f(x) = abs(x)$ is not differentiable at $0$. The right difference quotient is
  $
    lim_(h -> 0^+) abs(h) / h = 1,
  $
  while the left difference quotient is
  $
    lim_(h -> 0^-) abs(h) / h = -1.
  $
]

#example[
  Let
  $
    f(x) = cases(
      (x + a)^2 + 1 & "if " x >= 0,
      2x + 5 & "if " x < 0.
    )
  $
  Continuity at $0$ requires
  $
    a^2 + 1 = 5,
  $
  so $a = 2$ or $a = -2$. For differentiability at $0$, compare one-sided derivatives. The left derivative is $2$, while the right derivative is $2a$. Thus differentiability would require $a = 1$. Therefore neither continuous value of $a$ makes the function differentiable at $0$.
]

#proposition("Differentiability implies continuity")[
  If $f$ is differentiable at $c$, then $f$ is continuous at $c$.
]<prop:differentiability-continuity>

#proof[
  For $x != c$,
  $
    f(x) - f(c) = ((f(x) - f(c)) / (x - c)) (x - c).
  $
  As $x -> c$, the first factor tends to $f'(c)$ and the second factor tends to $0$. Hence $f(x) - f(c) -> 0$, so $f(x) -> f(c)$.
]

#note[
  The converse is false. For example, $f(x) = abs(x)$ is continuous at $0$ but not differentiable there.
]

== Derivative Laws

#theorem("Derivative rules")[
  Suppose $f$ and $g$ are differentiable at $c$, and let $lambda in RR$.
  $
    (f + g)'(c) = f'(c) + g'(c),
  $
  $
    (lambda f)'(c) = lambda f'(c),
  $
  $
    (f g)'(c) = f'(c) g(c) + f(c) g'(c).
  $
  If $g(c) != 0$, then
  $
    (f / g)'(c) = (f'(c) g(c) - f(c) g'(c)) / g(c)^2.
  $
]<thm:derivative-rules>

#proof[
  The sum and scalar rules follow directly from the limit definition. For products, add zero:
  $
    f(x)g(x) - f(c)g(c)
      = f(x)(g(x) - g(c)) + g(c)(f(x) - f(c)).
  $
  Divide by $x - c$ and take $x -> c$. Differentiability gives continuity, so $f(x) -> f(c)$. The quotient rule follows by applying the product rule to $f (1 / g)$.
]

#theorem("Chain rule")[
  Let $g$ be differentiable at $c$, and let $f$ be differentiable at $g(c)$. Then $f compose g$ is differentiable at $c$, and
  $
    (f compose g)'(c) = f'(g(c)) g'(c).
  $
]<thm:chain-rule>

#example[
  The standard derivative rules give:
  $
    ("d" / "d" x) (sin x cos x)
      = cos^2 x - sin^2 x,
  $
  $
    ("d" / "d" x) log(x^2 + 1)
      = (2x) / (x^2 + 1),
  $
  $
    ("d" / "d" x) (e^x (x^5 + x^6 + 7))
      = e^x (x^5 + x^6 + 7) + e^x (5x^4 + 6x^5).
  $
]

#example[
  More chain-rule examples are
  $
    ("d" / "d" x) sqrt(x^3 + 3x)
      = (3x^2 + 3) / (2 sqrt(x^3 + 3x)),
  $
  and
  $
    ("d" / "d" x) op("arccos")(x^2)
      = -2x / sqrt(1 - x^4).
  $
]

== Inverse Functions

#theorem("Inverse derivative formula")[
  Let $f$ be strictly monotone and continuous on an interval $I$, and suppose $f$ is differentiable at $c in I$ with $f'(c) != 0$. If $f^(-1)$ is the inverse function on $f(I)$, then $f^(-1)$ is differentiable at $f(c)$ and
  $
    (f^(-1))'(f(c)) = 1 / (f'(c)).
  $
]<thm:inverse-derivative>

#example[
  Since $tan'(x) = sec^2 x = 1 + tan^2 x$ on $(-pi / 2, pi / 2)$, the inverse derivative formula gives
  $
    ("d" / "d" x) op("arctan")(x) = 1 / (1 + x^2).
  $
  Therefore
  $
    ("d" / "d" x) (2x op("arctan")(x^3))
      = 2 op("arctan")(x^3) + 2x (3x^2 / (1 + x^6)).
  $
]

== Higher Derivatives and L'Hopital's Rule

#definition("Higher derivatives")[
  If $f'$ is differentiable, its derivative is the *second derivative* $f''$. Continuing recursively gives $f'''$, $f^((4))$, and so on.
]

#theorem("L'Hopital's rule")[
  Let $f$ and $g$ be differentiable near $a$, except possibly at $a$, with $g'(x) != 0$ near $a$. Suppose either
  $
    f(x) -> 0 " and " g(x) -> 0
  $
  or
  $
    abs(f(x)) -> infinity " and " abs(g(x)) -> infinity
  $
  as $x -> a$. If
  $
    lim_(x -> a) (f'(x)) / (g'(x)) = L,
  $
  then
  $
    lim_(x -> a) f(x) / g(x) = L.
  $
  One-sided and infinite endpoint versions are used in the same way.
]<thm:lhopital>

#example[
  $
    lim_(x -> 0) (e^(2x) - 1) / (e^x - 1)
      = lim_(x -> 0) (2e^(2x)) / e^x
      = 2.
  $
]

#example[
  $
    lim_(x -> 0^+) x log x
      = lim_(x -> 0^+) (log x) / (1 / x).
  $
  This is an $-infinity / infinity$ form, so by #link(<thm:lhopital>)[L'Hopital's rule],
  $
    lim_(x -> 0^+) (log x) / (1 / x)
      = lim_(x -> 0^+) (1 / x) / (-1 / x^2)
      = lim_(x -> 0^+) -x
      = 0.
  $
]

#example[
  $
    lim_(x -> 1) (5 log x) / (x - 1)
      = lim_(x -> 1) (5 / x) / 1
      = 5.
  $
]

== Local and Global Extrema

#definition("Critical point")[
  Let $f$ be defined on an interval $I$. An interior point $c in I$ is a *critical point* of $f$ if $f'(c) = 0$ or if $f'(c)$ does not exist.
]

#definition("Local extremum")[
  A function $f$ has a *local maximum* at $c$ if there exists an open interval $U$ containing $c$ such that
  $
    f(c) >= f(x)
  $
  for every $x in U$ in the domain of $f$. Local minimum is defined similarly with $<=$. Either is called a *local extremum*.
]

#theorem("Fermat's theorem")[
  If $f$ has a local extremum at an interior point $c$ and $f$ is differentiable at $c$, then
  $
    f'(c) = 0.
  $
]<thm:fermat>

#proof[
  Suppose $f$ has a local minimum at $c$. For $x$ near $c$ with $x > c$,
  $
    (f(x) - f(c)) / (x - c) >= 0.
  $
  For $x$ near $c$ with $x < c$, the denominator is negative while $f(x) - f(c) >= 0$, so
  $
    (f(x) - f(c)) / (x - c) <= 0.
  $
  Since the two one-sided limits of the difference quotient are equal to $f'(c)$, we must have $f'(c) = 0$. The maximum case is analogous.
]

#example[
  For
  $
    f(x) = x^4 - 4x^3 + 4x^2 + 3
      = x^2 (x - 2)^2 + 3
  $
  on $[-1, 1]$,
  $
    f'(x) = 4x^3 - 12x^2 + 8x = 4x(x - 1)(x - 2).
  $
  The critical points in $[-1, 1]$ are $0$ and $1$. Checking endpoints and critical points:
  $
    f(-1) = 12, quad f(0) = 3, quad f(1) = 4.
  $
  Hence the global maximum is $12$ at $x = -1$, and the global minimum is $3$ at $x = 0$.
]

#example[
  For $f(x) = 1 - x^2$ on $(-2, 2]$, the only critical point is $0$. We have $f(0) = 1$, so the global maximum is $1$ at $0$. There is no global minimum: as $x -> -2^+$, $f(x) -> -3$, but $-2$ is not in the interval.
]

#example[
  For $f(x) = e^x (x^3 - 2x)$ on $[0, 5]$,
  $
    f'(x) = e^x (x^3 + 3x^2 - 2x - 2).
  $
  The critical points are the roots of
  $
    x^3 + 3x^2 - 2x - 2 = 0
  $
  in $[0, 5]$. These generally need a numerical or graphing check. Once found, compare their function values with $f(0)$ and $f(5)$ to determine the global extrema.
]

== Rolle's Theorem and the Mean Value Theorem

#theorem("Rolle's theorem")[
  Suppose $f: [a, b] -> RR$ is continuous on $[a, b]$, differentiable on $(a, b)$, and $f(a) = f(b)$. Then there exists $c in (a, b)$ such that
  $
    f'(c) = 0.
  $
]<thm:rolle>

#proof[
  By the #link(<thm:extreme-value>)[extreme value theorem], $f$ attains a maximum and a minimum on $[a, b]$. If both occur only at the endpoints, then $f$ is constant and any $c in (a, b)$ works. Otherwise, $f$ has an interior local extremum, so #link(<thm:fermat>)[Fermat's theorem] gives $f'(c) = 0$.
]

#theorem("Mean value theorem")[
  Suppose $f: [a, b] -> RR$ is continuous on $[a, b]$ and differentiable on $(a, b)$. Then there exists $c in (a, b)$ such that
  $
    f'(c) = (f(b) - f(a)) / (b - a).
  $
]<thm:mean-value>

#diagram(caption: [
  The mean value theorem says some tangent slope equals the secant slope over the interval.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.0, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.0), stroke: 0.75pt + black, mark: (end: ">"))
      let pts = ((1.1, 1.0), (1.8, 1.35), (2.6, 1.8), (3.4, 2.08), (4.3, 2.38), (5.3, 2.9), (6.1, 3.3))
      draw.line(..pts, stroke: 1pt + black)
      draw.line((1.1, 1.0), (6.1, 3.3), stroke: 1pt + green)
      draw.line((2.4, 1.62), (4.6, 2.63), stroke: 1pt + blue)
      draw.content((1.1, 0.18), text(size: 8.5pt)[$a$])
      draw.content((6.1, 0.18), text(size: 8.5pt)[$b$])
      draw.content((3.5, 0.18), text(size: 8.5pt)[$c$])
    })
  ]
]

#proof[
  Define the line through the endpoints,
  $
    ell(x) = f(a) + ((f(b) - f(a)) / (b - a))(x - a),
  $
  and set $g(x) = f(x) - ell(x)$. Then $g(a) = g(b) = 0$. By #link(<thm:rolle>)[Rolle's theorem], there exists $c in (a, b)$ with $g'(c) = 0$. Therefore
  $
    f'(c) - (f(b) - f(a)) / (b - a) = 0.
  $
]

#corollary("Monotonicity from the derivative")[
  Let $f$ be continuous on $[a, b]$ and differentiable on $(a, b)$.
  - If $f'(x) >= 0$ for all $x in (a, b)$, then $f$ is increasing on $[a, b]$.
  - If $f'(x) <= 0$ for all $x in (a, b)$, then $f$ is decreasing on $[a, b]$.
  - If $f'(x) = 0$ for all $x in (a, b)$, then $f$ is constant on $[a, b]$.
]

#proof[
  If $x < y$, apply the #link(<thm:mean-value>)[mean value theorem] to $f$ on $[x, y]$. There exists $c in (x, y)$ such that
  $
    f(y) - f(x) = f'(c)(y - x).
  $
  The sign of $f'(c)$ determines the sign of $f(y) - f(x)$.
]

#corollary("Bounded derivative gives uniform continuity")[
  If $f: I -> RR$ is differentiable on an interval $I$ and there is $M >= 0$ such that
  $
    abs(f'(x)) <= M
  $
  for all $x in I$, then $f$ is uniformly continuous on $I$.
]

#proof[
  For $x, y in I$, the #link(<thm:mean-value>)[mean value theorem] gives some $c$ between $x$ and $y$ such that
  $
    abs(f(x) - f(y)) = abs(f'(c)) abs(x - y) <= M abs(x - y).
  $
  Choose $delta = epsilon / M$ if $M > 0$, and any $delta > 0$ if $M = 0$.
]

#example[
  Since $abs(cos x) <= 1$ for all $x$,
  $
    abs(sin x - sin y) <= abs(x - y)
  $
  for all $x, y in RR$ by the previous corollary.
]

#example[
  The function $log x$ is uniformly continuous on $[1, infinity)$ because
  $
    abs((log x)') = 1 / x <= 1
  $
  on that interval.
]

#theorem("Cauchy mean value theorem")[
  Let $f, g: [a, b] -> RR$ be continuous on $[a, b]$ and differentiable on $(a, b)$. Then there exists $c in (a, b)$ such that
  $
    f'(c)(g(b) - g(a)) = g'(c)(f(b) - f(a)).
  $
]

#proof[
  Apply #link(<thm:rolle>)[Rolle's theorem] to
  $
    F(x) = (f(x) - f(a))(g(b) - g(a)) - (g(x) - g(a))(f(b) - f(a)).
  $
  We have $F(a) = F(b) = 0$, so some $c in (a, b)$ satisfies $F'(c) = 0$, which is exactly the claimed identity.
]

== Holder Continuity

#definition("Holder continuity")[
  Let $alpha > 0$. A function $f$ is *$alpha$-Holder continuous* near $x$ if there are constants $C > 0$ and $r > 0$ such that
  $
    abs(f(x) - f(y)) <= C abs(x - y)^alpha
  $
  whenever $abs(x - y) < r$.
]

#proposition("Holder continuity implies continuity")[
  If $f$ is $alpha$-Holder continuous near $x$, then $f$ is continuous at $x$. If the same constants work for all $x, y$ in an interval, then $f$ is uniformly continuous on that interval.
]

#proof[
  Given $epsilon > 0$, choose
  $
    delta = (epsilon / C)^(1 / alpha).
  $
  Then $abs(x - y) < delta$ implies
  $
    abs(f(x) - f(y)) <= C abs(x - y)^alpha < epsilon.
  $
  If the Holder estimate holds uniformly across an interval, this same $delta$ works for every pair of points in the interval.
]
