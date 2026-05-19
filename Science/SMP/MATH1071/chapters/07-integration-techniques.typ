#import "/lib.typ": *

= Integration Techniques and Applications

The fundamental theorem turns many definite integrals into antiderivative calculations. The techniques below are the ones that appear most often in tutorials and exams.

== Variable Limits

#proposition("Leibniz rule for variable endpoints")[
  Let $f$ be continuous and let $u, v$ be differentiable. If
  $
    F(x) = integral_(u(x))^(v(x)) f(t) dif t,
  $
  then
  $
    F'(x) = f(v(x)) v'(x) - f(u(x)) u'(x).
  $
]<prop:variable-endpoints>

#proof[
  Fix an antiderivative $A$ of $f$. By the fundamental theorem of calculus,
  $
    F(x) = A(v(x)) - A(u(x)).
  $
  Differentiate using the chain rule.
]

#example[
  Let
  $
    F(x) = integral_(x^2)^(log x) tan(t) dif t.
  $
  Then
  $
    F'(x) = tan(log x) / x - tan(x^2) dot 2x.
  $
]

#example[
  The Eulerian logarithmic integral is
  $
    op("Li")(x) = integral_2^x 1 / (log t) dif t.
  $
  For $x > 2$,
  $
    op("Li")'(x) = 1 / (log x),
  $
  and
  $
    op("Li")''(x) = -1 / (x (log x)^2).
  $
]

#example[
  Let
  $
    g(x) = integral_0^x (sin t) / (t + 1) dif t.
  $
  We show $g(x) > 0$ for every $x > 0$. On each full period, the positive half dominates the following negative half because $1 / (t + 1)$ is decreasing:
  $
    integral_(2k pi)^((2k + 1) pi) (sin t) / (t + 1) dif t
      + integral_((2k + 1) pi)^((2k + 2) pi) (sin t) / (t + 1) dif t > 0.
  $
  Inside a negative half-period, the partial negative contribution is still smaller in magnitude than the preceding positive half-period. Hence every initial integral from $0$ to $x$ is positive.
]

== The Logarithm from an Integral

#footnote[In this course, $log$ means the natural logarithm. We avoid writing $ln$; Mr Gauss and Ole Warnaar will haunt you if you use $ln$ instead of $log$.]

Define, for $x > 0$,$
  L(x) = integral_1^x 1 / t dif t.
$
By the fundamental theorem, $L'(x) = 1 / x$ and $L(1) = 0$.

#proposition("Integral logarithm laws")[
  For $x, y > 0$ and $alpha in RR$,
  $
    L(x dot y) = L(x) + L(y),
    quad
    L(x^alpha) = alpha L(x).
  $
  Consequently, if $e$ is defined by $L(e) = 1$, then $L(e^x) = x$.
]

#proof[
  Fix $y > 0$ and define
  $
    H(x) = L(x y) - L(x).
  $
  Then
  $
    H'(x) = y / (x y) - 1 / x = 0.
  $
  Hence $H$ is constant. Since $H(1) = L(y)$, we get $L(x dot y) = L(x) + L(y)$.

  For powers, first define $K(x) = L(x^alpha) - alpha L(x)$ for $x > 0$. Differentiating gives $K'(x) = 0$, and $K(1) = 0$, so $K = 0$.
]

== Integration by Parts

#theorem("Integration by parts")[
  If $u$ and $v$ are differentiable, then
  $
    integral u(x) v'(x) dif x
      = u(x) v(x) - integral u'(x) v(x) dif x.
  $
  For a definite integral,
  $
    integral_a^b u(x) v'(x) dif x
      = [u(x) v(x)]_a^b - integral_a^b u'(x) v(x) dif x.
  $
]<thm:integration-by-parts>

#proof[
  Integrate the product rule
  $
    (u v)' = u' v + u v'.
  $
]

#note[
  A useful choice heuristic for $u$ is logarithmic, inverse trigonometric, algebraic, trigonometric, exponential, in that order. It is only a heuristic; the algebra decides.
]

