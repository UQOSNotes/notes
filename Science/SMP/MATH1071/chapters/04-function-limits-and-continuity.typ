#import "/lib.typ": *

= Function Limits and Continuity

The sequence chapters studied limits indexed by $n in NN$. We now study limits indexed by real variables. The main change is that $x$ can approach a point from many nearby values, and the value of the function at the point itself may be irrelevant to the limit.

== Limit Points

#definition("Limit point")[
  Let $X subset RR$. A point $a in RR$ is a *limit point* of $X$ if every punctured neighbourhood of $a$ contains a point of $X$. Equivalently, for every $epsilon > 0$, there exists $x in X$ such that
  $
    0 < abs(x - a) < epsilon.
  $
]

#diagram(caption: [
  A limit point is approached by points of the set. The isolated point on the right is not a limit point.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let red = rgb("#dc2626")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.7), (7.2, 0.7), stroke: 0.75pt + black, mark: (end: ">"))

      for x in (1.15, 1.55, 1.9, 2.15, 2.35, 2.52, 2.66, 2.78) {
        draw.circle((x, 0.7), radius: 0.055, fill: blue, stroke: none)
      }
      draw.line((3.0, 0.35), (3.0, 1.05), stroke: 0.7pt + green)
      draw.circle((3.0, 0.7), radius: 0.12, fill: none, stroke: 1pt + green)
      draw.content((3.0, 0.18), text(size: 8.5pt)[$a$])

      draw.circle((6.0, 0.7), radius: 0.065, fill: red, stroke: none)
      draw.line((5.45, 1.05), (6.55, 1.05), stroke: 1pt + red)
      draw.content((6.0, 1.35), text(size: 8pt, fill: red)[empty punctured neighbourhood])
    })
  ]
]

#example[
  The set $(0, 1]$ has limit points $[0, 1]$. The set $NN$ has no limit points in $RR$. The set ${1, 1 / 2, 1 / 3, dots}$ has exactly one limit point, namely $0$.
]

== Limits of Functions

#definition("Limit of a function")[
  Let $f: X -> RR$ and let $a$ be a limit point of $X$. We write
  $
    lim_(x -> a) f(x) = L
  $
  if for every $epsilon > 0$, there exists $delta > 0$ such that for every $x in X$,
  $
    0 < abs(x - a) < delta quad ==> quad abs(f(x) - L) < epsilon.
  $
]

The condition $0 < abs(x - a)$ means that the value $f(a)$ does not matter for the limit. A function may have a limit at $a$ even if it is undefined at $a$, or defined there with the wrong value.

#diagram(caption: [
  If $x$ lies inside the punctured $delta$-neighbourhood of $a$, then $f(x)$ must lie inside the $epsilon$-neighbourhood of $L$.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      let grey = luma(145)
      draw.line((0.4, 0.5), (7.1, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.6, 0.25), (0.6, 4.3), stroke: 0.75pt + black, mark: (end: ">"))

      let a = 3.5
      let l = 2.45
      let d = 0.85
      let e = 0.55
      draw.rect((a - d, 0.5), (a + d, 4.05), fill: green.lighten(92%), stroke: none)
      draw.rect((0.6, l - e), (6.9, l + e), fill: blue.lighten(93%), stroke: none)
      draw.line((a, 0.35), (a, 4.05), stroke: 0.65pt + grey)
      draw.line((0.45, l), (6.9, l), stroke: 0.65pt + grey)
      draw.content((a, 0.15), text(size: 8.5pt)[$a$])
      draw.content((0.25, l), text(size: 8.5pt)[$L$])

      let f(x) = { 0.34 * (x - 3.5) * (x - 3.5) + 2.35 + 0.12 * (x - 3.5) }
      let pts = ()
      for i in range(0, 80) {
        let x = 1.0 + i * 0.065
        pts.push((x, f(x)))
      }
      draw.line(..pts, stroke: 1pt + black)
      draw.circle((a, f(a)), radius: 0.065, fill: blue, stroke: none)
      draw.content((a + d, 4.15), text(size: 8pt, fill: green)[$delta$])
      draw.content((6.95, l + e), text(size: 8pt, fill: blue)[$L + epsilon$])
      draw.content((6.95, l - e), text(size: 8pt, fill: blue)[$L - epsilon$])
    })
  ]
]

