#import "/lib.typ": *

= Induction and Recursion

Mathematical induction is a powerful proof technique for establishing statements that hold for all positive integers (or all integers from some starting point). It is especially natural for statements about sequences, sums, divisibility, and inequalities indexed by $n$.

Closely related is the idea of *recursive definition*, where an object is defined in terms of smaller instances of itself. Together, induction and recursion form the foundation for reasoning about computation and combinatorics.

== Sequences

A sequence is an ordered list of numbers. Many mathematical patterns and formulas involve sequences, and understanding them precisely is essential before working with induction.

=== Definitions and Notation

#definition[
  A *sequence* is a function whose domain is a set of consecutive integers. If the domain is $\{m, m+1, m+2, \ldots\}$ for some integer $m$, the sequence is written:
  $ a_m, a_(m+1), a_(m+2), dots $
  and is denoted ${a_n}_(n >= m)$ or simply ${a_n}$.

  Each value $a_n$ is called a *term* of the sequence; $a_m$ is the *initial term*.
]

#example[
  - The sequence defined by $a_n = 2n$ for $n >= 1$ gives: $2, 4, 6, 8, dots$
  - The sequence defined by $b_n = n^2$ for $n >= 0$ gives: $0, 1, 4, 9, 16, dots$
  - The sequence defined by $c_n = (-1)^n$ for $n >= 1$ gives: $-1, 1, -1, 1, dots$
]

#definition[
  A *summation* (or *series*) is the sum of terms of a sequence. The notation:
  $ sum_(k=m)^n a_k = a_m + a_(m+1) + dots + a_n $
  is called *sigma notation*. Here $k$ is the *index*, $m$ is the *lower limit*, and $n$ is the *upper limit*.
]

#definition[
  A *product* of sequence terms uses *pi notation*:
  $ product_(k=m)^n a_k = a_m dot a_(m+1) dot dots.h.c dot a_n $

  In particular, the *factorial* of a non-negative integer $n$ is:
  $ n! = product_(k=1)^n k = 1 times 2 times 3 times dots.h.c times n, quad 0! = 1 $
]

=== Common Sequences

#example[
  *Arithmetic sequences:* $a_n = a + (n-1)d$ for constants $a$ (first term) and $d$ (common difference).
  $ 3, 7, 11, 15, dots quad (a = 3, d = 4) $
  Sum of first $n$ terms: $display(sum_(k=1)^n (a + (k-1)d) = n/2 (2a + (n-1)d))$
]

#example[
  *Geometric sequences:* $a_n = a r^(n-1)$ for constants $a$ (first term) and $r$ (common ratio).
  $ 2, 6, 18, 54, dots quad (a = 2, r = 3) $
  Sum of first $n$ terms: $display(sum_(k=1)^n a r^(k-1) = a (r^n - 1)/(r - 1))$ for $r != 1$
]

#example[
  *The Fibonacci sequence:* Defined by $F_1 = 1$, $F_2 = 1$, and $F_n = F_(n-1) + F_(n-2)$ for $n >= 3$:
  $ 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, dots $
  Each term is the sum of the two preceding terms. The Fibonacci sequence arises throughout mathematics and nature.
]

#note[
  *Useful summation formulas:*
  $
      sum_(k=1)^n k & = n(n+1)/2 \
    sum_(k=1)^n k^2 & = n(n+1)(2n+1)/6 \
    sum_(k=1)^n k^3 & = [n(n+1)/2]^2 \
    sum_(k=0)^n r^k & = (r^(n+1) - 1)/(r-1) quad (r != 1)
  $
]

== Mathematical Induction

Mathematical induction is a proof technique for statements of the form "for all integers $n >= a$, $P(n)$". It works by establishing a base case and then showing each case implies the next.

=== The Principle of Mathematical Induction

#definition("Principle of Mathematical Induction")[
  Let $P(n)$ be a property defined for integers $n >= a$. If:
  1. *Base case:* $P(a)$ is true, and
  2. *Inductive step:* For every integer $k >= a$, if $P(k)$ is true then $P(k+1)$ is true,

  then $P(n)$ is true for all integers $n >= a$.
]