#example[
  For $integral x log x dif x$, take $u = log x$ and $v' = x$. Then $u' = 1 / x$ and $v = x^2 / 2$, so
  $
    integral x log x dif x
      = x^2 log x / 2 - integral x / 2 dif x
      = x^2 log x / 2 - x^2 / 4 + C.
  $
]

#example[
  Let
  $
    I = integral e^(2x) sin x dif x.
  $
  Integrating by parts twice gives
  $
    I = (e^(2x) sin x) / 2 - 1 / 2 integral e^(2x) cos x dif x,
  $
  and
  $
    integral e^(2x) cos x dif x
      = (e^(2x) cos x) / 2 + 1 / 2 integral e^(2x) sin x dif x.
  $
  Hence
  $
    I = (e^(2x) sin x) / 2 - (e^(2x) cos x) / 4 - I / 4,
  $
  so
  $
    integral e^(2x) sin x dif x
      = e^(2x)(2 sin x - cos x) / 5 + C.
  $
]

#proposition("Repeated integral identity")[
  If $f$ is continuous, then
  $
    integral_0^x (integral_0^t f(u) dif u) dif t
      = integral_0^x f(u)(x - u) dif u.
  $
]

#proof[
  Let $G(t) = integral_0^t f(u) dif u$. Integrate by parts with $u = G(t)$ and $v' = 1$:
  $
    integral_0^x G(t) dif t
      = [t G(t)]_0^x - integral_0^x t f(t) dif t
      = x integral_0^x f(t) dif t - integral_0^x t f(t) dif t.
  $
  Combine the two integrals.
]

== Substitution

#theorem("Integration by substitution")[
  Let $g$ be continuously differentiable and let $f$ be continuous. Then
  $
    integral_a^b f(g(x)) g'(x) dif x
      = integral_(g(a))^(g(b)) f(u) dif u.
  $
]<thm:substitution>

#proof[
  Let $F$ be an antiderivative of $f$. Then $(F compose g)' = (f compose g) g'$. Apply the fundamental theorem to both sides.
]

#example[
  For $integral log(cos x) tan x dif x$, take $u = log(cos x)$. Then
  $
    dif u = -tan x dif x.
  $
  Hence
  $
    integral log(cos x) tan x dif x
      = - integral u dif u
      = -1 / 2 (log(cos x))^2 + C.
  $
]

#example[
  $
    integral sin(x / 2) cos(x / 2) dif x
      = integral 2 sin(u) cos(u) dif u
      = integral sin(2u) dif u
      = -1 / 2 cos x + C,
  $
  where $u = x / 2$.
]

#example[
  For
  $
    integral cos(x^(1 / 3)) / x^(1 / 3) dif x,
  $
  take $u = x^(1 / 3)$, so $x = u^3$ and $dif x = 3u^2 dif u$. Then
  $
    integral cos(x^(1 / 3)) / x^(1 / 3) dif x
      = 3 integral u cos u dif u
      = 3u sin u + 3 cos u + C.
  $
  Therefore the antiderivative is
  $
    3x^(1 / 3) sin(x^(1 / 3)) + 3 cos(x^(1 / 3)) + C.
  $
]

#example[
  $
    integral_1^e sin(log x) / x dif x
      = integral_0^1 sin u dif u
      = 1 - cos 1.
  $
]

== Partial Fractions

#definition("Rational function")[
  A *rational function* is a quotient $p(x) / q(x)$ of polynomials. When the degree of $p$ is at least the degree of $q$, first use polynomial division. Then factor the denominator and decompose into simpler fractions.
]

#example[
  Compute
  $
    integral (2x + 1) / (x^2 + 7x + 12) dif x.
  $
  Since
  $
    x^2 + 7x + 12 = (x + 3)(x + 4),
  $
  write
  $
    (2x + 1) / ((x + 3)(x + 4)) = A / (x + 3) + B / (x + 4).
  $
  Then
  $
    2x + 1 = A(x + 4) + B(x + 3),
  $
  giving $A = -5$ and $B = 7$. Therefore
  $
    integral (2x + 1) / (x^2 + 7x + 12) dif x
      = -5 log abs(x + 3) + 7 log abs(x + 4) + C.
  $
]

