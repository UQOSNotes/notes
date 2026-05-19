#import "/lib.typ": *

= Sets, Fields, and Order

The course starts by putting familiar arithmetic on firmer footing. Early MATH1071 is proof-heavy, so it helps to know exactly which properties of the real numbers are being used. Most early arguments use three layers of structure:

- set notation, so that we can say what objects we are discussing;
- field arithmetic, so that addition, multiplication, subtraction, and division behave correctly;
- order and absolute value, so that "close to" can be expressed by inequalities.

The real numbers $RR$ have all of this structure. Later chapters use additional properties of $RR$, especially completeness.

== Sets and Functions

#definition("Set")[
  A *set* is a collection of objects, called its *elements*. We write $x in A$ to mean that $x$ is an element of $A$.
]

If every element of $A$ is also an element of $B$, we write $A subset.eq B$ and say that $A$ is a *subset* of $B$. If $A subset.eq B$ and $A != B$, then $A$ is a *proper subset* of $B$.

#example[
  The set $A = {1, 2, 3}$ satisfies $1 in A$ and $4 in.not A$. Also ${1, 3} subset.eq A$.

  Sets do not record repeated elements, so ${1, 1, 2} = {1, 2}$.
]

Common set operations are:
- $A union B = {x: x in A " or " x in B}$, the *union*;
- $A inter B = {x: x in A " and " x in B}$, the *intersection*;
- $A \\ B = {x: x in A " and " x in.not B}$, the *set difference*;
- $A times B = {(a, b): a in A, b in B}$, the *Cartesian product*.

#definition("Function")[
  A *function* $f: A -> B$ assigns to each $a in A$ exactly one element $f(a) in B$.

  The set $A$ is the *domain* and $B$ is the *codomain*. The *range* or *image* of $f$ is
  $
    f(A) = {f(a): a in A}.
  $
]

#remark[
  A formula by itself does not completely specify a function; the domain and codomain matter. For example, $f: RR -> RR$ given by $f(x) = x^2$ and $g: [0, infinity) -> RR$ given by $g(x) = x^2$ have the same formula but different domains.
]

The standard number systems used in the course are:

#definition("Standard number systems")[
  - $NN = {1, 2, 3, dots}$, the natural numbers;
  - $ZZ = {dots, -2, -1, 0, 1, 2, dots}$, the integers;
  - $QQ = {p / q: p in ZZ, q in NN}$, the rational numbers;
  - $RR$, the real numbers;
  - $CC = {a + b i: a, b in RR " and " i^2 = -1}$, the complex numbers.
]

We also use the following functions repeatedly.

#definition("Absolute value, floor, and square root")[
  For $x in RR$,
  $
    abs(x) = cases(x & "if " x >= 0, -x & "if " x < 0)
  $

  The *floor* $floor(x)$ is the greatest integer less than or equal to $x$.

  For $x >= 0$, $sqrt(x)$ is the unique non-negative real number whose square is $x$.
]

== Fields

#definition("Field")[
  A *field* is a set $F$ with two operations, addition and multiplication, such that for all $a, b, c in F$:
  - $a + b in F$ and $a b in F$;
  - $a + b = b + a$ and $a b = b a$;
  - $(a + b) + c = a + (b + c)$ and $(a b)c = a(b c)$;
  - there are elements $0, 1 in F$, with $0 != 1$, such that $a + 0 = a$ and $a dot 1 = a$;
  - for each $a in F$, there is an element $-a in F$ such that $a + (-a) = 0$;
  - for each $a in F$ with $a != 0$, there is an element $a^(-1) in F$ such that $a a^(-1) = 1$;
  - $a(b + c) = a b + a c$.
]

The familiar fields are $QQ$, $RR$, and $CC$ with their usual operations. The integers $ZZ$ are not a field: $2 in ZZ$, but there is no integer $b$ such that $2 b = 1$.