#example[
  We prove $lim_(x -> a) x = a$. Let $epsilon > 0$ and choose $delta = epsilon$. If $0 < abs(x - a) < delta$, then
  $
    abs(x - a) < delta = epsilon.
  $
]

#example[
  We prove
  $
    lim_(x -> 1) (x^2 + 7x + 12) = 20.
  $
  Let $epsilon > 0$. We need to control
  $
    abs(x^2 + 7x + 12 - 20)
      = abs(x - 1) abs(x + 8).
  $
  If $abs(x - 1) < 1$, then $0 < x < 2$, so $abs(x + 8) < 10$. Choose
  $
    delta = min(1, epsilon / 10).
  $
  Then $0 < abs(x - 1) < delta$ implies
  $
    abs(x^2 + 7x + 12 - 20) < 10 abs(x - 1) < epsilon.
  $
]

#example[
  We prove
  $
    lim_(x -> 2) (x^3 - 8) / (x - 2) = 12.
  $
  For $x != 2$,
  $
    (x^3 - 8) / (x - 2) = x^2 + 2x + 4.
  $
  Hence
  $
    abs((x^3 - 8) / (x - 2) - 12)
      = abs(x^2 + 2x - 8)
      = abs(x - 2) abs(x + 4).
  $
  If $abs(x - 2) < 1$, then $1 < x < 3$, so $abs(x + 4) < 7$. Taking
  $
    delta = min(1, epsilon / 7)
  $
  proves the limit.
]

#example[
  We prove
  $
    lim_(x -> 3) 2 / (x + 3) = 1 / 3.
  $
  For $x$ near $3$,
  $
    abs(2 / (x + 3) - 1 / 3)
      = abs((6 - x - 3) / (3(x + 3)))
      = abs(x - 3) / (3 abs(x + 3)).
  $
  If $abs(x - 3) < 1$, then $x > 2$, so $abs(x + 3) > 5$. Hence
  $
    abs(2 / (x + 3) - 1 / 3) < abs(x - 3) / 15.
  $
  Taking $delta = min(1, 15 epsilon)$ proves the limit.
]

#theorem("Algebra of function limits")[
  Suppose
  $
    lim_(x -> a) f(x) = L
    quad "and" quad
    lim_(x -> a) g(x) = M.
  $
  Then
  $
    lim_(x -> a) (f(x) + g(x)) = L + M,
  $
  $
    lim_(x -> a) f(x) g(x) = L M,
  $
  and, if $M != 0$,
  $
    lim_(x -> a) f(x) / g(x) = L / M.
  $
]<thm:function-limit-laws>

#proof[
  The proof follows the same estimates as the sequence limit laws. For products, add zero:
  $
    f(x)g(x) - L M
      = f(x)(g(x) - M) + M(f(x) - L).
  $
  Since $f(x) -> L$, the values of $f(x)$ are bounded for $x$ close enough to $a$. The remaining terms are controlled by the two limits. The quotient law follows by first showing
  $
    1 / g(x) -> 1 / M.
  $
]

#theorem("Limit of a composite function")[
  Suppose
  $
    lim_(x -> a) g(x) = b
    quad "and" quad
    lim_(y -> b) f(y) = L.
  $
  If $g(x) != b$ for all $x$ sufficiently close to $a$ with $x != a$, then
  $
    lim_(x -> a) f(g(x)) = L.
  $
]<thm:composite-function-limit>

#proof[
  Let $epsilon > 0$. Since $f(y) -> L$ as $y -> b$, choose $eta > 0$ such that
  $
    0 < abs(y - b) < eta quad ==> quad abs(f(y) - L) < epsilon.
  $
  Since $g(x) -> b$ as $x -> a$, choose $delta > 0$ so that
  $
    0 < abs(x - a) < delta quad ==> quad abs(g(x) - b) < eta.
  $
  Shrink $delta$ if needed so that $g(x) != b$ in the same punctured neighbourhood. Then
  $
    0 < abs(g(x) - b) < eta,
  $
  so $abs(f(g(x)) - L) < epsilon$.
]