The inductive step assumes $P(k)$ (the *inductive hypothesis*) and derives $P(k+1)$. The most common base case is $a = 0$ or $a = 1$.

#remark[
  Think of induction like an infinite row of dominoes. The base case knocks over the first domino. The inductive step guarantees that whenever domino $k$ falls, domino $k+1$ falls too. Together, all dominoes fall.
]

=== Writing Induction Proofs

Every induction proof has a standard structure:

#align(left)[
  *Claim:* For all integers $n >= a$, $P(n)$.

  *Proof (by mathematical induction):*

  *Base case* ($n = a$): [Verify $P(a)$ directly.]

  *Inductive step:* Let $k >= a$ be an arbitrary integer and suppose $P(k)$ is true. [This is the inductive hypothesis.]

  [Use $P(k)$ to derive $P(k+1)$.]

  Therefore, $P(k+1)$ is true.

  By the principle of mathematical induction, $P(n)$ is true for all integers $n >= a$.
]

=== Summation and Inequality Proofs

#example[
  *Theorem:* For all integers $n >= 1$, $display(sum_(k=1)^n k = n(n+1)/2)$.

  *Proof (by mathematical induction):*

  *Base case* ($n = 1$): The left side is $sum_(k=1)^1 k = 1$. The right side is $1(1+1)/2 = 1$. These are equal. ✓

  *Inductive step:* Suppose $k >= 1$ and $display(sum_(i=1)^k i = k(k+1)/2)$. We must show $display(sum_(i=1)^(k+1) i = (k+1)(k+2)/2)$.

  $
    sum_(i=1)^(k+1) i = underbrace(sum_(i=1)^k i, = k(k+1)/2 "by I.H.") + (k+1) = k(k+1)/2 + (k+1) = (k+1)[k/2 + 1] = (k+1)(k+2)/2
  $

  Therefore, the formula holds for $k+1$. By induction, it holds for all $n >= 1$.
]

#example[
  *Theorem:* For all integers $n >= 1$, $2^n > n$.

  *Proof (by mathematical induction):*

  *Base case* ($n = 1$): $2^1 = 2 > 1$. ✓

  *Inductive step:* Suppose $k >= 1$ and $2^k > k$. Then:
  $ 2^(k+1) = 2 dot 2^k > 2k = k + k >= k + 1 $
  where the last step uses $k >= 1$.

  Therefore $2^(k+1) > k+1$. By induction, $2^n > n$ for all $n >= 1$.
]

#example[
  *Theorem:* For all integers $n >= 0$, $3 divides (n^3 - n)$.

  *Proof (by mathematical induction):*

  *Base case* ($n = 0$): $0^3 - 0 = 0 = 3 times 0$. ✓

  *Inductive step:* Suppose $3 | (k^3 - k)$. Then:
  $ (k+1)^3 - (k+1) = k^3 + 3k^2 + 3k + 1 - k - 1 = (k^3 - k) + 3k^2 + 3k = (k^3 - k) + 3k(k+1) $

  Since $3 | (k^3 - k)$ and $3 | 3k(k+1)$, we have $3 | ((k+1)^3 - (k+1))$. ✓

  By induction, $3 | (n^3 - n)$ for all $n >= 0$.
]

== Strong Mathematical Induction

Sometimes the inductive step needs not just $P(k)$, but $P$ at all values up to $k$. This calls for *strong induction*.

=== The Principle of Strong Induction

#definition("Principle of Strong Mathematical Induction")[
  Let $P(n)$ be a property defined for integers $n >= a$. If:
  1. *Base case(s):* $P(a)$ is true (or $P(a), P(a+1), dots, P(b)$ are true for some $b >= a$), and
  2. *Inductive step:* For every integer $k >= a$ (or $k > b$), if $P(j)$ is true for all integers $j$ with $a <= j <= k$, then $P(k+1)$ is true,

  then $P(n)$ is true for all integers $n >= a$.
]