#important[
  When proving a statement about an arbitrary field, do not use order, decimal expansions, or geometric intuition unless those structures have been assumed. A field proof should only use the field axioms and consequences already proved from them.
]

== Basic Consequences of the Field Axioms

The following facts are normally used without comment in high-school algebra. In this course, it is worth seeing that they really do follow from the field axioms.

#proposition("Identities and inverses are unique")[
  Let $F$ be a field.
  1. The additive identity is unique.
  2. The multiplicative identity is unique.
  3. For each $a in F$, the additive inverse $-a$ is unique.
  4. If $a != 0$, then the multiplicative inverse $a^(-1)$ is unique.
]

#proof[
  Suppose $0$ and $0'$ are both additive identities. Then
  $
    0 = 0 + 0' = 0',
  $
  because $0'$ is an additive identity in the first equality and $0$ is an additive identity in the second.

  The proof for the multiplicative identity is analogous: if $1$ and $1'$ are both multiplicative identities, then $1 = 1 dot 1' = 1'$.

  If $u$ and $v$ are both additive inverses of $a$, then
  $
    u = u + 0 = u + (a + v) = (u + a) + v = 0 + v = v.
  $

  If $a != 0$ and $u, v$ are both multiplicative inverses of $a$, then
  $
    u = u dot 1 = u(a v) = (u a)v = 1 dot v = v.
  $
]

#proposition("Zero and negatives")[
  Let $F$ be a field and let $a, b in F$. Then:
  1. $a dot 0 = 0$;
  2. $(-1)(-1) = 1$;
  3. $a(-b) = (-a)b = -(a b)$;
  4. $(-a)(-b) = a b$.
]

#proof[
  Since $0 + 0 = 0$, distributivity gives
  $
    a dot 0 = a(0 + 0) = a dot 0 + a dot 0.
  $
  Adding $-(a dot 0)$ to both sides gives $0 = a dot 0$.

  Now $(-1) + 1 = 0$. Multiplying by $-1$ gives
  $
    (-1)(-1) + (-1) = 0.
  $
  Hence $(-1)(-1)$ is the additive inverse of $-1$, which is $1$.

  To prove $a(-b) = -(a b)$, observe that
  $
    a b + a(-b) = a(b + (-b)) = a dot 0 = 0.
  $
  Thus $a(-b)$ is the additive inverse of $a b$. The proof of $(-a)b = -(a b)$ is the same. Finally,
  $
    (-a)(-b) = -(a(-b)) = -(-(a b)) = a b.
  $
]

#proposition("No zero divisors")[
  If $F$ is a field and $a b = 0$, then $a = 0$ or $b = 0$.
]

#proof[
  If $a = 0$, there is nothing to prove. Suppose $a != 0$. Then $a^(-1)$ exists, and
  $
    b = 1 dot b = (a^(-1) a)b = a^(-1)(a b) = a^(-1) dot 0 = 0.
  $
]

#corollary[
  If $a in F$ and $a^2 = 1$, then $a in {-1, 1}$.
]

#proof[
  Since $a^2 = 1$,
  $
    0 = a^2 - 1 = (a - 1)(a + 1).
  $
  By the no-zero-divisors property, $a - 1 = 0$ or $a + 1 = 0$. Therefore $a = 1$ or $a = -1$.
]

== Examples of Fields and Non-Fields