#corollary("Continuous outer functions preserve limits")[
  If $g(x) -> b$ as $x -> a$ and $f$ is continuous at $b$, then
  $
    f(g(x)) -> f(b).
  $
]

#example[
  Algebraic simplification gives
  $
    lim_(x -> 2) (x^2 - x - 2) / (x^2 - 4)
      = lim_(x -> 2) ((x - 2)(x + 1)) / ((x - 2)(x + 2))
      = 3 / 4.
  $
  The cancellation is valid because limits ignore the point $x = 2$ itself.
]

#example[
  Some quick limits from the same rules are
  $
    lim_(x -> 3) 2 / (x + 3) = 1 / 3
    quad "and" quad
    lim_(x -> 0) (-x^4 / 4) cos(1 / (x^3 + 2)) = 0.
  $
  The first uses continuity of $2 / (x + 3)$ at $3$. For the second, use $abs(cos(t)) <= 1$:
  $
    abs((-x^4 / 4) cos(1 / (x^3 + 2))) <= x^4 / 4 -> 0.
  $
]

#example[
  Another removable singularity is
  $
    lim_(x -> 1) (x^2 + x - 2) / (x^2 - 4x + 3)
      = lim_(x -> 1) ((x + 2)(x - 1)) / ((x - 1)(x - 3))
      = -3 / 2.
  $
]

#example[
  The limit
  $
    lim_(x -> 2) (x^2 - 4) / abs(x - 2)
  $
  does not exist. If $x > 2$, then the expression is $x + 2 -> 4$. If $x < 2$, then it is $-(x + 2) -> -4$. The one-sided limits are different.
]

== One-Sided and Infinite Limits

#definition("One-sided limits")[
  We write $lim_(x -> a^+) f(x) = L$ if for every $epsilon > 0$, there exists $delta > 0$ such that
  $
    0 < x - a < delta quad ==> quad abs(f(x) - L) < epsilon.
  $
  Similarly, $lim_(x -> a^-) f(x) = L$ means the same statement with $0 < a - x < delta$.
]

#proposition("Two-sided limits and one-sided limits")[
  The two-sided limit $lim_(x -> a) f(x) = L$ exists if and only if both one-sided limits exist and
  $
    lim_(x -> a^-) f(x) = lim_(x -> a^+) f(x) = L.
  $
]<prop:one-sided-limits>

#diagram(caption: [
  A jump discontinuity has different left and right limits.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let red = rgb("#dc2626")
      draw.line((0.5, 0.5), (6.9, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.8, 0.2), (0.8, 4.0), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((1.0, 1.35), (3.5, 1.35), stroke: 1pt + blue)
      draw.line((3.5, 2.8), (6.2, 2.8), stroke: 1pt + blue)
      draw.circle((3.5, 1.35), radius: 0.075, fill: white, stroke: 1pt + blue)
      draw.circle((3.5, 2.8), radius: 0.075, fill: blue, stroke: none)
      draw.line((3.5, 0.3), (3.5, 3.5), stroke: 0.6pt + luma(140))
      draw.content((3.5, 0.1), text(size: 8.5pt)[$a$])
      draw.content((6.35, 2.8), text(size: 8.5pt, fill: blue)[$lim_(x -> a^+) f(x)$])
      draw.content((1.0, 1.05), text(size: 8.5pt, fill: blue)[$lim_(x -> a^-) f(x)$])
    })
  ]
]

#definition("Limits involving infinity")[
  We write $lim_(x -> infinity) f(x) = L$ if for every $epsilon > 0$, there exists $M > 0$ such that
  $
    x > M quad ==> quad abs(f(x) - L) < epsilon.
  $
  We write $lim_(x -> a) f(x) = infinity$ if for every $M > 0$, there exists $delta > 0$ such that
  $
    0 < abs(x - a) < delta quad ==> quad f(x) > M.
  $
  The definitions of $x -> -infinity$ and $f(x) -> -infinity$ are analogous.
]