#remark[
  Strong induction is logically equivalent to ordinary induction; they can prove the same statements. Strong induction is more convenient when $P(k+1)$ depends on earlier terms besides just $P(k)$.
]

=== Comparing Ordinary and Strong Induction

#table(
  columns: (auto, auto),
  align: (left, left),
  inset: 10pt,
  [*Ordinary Induction*], [*Strong Induction*],
  [Assumes only $P(k)$ in inductive step], [Assumes $P(a), P(a+1), dots, P(k)$ in inductive step],
  [Use when $P(k+1)$ follows from $P(k)$ alone], [Use when $P(k+1)$ depends on multiple earlier cases],
  [Common for sums, products, inequalities], [Common for divisibility, prime factorisation, Fibonacci],
)

#example[
  *Theorem:* Every integer $n >= 2$ can be written as a product of primes.

  *Proof (by strong induction):*

  *Base case* ($n = 2$): $2$ is itself prime. ✓

  *Inductive step:* Let $k >= 2$ and suppose every integer $j$ with $2 <= j <= k$ is a product of primes. Consider $k + 1$:

  - If $k+1$ is prime, we are done.
  - If $k+1$ is not prime, then $k+1 = a b$ for integers $a, b$ with $2 <= a, b <= k$. By the inductive hypothesis, both $a$ and $b$ are products of primes, so $k+1 = a b$ is also a product of primes.

  By strong induction, every integer $n >= 2$ is a product of primes.
]

#example[
  *Theorem:* Every amount of postage $>= 12$ cents can be formed using 4-cent and 5-cent stamps.

  *Proof (by strong induction):*

  *Base cases:*
  - $n = 12$: $12 = 4 + 4 + 4$ ✓
  - $n = 13$: $13 = 4 + 4 + 5$ ✓
  - $n = 14$: $14 = 4 + 5 + 5$ ✓
  - $n = 15$: $15 = 5 + 5 + 5$ ✓

  *Inductive step:* Let $k >= 15$ and suppose all amounts from 12 to $k$ can be formed. Then $k+1 >= 16$, so $(k+1) - 4 >= 12$. By the inductive hypothesis, $(k+1)-4$ can be formed using 4- and 5-cent stamps. Adding one 4-cent stamp gives $k+1$. ✓

  By strong induction, all amounts $>= 12$ can be formed.
]

== Recursive Definitions

A recursive definition defines an object using previously defined instances of the same object. It has two parts: a *base case* (one or more explicitly defined starting values) and a *recursive step* (defining subsequent values in terms of earlier ones).

=== Recursively Defined Sequences

#definition[
  A *recurrence relation* for a sequence ${a_n}$ is a formula that expresses $a_n$ in terms of one or more preceding terms $a_(n-1), a_(n-2), \ldots$, together with *initial conditions* that provide enough starting values to determine the sequence completely.
]

#example[
  The *Fibonacci sequence* is defined by:
  $ F_1 = 1, quad F_2 = 1, quad F_n = F_(n-1) + F_(n-2) quad "for" n >= 3 $
  This gives: $1, 1, 2, 3, 5, 8, 13, 21, dots$
]

#example[
  The *factorial function* can be defined recursively:
  $ 0! = 1, quad n! = n dot (n-1)! quad "for" n >= 1 $
]

#example[
  The sequence defined by $a_1 = 2$, $a_n = 3 a_(n-1) + 1$ gives:
  $ a_1 = 2, quad a_2 = 7, quad a_3 = 22, quad a_4 = 67, dots $
]

=== Recursively Defined Sets and Functions

#definition[
  A set $S$ can be defined recursively by:
  1. *Base clause:* Specifying initial elements of $S$
  2. *Recursive clause:* Providing rules for constructing new elements of $S$ from existing ones
  3. *Extremal clause:* Stating that nothing else is in $S$
]

#example[
  The set of natural numbers $NN$ can be defined recursively:
  1. $0 in NN$
  2. If $n in NN$, then $n + 1 in NN$
  3. Nothing else is in $NN$
]