#example[$QQ(sqrt(2))$][
  Define
  $
    QQ(sqrt(2)) = {a + b sqrt(2): a, b in QQ}.
  $
  This is a field under the usual addition and multiplication inherited from $RR$.

  Addition and multiplication stay inside the set:
  $
    (a + b sqrt(2)) + (c + d sqrt(2))
      = (a + c) + (b + d)sqrt(2),
  $
  and
  $
    (a + b sqrt(2))(c + d sqrt(2))
      = (a c + 2 b d) + (a d + b c)sqrt(2).
  $

  The identities are $0 = 0 + 0 sqrt(2)$ and $1 = 1 + 0 sqrt(2)$. The additive inverse of $a + b sqrt(2)$ is $-a - b sqrt(2)$.

  For multiplicative inverses, suppose $a + b sqrt(2) != 0$. Then
  $
    1 / (a + b sqrt(2))
      = (a - b sqrt(2)) / (a^2 - 2 b^2)
      = a / (a^2 - 2 b^2) - b / (a^2 - 2 b^2) sqrt(2).
  $
  The coefficients are rational. Also $a^2 - 2 b^2 != 0$: if it were zero and $b != 0$, then $(a / b)^2 = 2$, contradicting the irrationality of $sqrt(2)$; if $b = 0$, then $a = 0$, contrary to $a + b sqrt(2) != 0$.
]

#example[
  To write $(3 + 4 sqrt(2))^(-1)$ in the form $a + b sqrt(2)$,
  $
    1 / (3 + 4 sqrt(2))
      = (3 - 4 sqrt(2)) / (9 - 32)
      = -3 / 23 + 4 / 23 sqrt(2).
  $
]

#example("Integers modulo 3")[
  The set $op("Z")_3 = {0, 1, 2}$ is a field when addition and multiplication are performed modulo $3$.

  #table(
    columns: 4,
    align: center,
    [$+$], [0], [1], [2],
    [0], [0], [1], [2],
    [1], [1], [2], [0],
    [2], [2], [0], [1],
  )

  #table(
    columns: 4,
    align: center,
    [$dot$], [0], [1], [2],
    [0], [0], [0], [0],
    [1], [0], [1], [2],
    [2], [0], [2], [1],
  )

  The additive identity is $0$ and the multiplicative identity is $1$. Every element has an additive inverse: $0$ is its own inverse, while $1 + 2 = 0$ modulo $3$. Every nonzero element has a multiplicative inverse: $1^(-1) = 1$ and $2^(-1) = 2$ because $2 dot 2 = 1$ modulo $3$.
]

#example("Integers modulo 6")[
  The set $op("Z")_6 = {0, 1, 2, 3, 4, 5}$ is not a field. In modulo $6$ arithmetic,
  $
    2 dot 3 = 6 = 0.
  $
  But $2 != 0$ and $3 != 0$. This violates the no-zero-divisors property, so $op("Z")_6$ cannot be a field.
]

#remark[
  More generally, $op("Z")_p$ is a field when $p$ is prime. If $n$ is composite, then $op("Z")_n$ has nonzero zero divisors and is not a field.
]

== Ordered Fields

Field axioms allow addition, subtraction, multiplication, and division. They do not allow us to say that one element is larger than another. For limits and inequalities we need compatible order.

#definition("Ordered field")[
  An *ordered field* is a field $F$ with a subset $P subset F$, whose elements are called *positive*, such that:
  - for every $a in F$, exactly one of $a in P$, $a = 0$, or $-a in P$ holds;
  - if $a, b in P$, then $a + b in P$;
  - if $a, b in P$, then $a b in P$.

  We write $a > 0$ when $a in P$, and $a > b$ when $a - b > 0$.
]

We write $a < b$ to mean $b > a$, and $a <= b$ to mean $a < b$ or $a = b$.

#proposition("Order rules")[
  In an ordered field:
  1. If $a > b$ and $b > c$, then $a > c$.
  2. If $a > b$, then $a + c > b + c$.
  3. If $a > b$ and $c > 0$, then $a c > b c$.
  4. If $a > b$ and $c < 0$, then $a c < b c$.
  5. If $a != 0$, then $a^2 > 0$.
  6. $1 > 0$.
]