#example[
  Divide by the highest power of $x$:
  $
    lim_(x -> infinity) (x^2 + x) / (x^2 + 4x + 7)
      = lim_(x -> infinity) (1 + 1 / x) / (1 + 4 / x + 7 / x^2)
      = 1.
  $
  More generally, if the numerator and denominator have the same degree, the limit at infinity is the ratio of leading coefficients.
]

== Squeeze and Sequential Criteria

#theorem("Squeeze theorem for functions")[
  Suppose $f(x) <= h(x) <= g(x)$ for all $x$ sufficiently close to $a$, except possibly at $a$. If
  $
    lim_(x -> a) f(x) = lim_(x -> a) g(x) = L,
  $
  then
  $
    lim_(x -> a) h(x) = L.
  $
  The same result holds for one-sided limits and limits at infinity.
]<thm:function-squeeze>

#example[
  Since $-1 <= sin(1 / x) <= 1$ for $x != 0$,
  $
    -x^2 <= x^2 sin(1 / x) <= x^2.
  $
  Both outside functions tend to $0$ as $x -> 0$, so $x^2 sin(1 / x) -> 0$ by the #link(<thm:function-squeeze>)[squeeze theorem for functions].
]

#example[
  At $x = 2$,
  $
    abs(2x - 1) = 2x - 1
    quad "and" quad
    abs(2x + 1) = 2x + 1.
  $
  Hence
  $
    lim_(x -> 2) (abs(2x - 1) - abs(2x + 1)) / x
      = lim_(x -> 2) (-2) / x
      = -1.
  $
]

#theorem("Sequential criterion for function limits")[
  Let $a$ be a limit point of $X$. Then $lim_(x -> a) f(x) = L$ if and only if for every sequence $(x_n)$ in $X$ with $x_n != a$ and $x_n -> a$, we have
  $
    f(x_n) -> L.
  $
]<thm:sequential-function-limit>

#proof[
  If $f(x) -> L$ and $x_n -> a$, then the epsilon-delta condition for $f$ eventually applies to $x_n$, so $f(x_n) -> L$.

  Conversely, suppose the sequential condition holds but $f(x)$ does not tend to $L$. Then there exists $epsilon_0 > 0$ such that for every $delta > 0$, some $x in X$ satisfies
  $
    0 < abs(x - a) < delta
    quad "and" quad
    abs(f(x) - L) >= epsilon_0.
  $
  Taking $delta = 1 / n$ gives a sequence $(x_n)$ with $x_n -> a$ but $f(x_n)$ not tending to $L$, a contradiction.
]

#note[
  The standard limits
  $
    lim_(x -> 0) sin(x) / x = 1,
    quad
    lim_(x -> 0) (1 - cos(x)) / x = 0,
    quad
    lim_(x -> 0) (1 - cos(x)) / x^2 = 1 / 2
  $
  may be used in this course.
]

#example[
  Using $sin(x) / x -> 1$ and $cos(x) -> 1$,
  $
    lim_(x -> 0) (sin(x) cos(x)) / x
      = lim_(x -> 0) (sin(x) / x) cos(x)
      = 1.
  $
]

== Continuity

#definition("Continuity at a point")[
  Let $f: X -> RR$ and let $a in X$. The function $f$ is *continuous at* $a$ if for every $epsilon > 0$, there exists $delta > 0$ such that for every $x in X$,
  $
    abs(x - a) < delta quad ==> quad abs(f(x) - f(a)) < epsilon.
  $
  If $a$ is also a limit point of $X$, this is equivalent to
  $
    lim_(x -> a) f(x) = f(a).
  $
]

#definition("Continuity on a set")[
  A function $f: X -> RR$ is *continuous on* $X$ if it is continuous at every point of $X$.
]

#theorem("Algebra of continuous functions")[
  If $f$ and $g$ are continuous at $a$, then $f + g$ and $f g$ are continuous at $a$. If $g(a) != 0$, then the quotient function is continuous at $a$.
]<thm:continuous-algebra>