#example[
  The set of all strings over an alphabet $Sigma$ can be defined recursively:
  1. The empty string $epsilon in Sigma^*$
  2. If $w in Sigma^*$ and $a in Sigma$, then $w a in Sigma^*$
]

#remark[
  Recursive definitions are the natural home of induction proofs. When an object is defined recursively, induction on its structure typically gives the cleanest proof of properties about it.
]

== Solving Recurrence Relations

A recurrence relation defines a sequence implicitly. Solving it means finding an explicit (closed-form) formula for the $n$-th term.

=== First-Order Recurrences

A *first-order linear recurrence* has the form $a_n = r a_(n-1) + f(n)$.

#example[
  *Homogeneous case:* $a_n = r a_(n-1)$, $a_0 = C$.

  The solution is $a_n = C r^n$ (geometric sequence).
]

#example[
  Solve $a_n = 2 a_(n-1)$ with $a_0 = 3$.

  This is a geometric recurrence with ratio $r = 2$, so $a_n = 3 dot 2^n$.

  *Verification by induction:* $a_0 = 3 dot 2^0 = 3$ ✓, and $2 a_(n-1) = 2 dot 3 dot 2^(n-1) = 3 dot 2^n = a_n$ ✓.
]

#example[
  *Non-homogeneous case:* Solve $a_n = 2 a_(n-1) + 3$ with $a_1 = 1$.

  Compute a few terms: $a_1 = 1$, $a_2 = 5$, $a_3 = 13$, $a_4 = 29$.

  These suggest $a_n = 2^(n+1) - 3$. Verify: $2 a_(n-1) + 3 = 2(2^n - 3) + 3 = 2^(n+1) - 3$ ✓.
]

=== Second-Order Linear Recurrences

A *second-order linear homogeneous recurrence* has the form:
$ a_n = A a_(n-1) + B a_(n-2), quad n >= 2 $
with two initial conditions $a_0$ and $a_1$.

=== The Characteristic Equation Method

#definition[
  The *characteristic equation* of the recurrence $a_n = A a_(n-1) + B a_(n-2)$ is:
  $ t^2 = A t + B quad "or equivalently" quad t^2 - A t - B = 0 $
  Its solutions $t_1$ and $t_2$ are the *characteristic roots*.
]

#theorem[
  Let $t_1$ and $t_2$ be the characteristic roots of $a_n = A a_(n-1) + B a_(n-2)$.

  - *Distinct roots* ($t_1 != t_2$): The general solution is $a_n = C_1 t_1^n + C_2 t_2^n$
  - *Repeated root* ($t_1 = t_2 = t$): The general solution is $a_n = (C_1 + C_2 n) t^n$

  The constants $C_1$ and $C_2$ are determined from the initial conditions.
]

#example[
  Find a closed form for the Fibonacci sequence: $F_n = F_(n-1) + F_(n-2)$, $F_1 = F_2 = 1$.

  *Characteristic equation:* $t^2 = t + 1$, i.e., $t^2 - t - 1 = 0$.

  *Roots:* $t = (1 plus.minus sqrt(5))/2$, so $t_1 = phi = (1 + sqrt(5))/2$ (the golden ratio) and $t_2 = hat(phi) = (1 - sqrt(5))/2$.

  *General solution:* $F_n = C_1 phi^n + C_2 hat(phi)^n$.

  *Applying initial conditions:*
  $ F_1 = C_1 phi + C_2 hat(phi) = 1 $
  $ F_2 = C_1 phi^2 + C_2 hat(phi)^2 = 1 $

  Solving gives $C_1 = 1/sqrt(5)$ and $C_2 = -1/sqrt(5)$.

  Therefore, *Binet's Formula:*
  $ F_n = 1/sqrt(5) lr([((1 + sqrt(5))/2)^n - ((1 - sqrt(5))/2)^n]) $
]

#remark[
  Despite involving irrational numbers, Binet's formula always produces a positive integer. Also note that $|(1 - sqrt(5))/2| < 1$, so $F_n$ is the nearest integer to $phi^n / sqrt(5)$ for all $n >= 1$.
]