#proof[
  If $a > b$ and $b > c$, then $a - b > 0$ and $b - c > 0$. Since positives are closed under addition,
  $
    a - c = (a - b) + (b - c) > 0,
  $
  so $a > c$.

  Addition preserves inequalities because $(a + c) - (b + c) = a - b$.

  If $c > 0$, then $(a - b)c > 0$, so $a c > b c$. If $c < 0$, then $-c > 0$, so $a(-c) > b(-c)$, and multiplying both sides by $-1$ reverses the inequality.

  If $a != 0$, exactly one of $a > 0$ or $-a > 0$ holds. In the first case $a^2 > 0$; in the second case $(-a)(-a) > 0$, and this is equal to $a^2$. Since $1 = 1^2$ and $1 != 0$, we get $1 > 0$.
]

#corollary[
  The complex numbers $CC$ cannot be made into an ordered field compatible with the usual addition and multiplication.
]

#proof[
  In $CC$, the number $i$ is nonzero because if $i = 0$, then $-1 = i^2 = 0$, contradicting $0 != 1$.

  In an ordered field, every nonzero square is positive. Thus $i^2 > 0$. But $i^2 = -1$. Since $1 > 0$, we have $-1 < 0$, a contradiction. Therefore $CC$ is not an ordered field.
]

== Absolute Value and Distance

Absolute value converts order into distance. Most epsilon arguments in the course are just careful uses of absolute value inequalities.

#proposition("Absolute-value rules")[
  For all $x, y in RR$:
  1. $abs(x) >= 0$, and $abs(x) = 0$ if and only if $x = 0$.
  2. $abs(x y) = abs(x) abs(y)$.
  3. $abs(x + y) <= abs(x) + abs(y)$.
  4. $abs(abs(x) - abs(y)) <= abs(x - y)$.
]

#diagram(caption: [
  Visual representation of the triangle inequality. The direct path $abs(a + b)$ cannot be longer than travelling along $abs(a)$ and then $abs(b)$.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      let red = rgb("#dc2626")
      let sw = 1.0pt
      let p = (2.0, 0.0)
      let q = (4.9, 0.0)
      let r = (2.7, 2.0)

      draw.line(r, p, stroke: sw + green, mark: (end: ">"))
      draw.line(p, q, stroke: sw + green, mark: (end: ">"))
      draw.line(r, q, stroke: sw + red, mark: (end: ">"))

      for v in (p, q, r) {
        draw.circle(v, radius: 0.07, fill: blue, stroke: none)
      }

      draw.content((2.15, 1.05), text(size: 11pt, weight: "bold")[$a$])
      draw.content((3.45, -0.32), text(size: 11pt, weight: "bold")[$b$])
      draw.content((4.25, 1.20), text(size: 11pt, weight: "bold")[$a + b$])
      draw.content((3.55, -0.95), text(size: 12pt)[$abs(a + b) <= abs(a) + abs(b)$])
    })
  ]
]

#proof[
  The first two statements follow by checking the cases $x >= 0$ and $x < 0$.

  For the triangle inequality, note that $-abs(x) <= x <= abs(x)$ and $-abs(y) <= y <= abs(y)$. Adding these inequalities gives
  $
    -(abs(x) + abs(y)) <= x + y <= abs(x) + abs(y),
  $
  so $abs(x + y) <= abs(x) + abs(y)$.

  Since $x = (x - y) + y$, the triangle inequality gives
  $
    abs(x) <= abs(x - y) + abs(y),
  $
  hence $abs(x) - abs(y) <= abs(x - y)$. Swapping $x$ and $y$ gives $abs(y) - abs(x) <= abs(x - y)$. Together, these are exactly
  $
    abs(abs(x) - abs(y)) <= abs(x - y).
  $
]

#corollary[
  For all $x, y in RR$,
  $
    abs(x) - abs(y) <= abs(x - y)
  $
  and
  $
    abs(x) - abs(y) <= abs(x + y).
  $
]

#proof[
  The first inequality is one side of the previous proposition. For the second, apply the first inequality with $-y$ in place of $y$:
  $
    abs(x) - abs(-y) <= abs(x - (-y)) = abs(x + y).
  $
  Since $abs(-y) = abs(y)$, the result follows.
]