#proof[
  This is the #link(<thm:function-limit-laws>)[algebra of function limits] with $L = f(a)$ and $M = g(a)$.
]

#corollary("Polynomials and rational functions")[
  Every polynomial is continuous on $RR$. A rational function $p(x) / q(x)$ is continuous at every point where $q(x) != 0$.
]

#example[
  To make
  $
    f(x) = cases(
      x^2 + 3x + 5 & "if " x > 1,
      a & "if " x = 1,
      12x - 3 & "if " x < 1
    )
  $
  continuous at $1$, the three values must agree. The left and right limits are both $9$, so we need $a = 9$.
]

#example[
  The function
  $
    f(x) = cases(
      1 & "if " x > 0,
      0 & "if " x <= 0
    )
  $
  is not continuous at $0$. Since $f(0) = 0$, take $epsilon = 1 / 2$. For every $delta > 0$, choose $x = delta / 2 > 0$. Then $abs(x - 0) < delta$, but
  $
    abs(f(x) - f(0)) = 1 >= 1 / 2.
  $
]

#example[
  For
  $
    f(x) = cases(
      x^2 - 3 & "if " x > 0,
      0 & "if " x = 0,
      sin(x) & "if " x < 0,
    )
  $
  the limit at $0$ does not exist. The right-hand limit is $-3$, while the left-hand limit is $0$.
]

#example[
  Let
  $
    f(x) = cases(
      2x + abs(2x - 3) & "if " x != 2,
      a & "if " x = 2.
    )
  $
  To make $f$ continuous at $2$, choose
  $
    a = lim_(x -> 2) (2x + abs(2x - 3)) = 4 + 1 = 5.
  $
]

#proposition("Continuity of absolute value")[
  If $f$ is continuous at $a$, then $abs(f)$ is continuous at $a$.
]<prop:absolute-continuity>

#proof[
  By the reverse triangle inequality,
  $
    abs(abs(f(x)) - abs(f(a))) <= abs(f(x) - f(a)).
  $
  The right-hand side tends to $0$ as $x -> a$, so $abs(f(x)) -> abs(f(a))$.
]

#example[
  The converse is false. The function
  $
    f(x) = cases(1 & "if " x in QQ, -1 & "if " x " is irrational")
  $
  is continuous nowhere because every interval contains both rational and irrational points, but $abs(f(x)) = 1$ is continuous everywhere.
]

#proposition("Squeeze continuity at zero")[
  Suppose $abs(f(x)) <= abs(g(x))$ for all $x$ near $0$, and $g$ is continuous at $0$ with $g(0) = 0$. If $f(0) = 0$, then $f$ is continuous at $0$.
]<prop:squeeze-continuity>

#proof[
  Since $g$ is continuous at $0$, for every $epsilon > 0$ there exists $delta > 0$ such that $abs(x) < delta$ implies $abs(g(x)) < epsilon$. Hence
  $
    abs(f(x) - f(0)) = abs(f(x)) <= abs(g(x)) < epsilon.
  $
]

The special case $abs(f(x)) <= abs(x)$ follows by taking $g(x) = x$.

== Uniform Continuity

#definition("Uniform continuity")[
  Let $I subset RR$. A function $f: I -> RR$ is *uniformly continuous on* $I$ if for every $epsilon > 0$, there exists $delta > 0$ such that for all $x, y in I$,
  $
    abs(x - y) < delta quad ==> quad abs(f(x) - f(y)) < epsilon.
  $
]

Continuity at a point allows $delta$ to depend on the point. Uniform continuity requires one $delta$ to work across the whole set.

#diagram(caption: [
  Uniform continuity asks for one horizontal tolerance that works everywhere on the interval.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.0, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.0), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((1.0, 1.0), (6.2, 3.5), stroke: 1pt + black)
      for p in ((2.2, 1.58), (2.85, 1.89), (4.7, 2.78), (5.35, 3.09)) {
        draw.circle(p, radius: 0.055, fill: blue, stroke: none)
      }
      draw.line((2.2, 1.58), (2.85, 1.89), stroke: 1.1pt + green)
      draw.line((4.7, 2.78), (5.35, 3.09), stroke: 1.1pt + green)
      draw.content((2.5, 1.2), text(size: 8pt, fill: green)[$abs(x - y) < delta$])
      draw.content((4.85, 3.35), text(size: 8pt, fill: green)[same $delta$])
    })
  ]
]