#example[
  For
  $
    integral e^x / (e^(2x) + e^x + 1) dif x,
  $
  take $u = e^x$, so $dif u = e^x dif x$. Then
  $
    integral 1 / (u^2 + u + 1) dif u.
  $
  Complete the square:
  $
    u^2 + u + 1 = (u + 1 / 2)^2 + 3 / 4.
  $
  Hence
  $
    integral e^x / (e^(2x) + e^x + 1) dif x
      = 2 / sqrt(3) op("arctan")((2e^x + 1) / sqrt(3)) + C.
  $
]

== Trigonometric Substitution

The common substitutions are:
- use $x = a sin theta$ for $sqrt(a^2 - x^2)$;
- use $x = a tan theta$ for $sqrt(a^2 + x^2)$;
- use $x = a sec theta$ for $sqrt(x^2 - a^2)$.

#example[
  $
    integral 1 / sqrt(9 - x^2) dif x = op("arcsin")(x / 3) + C.
  $
  This follows from $x = 3 sin theta$.
]

#example[
  To compute
  $
    integral x / sqrt(4 - 4x^2) dif x,
  $
  it is faster to use $u = 4 - 4x^2$. Since $dif u = -8x dif x$,
  $
    integral x / sqrt(4 - 4x^2) dif x
      = -1 / 8 integral u^(-1 / 2) dif u
      = -1 / 4 sqrt(4 - 4x^2) + C.
  $
]

== Definite Integrals and Areas

#example[
  To compute
  $
    integral_0^3 abs(3x - 4) dif x,
  $
  split at $x = 4 / 3$:
  $
    integral_0^(4 / 3) (4 - 3x) dif x + integral_(4 / 3)^3 (3x - 4) dif x
      = 8 / 3 + 25 / 6
      = 41 / 6.
  $
]

#example[
  For
  $
    integral_1^5 (2x^5 - x + 3) / x^2 dif x,
  $
  simplify first:
  $
    (2x^5 - x + 3) / x^2 = 2x^3 - 1 / x + 3 / x^2.
  $
  Therefore
  $
    integral_1^5 (2x^3 - 1 / x + 3x^(-2)) dif x
      = [x^4 / 2 - log x - 3 / x]_1^5.
  $
]

#definition("Area between curves")[
  If $f(x) >= g(x)$ on $[a, b]$, then the area between the curves $y = f(x)$ and $y = g(x)$ is
  $
    integral_a^b (f(x) - g(x)) dif x.
  $
  If the curves cross, split the interval at their intersection points.
]

== Improper Integrals

#definition("Improper integrals")[
  If $f$ is integrable on $[a + epsilon, b]$ for every $epsilon > 0$, define
  $
    integral_a^b f(x) dif x = lim_(epsilon -> 0^+) integral_(a + epsilon)^b f(x) dif x,
  $
  provided the limit exists. This handles an unbounded integrand at $a$.

  If $f$ is integrable on $[a, R]$ for every $R > a$, define
  $
    integral_a^infinity f(x) dif x = lim_(R -> infinity) integral_a^R f(x) dif x,
  $
  provided the limit exists. The definitions at $b^-$ and $-infinity$ are analogous.
]

#example[
  For $p != 1$,
  $
    integral_1^R 1 / x^p dif x
      = (R^(1 - p) - 1) / (1 - p).
  $
  Hence
  $
    integral_1^infinity 1 / x^p dif x
  $
  converges exactly when $p > 1$. For $p = 1$, the integral is $log R$, which diverges.
]

#example[
  $
    integral_0^1 1 / sqrt(x) dif x
      = lim_(epsilon -> 0^+) integral_epsilon^1 x^(-1 / 2) dif x
      = lim_(epsilon -> 0^+) (2 - 2 sqrt(epsilon))
      = 2.
  $
]

#example[
  The improper integral
  $
    integral_0^infinity cos x dif x
  $
  diverges, because
  $
    integral_0^R cos x dif x = sin R
  $
  has no limit as $R -> infinity$.
]