#important[
  The inequality $abs(x - a) < epsilon$ means
  $
    a - epsilon < x < a + epsilon.
  $
  In words: $x$ is within distance $epsilon$ of $a$. This is the language of sequence limits and function limits.
]

#diagram(caption: [
  The inequality $abs(x - a) < epsilon$ describes the open interval centred at $a$ with radius $epsilon$.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let axis = 0.75pt + luma(80)
      let accent = rgb("#0f766e")
      let weak = 0.55pt + luma(150)

      draw.line((0, 0), (8, 0), stroke: axis)
      draw.line((1.4, -0.14), (1.4, 0.14), stroke: weak)
      draw.line((4.0, -0.20), (4.0, 0.20), stroke: 0.8pt + accent)
      draw.line((6.6, -0.14), (6.6, 0.14), stroke: weak)
      draw.line((1.4, 0), (6.6, 0), stroke: 2pt + accent)

      draw.circle((1.4, 0), radius: 0.08, fill: white, stroke: 0.7pt + accent)
      draw.circle((6.6, 0), radius: 0.08, fill: white, stroke: 0.7pt + accent)
      draw.circle((4.0, 0), radius: 0.07, fill: accent, stroke: none)

      draw.content((1.4, -0.45), text(size: 8.5pt)[$a - epsilon$])
      draw.content((4.0, -0.45), text(size: 8.5pt)[$a$])
      draw.content((6.6, -0.45), text(size: 8.5pt)[$a + epsilon$])
      draw.content((4.0, 0.45), text(size: 8.5pt)[$abs(x - a) < epsilon$])
    })
  ]
]

== The Archimedean Property

The ordered-field axioms alone do not capture everything special about $RR$. One extra fact used constantly is that the natural numbers are not bounded above inside $RR$.

#definition("Archimedean property")[
  An ordered field $F$ has the *Archimedean property* if for every $x in F$, there exists $n in NN$ such that $n > x$.
]

#theorem[Archimedean consequences in $RR$][
  In $RR$:
  1. If $x, y in RR$ and $x > 0$, then there exists $n in NN$ such that $n x > y$.
  2. If $w > 0$, then there exists $n in NN$ such that $0 < 1 / n < w$.
]

#proof[
  For the first statement, apply the Archimedean property to $y / x$. There exists $n in NN$ such that $n > y / x$. Since $x > 0$, multiplying by $x$ gives $n x > y$.

  For the second statement, apply the Archimedean property to $1 / w$. There exists $n in NN$ such that $n > 1 / w$. Since $n > 0$ and $w > 0$, this implies $1 / n < w$. Also $1 / n > 0$.
]

== Irrationality Proofs

Irrationality arguments are early examples of proof by contradiction. The key number-theoretic fact used below is Euclid's lemma in a simple form: if a prime $p$ divides $a^2$, then $p$ divides $a$.

#proposition[
  The numbers $sqrt(2)$ and $sqrt(5)$ are irrational.
]

#proof[
  We prove the statement for $sqrt(2)$. Suppose, for contradiction, that $sqrt(2) = p / q$ for integers $p, q$ with $q != 0$, chosen so that the fraction is in lowest terms. Then
  $
    p^2 = 2 q^2.
  $
  Thus $p^2$ is even, so $p$ is even. Write $p = 2k$. Then
  $
    4 k^2 = 2 q^2,
  $
  so $q^2 = 2 k^2$. Hence $q$ is even. This contradicts the assumption that $p / q$ was in lowest terms.

  The proof for $sqrt(5)$ is analogous. If $sqrt(5) = p / q$ in lowest terms, then $p^2 = 5 q^2$, so $5$ divides $p$, say $p = 5k$. Then $25 k^2 = 5 q^2$, so $q^2 = 5 k^2$, and $5$ divides $q$. This again contradicts lowest terms.
]