#proposition("Uniform continuity implies continuity")[
  If $f$ is uniformly continuous on $I$, then $f$ is continuous on $I$.
]<prop:uniform-implies-continuous>

#proof[
  Fix $a in I$. In the definition of uniform continuity, take $y = a$. The same $delta$ proves continuity at $a$.
]

#example[
  The function $f(x) = x$ is uniformly continuous on $RR$: choose $delta = epsilon$.
]

#example[
  The function $f(x) = 3x + 7$ is uniformly continuous on $RR$. Given $epsilon > 0$, choose $delta = epsilon / 3$. If $abs(x - y) < delta$, then
  $
    abs(f(x) - f(y)) = 3 abs(x - y) < epsilon.
  $
]

#example[
  The function $f(x) = 1 / x$ is uniformly continuous on $[1 / 3, infinity)$. If $x, y >= 1 / 3$, then $abs(x y) >= 1 / 9$, so
  $
    abs(1 / x - 1 / y)
      = abs(x - y) / abs(x y)
      <= 9 abs(x - y).
  $
  Taking $delta = epsilon / 9$ proves uniform continuity.
]

#example[
  The function $f(x) = x^2$ is uniformly continuous on $[0, 3]$. If $x, y in [0, 3]$, then
  $
    abs(x^2 - y^2) = abs(x - y) abs(x + y) <= 6 abs(x - y).
  $
  Taking $delta = epsilon / 6$ proves uniform continuity.
]

#example[
  The function $f(x) = x^2$ is not uniformly continuous on $(0, infinity)$. Suppose it were. Take $epsilon = 1$ and let $delta > 0$ be supplied by uniform continuity. Choose $x > 1 / delta$ and set $y = x + delta / 2$. Then $abs(x - y) < delta$, but
  $
    abs(x^2 - y^2)
      = abs(x - y) abs(x + y)
      = delta / 2 (2x + delta / 2)
      > x delta
      > 1,
  $
  a contradiction.
]

#theorem("Continuous functions on closed intervals are uniformly continuous")[
  If $f: [a, b] -> RR$ is continuous, then $f$ is uniformly continuous on $[a, b]$.
]<thm:closed-interval-uniform-continuity>

#proof[
  Suppose not. Then there exists $epsilon_0 > 0$ such that for every $delta > 0$, there are $x, y in [a, b]$ with
  $
    abs(x - y) < delta
    quad "but" quad
    abs(f(x) - f(y)) >= epsilon_0.
  $
  Taking $delta = 1 / n$ gives sequences $(x_n)$ and $(y_n)$ in $[a, b]$ such that
  $
    abs(x_n - y_n) < 1 / n
    quad "and" quad
    abs(f(x_n) - f(y_n)) >= epsilon_0.
  $
  By the #link(<thm:bolzano-weierstrass>)[Bolzano-Weierstrass theorem], $(x_n)$ has a convergent subsequence $x_(n_k) -> c in [a, b]$. Since
  $
    abs(y_(n_k) - c) <= abs(y_(n_k) - x_(n_k)) + abs(x_(n_k) - c),
  $
  we also have $y_(n_k) -> c$.

  Continuity gives $f(x_(n_k)) -> f(c)$ and $f(y_(n_k)) -> f(c)$, so
  $
    abs(f(x_(n_k)) - f(y_(n_k))) -> 0,
  $
  contradicting $abs(f(x_(n_k)) - f(y_(n_k))) >= epsilon_0$ for every $k$.
]

#proposition("Continuous functions preserve Cauchy sequences on closed intervals")[
  Let $f: [a, b] -> RR$ be continuous. If $(a_n)$ is a Cauchy sequence in $[a, b]$, then $(f(a_n))$ is Cauchy.
]<prop:continuous-preserve-cauchy>

#proof[
  By the #link(<thm:cauchy-criterion>)[Cauchy criterion], $(a_n)$ converges to some $L in RR$. Since every $a_n in [a, b]$ and $[a, b]$ is closed, $L in [a, b]$. Continuity gives $f(a_n) -> f(L)$, so $(f(a_n))$ is Cauchy by the #link(<thm:convergent-cauchy>)[convergent sequences are Cauchy theorem].
]

== Intermediate and Extreme Values

#theorem("Intermediate value theorem")[
  Let $f: [a, b] -> RR$ be continuous. If $lambda$ lies between $f(a)$ and $f(b)$, then there exists $c in [a, b]$ such that
  $
    f(c) = lambda.
  $
  If $lambda$ lies strictly between $f(a)$ and $f(b)$, then $c$ may be chosen in $(a, b)$.
]<thm:intermediate-value>

#diagram(caption: [
  A continuous function must hit every height between its endpoint values.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      draw.line((0.5, 0.5), (7.0, 0.5), stroke: 0.75pt + black, mark: (end: ">"))
      draw.line((0.7, 0.25), (0.7, 4.0), stroke: 0.75pt + black, mark: (end: ">"))
      let pts = ((1.0, 1.0), (1.8, 1.55), (2.6, 1.25), (3.4, 2.15), (4.3, 2.9), (5.3, 2.5), (6.2, 3.3))
      draw.line(..pts, stroke: 1pt + black)
      draw.line((1.0, 2.35), (6.2, 2.35), stroke: 0.9pt + green)
      draw.circle((3.65, 2.35), radius: 0.07, fill: blue, stroke: none)
      draw.line((3.65, 0.5), (3.65, 2.35), stroke: 0.65pt + blue)
      draw.content((0.35, 2.35), text(size: 8.5pt)[$lambda$])
      draw.content((3.65, 0.2), text(size: 8.5pt)[$c$])
    })
  ]
]

#example[
  Every real cubic
  $
    p(x) = x^3 + a x^2 + b x + c
  $
  has a real root. Indeed, the leading term dominates: $p(x) -> infinity$ as $x -> infinity$ and $p(x) -> -infinity$ as $x -> -infinity$. Choose $R$ large enough that $p(-R) < 0 < p(R)$. Since $p$ is continuous on $[-R, R]$, the #link(<thm:intermediate-value>)[intermediate value theorem] gives some $r in (-R, R)$ with $p(r) = 0$.
]

#example[
  There is a real number $x$ such that
  $
    x^5 + 34x + 13 = 100.
  $
  Let $f(x) = x^5 + 34x - 87$. Then $f$ is continuous,
  $
    f(1) = -52 < 0
    quad "and" quad
    f(2) = 13 > 0.
  $
  Hence the #link(<thm:intermediate-value>)[intermediate value theorem] gives a root in $(1, 2)$.
]

#example[
  There is a real number $x$ such that $sin x = x - 1$. Let
  $
    f(x) = sin x - x + 1.
  $
  Then $f(0) = 1 > 0$ and $f(2) = sin 2 - 1 < 0$. Since $f$ is continuous, the #link(<thm:intermediate-value>)[intermediate value theorem] gives a root in $(0, 2)$.
]

#definition("Extrema")[
  Let $f: X -> RR$. The function $f$ attains a *maximum* at $c in X$ if
  $
    f(c) >= f(x)
  $
  for all $x in X$. It attains a *minimum* at $c in X$ if
  $
    f(c) <= f(x)
  $
  for all $x in X$. Maxima and minima are called *extrema*.
]

#theorem("Extreme value theorem")[
  If $f: [a, b] -> RR$ is continuous, then $f$ attains a maximum and a minimum on $[a, b]$.
]<thm:extreme-value>

#note[
  Closed and bounded matters. The function $f(x) = x$ on $(0, 1)$ has no maximum or minimum. The function $f(x) = x^2$ on $[1, infinity)$ has a minimum but no maximum.
]
