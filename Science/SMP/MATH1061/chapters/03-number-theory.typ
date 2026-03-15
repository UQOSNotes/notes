#import "/lib.typ": *

= Number Theory

Number theory is the study of the integers and their properties. Despite the apparent simplicity of the integers, they exhibit rich and complex behaviour that has fascinated mathematicians for millennia.

In this chapter we study:
- *Rational and irrational numbers:* which real numbers can be expressed as fractions?
- *Divisibility:* when does one integer divide evenly into another?
- *Modular arithmetic:* the arithmetic of remainders, essential in cryptography and computing
- *The Euclidean Algorithm:* an efficient method for computing greatest common divisors

Throughout, we apply the proof techniques from the previous chapter to establish rigorous results.

== Rational Numbers

#definition[
  A real number $r$ is *rational* if and only if it can be expressed as a quotient of two integers with non-zero denominator.

  Symbolically: $r in QQ$ if and only if there exist integers $a$ and $b$ such that $r = a/b$ and $b != 0$.

  The set of all rational numbers is denoted $QQ$ (from the German word "Quotient").
]

#definition[
  A real number that is not rational is *irrational*.
]

#theorem[
  The decimal expansion of a rational number either repeats or terminates.

  Conversely, the decimal expansion of an irrational number does not repeat and does not terminate.
]

#example[
  - $1/4 = 0.25$ is rational (terminating decimal)
  - $1/3 = 0.333...$ is rational (repeating decimal)
  - $pi = 3.14159...$ is irrational (non-repeating, non-terminating decimal)
  - $sqrt(2) = 1.41421...$ is irrational (non-repeating, non-terminating decimal)
]

=== Definitions and Properties

The rational numbers have many important algebraic properties. We prove several of these properties below.

#theorem("Sum of Rationals")[
  The sum of any two rational numbers is rational.

  Formally: For all $r, s in QQ$, we have $r + s in QQ$.
]

#proof[
  Suppose $r$ and $s$ are rational numbers. Then by definition, $r = a/b$ and $s = c/d$ for some integers $a, b, c, d$ where $b != 0$ and $d != 0$.

  Therefore,
  $ r + s = a/b + c/d = (a d + b c)/(b d) $

  Since $a, b, c, d$ are integers:
  - The numerator $a d + b c$ is an integer
  - The denominator $b d$ is an integer
  - Since $b != 0$ and $d != 0$, we have $b d != 0$

  Thus, by definition, $r + s$ is a rational number.
]

#theorem("Quotient of Rationals")[
  For any rational number $r$ and any non-zero rational number $s$, the quotient $r / s$ is rational.

  Formally: For all $r, s in QQ$, if $s != 0$, then $r / s in QQ$.
]

#proof[
  Suppose $r$ and $s$ are rational numbers with $s != 0$. Then by definition, $r = a/b$ and $s = c/d$ for some integers $a, b, c, d$ where $b != 0$, $d != 0$, and $c != 0$ (since $s != 0$).

  Therefore,
  $ r / s = (a/b) / (c/d) = a/b dot d/c = (a d)/(b c) $

  Since $a, b, c, d$ are integers:
  - The numerator $a d$ is an integer
  - The denominator $b c$ is an integer
  - Since $b != 0$ and $c != 0$, we have $b c != 0$

  Thus, by definition, $r / s$ is a rational number.
]

#theorem("Density of Rationals")[
  For all rational numbers $r$ and $s$ where $r < s$, there exists another rational number $q$ such that $r < q < s$.

  That is, between any two rational numbers, there is always another rational number. (The rationals are *dense* in the real numbers.)
]

#proof[
  Suppose $r$ and $s$ are rational numbers with $r < s$. By definition, $r = a/b$ and $s = c/d$ for some integers $a, b, c, d$ where $b != 0$ and $d != 0$.

  Let $q = (r + s)/2$ (the midpoint of $r$ and $s$).

  Since $r$ and $s$ are rational, $r + s$ is rational by the previous theorem. Since $2 in QQ$ and $2 != 0$, we have $(r + s)/2$ is rational by the quotient theorem. Thus $q in QQ$.

  Now we show $r < q < s$:
  - Since $r < s$, we have $q = (r + s)/2 < (s + s)/2 = s$
  - Similarly, $q = (r + s)/2 > (r + r)/2 = r$

  Therefore, $r < q < s$, and $q$ is rational.
]

#theorem("Multiplicative Inverse")[
  For every non-zero rational number $r$, there exists a non-zero rational number $s$ such that $r s = 1$.

  (That is, every non-zero rational has a multiplicative inverse.)
]

#proof[
  Suppose $r$ is a non-zero rational number. By definition, $r = a/b$ for some integers $a$ and $b$ where $b != 0$ and $a != 0$ (since $r != 0$).

  Let $s = b/a$. Since $a$ and $b$ are both non-zero integers, $s$ is a non-zero rational number.

  Moreover,
  $ r s = a/b dot b/a = (a b)/(b a) = 1 $

  Therefore, for every non-zero rational $r$, there exists a non-zero rational $s$ (namely, $s = 1/r$) such that $r s = 1$.
]

#theorem("Sum of Rational and Irrational")[
  For any rational number $q$ and any irrational number $x$, the sum $q + x$ is irrational.
]

#proof[
  We use proof by contradiction. Suppose the theorem is false. Then there exist a rational number $q$ and an irrational number $x$ such that $q + x$ is rational.

  By definition, $q = a/b$ for some integers $a, b$ with $b != 0$.

  Also, $q + x = c/d$ for some integers $c, d$ with $d != 0$ (since $q + x$ is rational).

  Therefore,
  $ x = (q + x) - q = c/d - a/b = (b c - a d)/(b d) $

  Since $a, b, c, d$ are integers and $b != 0$, $d != 0$:
  - The numerator $b c - a d$ is an integer
  - The denominator $b d$ is an integer
  - Since $b != 0$ and $d != 0$, we have $b d != 0$

  Thus, by definition, $x$ is a rational number.

  But $x$ was assumed to be irrational, which by definition means $x$ is not rational. This is a contradiction.

  Therefore, for any rational $q$ and irrational $x$, the sum $q + x$ is irrational.
]

=== Representations of Rational Numbers

Every rational number has multiple equivalent representations as a fraction. The most useful is the fully reduced form.

#definition[
  A fraction $a/b$ is in *lowest terms* (or *fully reduced*) if $gcd(a, b) = 1$, i.e., $a$ and $b$ share no common factor other than 1.
]

#theorem[
  Every rational number can be written as a fraction in lowest terms. This representation is unique up to sign.
]

#example[
  - $12/18 = 2/3$ (dividing numerator and denominator by $gcd(12,18) = 6$)
  - $-15/25 = -3/5$ (dividing by $gcd(15,25) = 5$)
  - $7/1 = 7$ (integers are rational numbers with denominator 1)
]

#remark[
  When using the definition of rational number in a proof, we often write $r = a/b$ with $b > 0$ and $gcd(a,b) = 1$ to obtain a canonical representation. This is standard practice when proving irrationality results.
]

== Divisibility

Divisibility is a fundamental concept in number theory. It describes when one integer can be divided by another leaving no remainder.

#definition[
  Let $a$ and $b$ be integers with $a != 0$. We say $a$ *divides* $b$, written $a divides b$, if there exists an integer $k$ such that $b = a k$.

  Equivalently, $a divides b$ means "$b$ is divisible by $a$", "$a$ is a factor of $b$", or "$b$ is a multiple of $a$".

  If $a$ does not divide $b$, we write $a divides.not b$.
]

#example[
  - $3 divides 12$ since $12 = 3 times 4$
  - $7 divides 0$ since $0 = 7 times 0$
  - $5 divides.not 13$ since $13 = 5 times 2 + 3$, which is not a multiple of 5
  - $a divides 0$ for every non-zero integer $a$
  - $1 divides b$ for every integer $b$
]

=== Definition and Basic Properties

#theorem("Properties of Divisibility")[
  Let $a$, $b$, $c$ be integers with $a != 0$. Then:

  1. If $a divides b$ and $a divides c$, then $a divides (b + c)$
  2. If $a divides b$, then $a divides b c$ for any integer $c$
  3. If $a divides b$ and $b divides c$, then $a divides c$ (transitivity)
]

#proof[
  We prove each part directly.

  *(1)* Suppose $a | b$ and $a | c$. Then $b = a s$ and $c = a t$ for some integers $s, t$. Therefore $b + c = a s + a t = a(s + t)$. Since $s + t$ is an integer, $a | (b + c)$.

  *(2)* Suppose $a | b$. Then $b = a k$ for some integer $k$. Therefore $b c = (a k) c = a(k c)$. Since $k c$ is an integer, $a | b c$.

  *(3)* Suppose $a | b$ and $b | c$. Then $b = a s$ and $c = b t$ for some integers $s, t$. Therefore $c = b t = (a s) t = a(s t)$. Since $s t$ is an integer, $a | c$.
]

#theorem[
  More generally, if $a divides b$ and $a divides c$, then $a divides (m b + n c)$ for any integers $m$ and $n$. Any such expression $m b + n c$ is called an *integer linear combination* of $b$ and $c$.
]

#proof[
  Since $a | b$ and $a | c$, there exist integers $s$ and $t$ such that $b = a s$ and $c = a t$. Then $m b + n c = m(a s) + n(a t) = a(m s + n t)$. Since $m s + n t$ is an integer, $a | (m b + n c)$.
]

=== The Division Algorithm

#theorem("Division Algorithm")[
  For any integer $a$ and positive integer $d$, there exist unique integers $q$ (the *quotient*) and $r$ (the *remainder*) such that:
  $ a = d q + r quad "and" quad 0 <= r < d $
]

#example[
  - $17 = 5 times 3 + 2$, so dividing 17 by 5 gives quotient 3 and remainder 2
  - $-7 = 3 times (-3) + 2$, so dividing $-7$ by 3 gives quotient $-3$ and remainder 2
  - $21 = 7 times 3 + 0$, so dividing 21 by 7 gives quotient 3 and remainder 0
]

#note[
  The remainder $r$ satisfies $0 <= r < d$, so it is always non-negative. For negative dividends, this means the quotient is not simply the truncated value; for example, $-7 div 3 = -3$ with remainder 2, not $-7 div 3 = -2$ with remainder $-1$.
]

=== Common Divisors

#definition[
  An integer $d$ is a *common divisor* of integers $a$ and $b$ if $d | a$ and $d | b$.

  The *greatest common divisor* of $a$ and $b$, denoted $gcd(a, b)$, is the largest positive integer that divides both $a$ and $b$.

  Two integers $a$ and $b$ are *relatively prime* (or *coprime*) if $gcd(a, b) = 1$.
]

#example[
  - $gcd(12, 18) = 6$, since the common divisors of 12 and 18 are $1, 2, 3, 6$
  - $gcd(15, 28) = 1$, since 15 and 28 share no common factor other than 1
  - $gcd(0, n) = n$ for all positive integers $n$
]

#definition[
  The *least common multiple* of positive integers $a$ and $b$, denoted $"lcm"(a, b)$, is the smallest positive integer divisible by both $a$ and $b$.
]

#theorem[
  For any positive integers $a$ and $b$:
  $ gcd(a, b) times "lcm"(a, b) = a b $
]

== Modular Arithmetic

Modular arithmetic is a system of arithmetic for integers that considers only their remainders upon division by a fixed positive integer $n$, called the *modulus*. It is sometimes called "clock arithmetic" since hours on a 12-hour clock wrap around cyclically. It underpins much of modern cryptography, computer science, and algebra.

=== Congruence Modulo $n$

#definition[
  Let $n$ be a positive integer. Two integers $a$ and $b$ are *congruent modulo $n$*, written $a equiv b quad (mod n)$, if $n divides (a - b)$.

  Equivalently, $a equiv b quad (mod n)$ if and only if $a$ and $b$ have the same remainder when divided by $n$.
]

#example[
  - $17 equiv 5 quad (mod 6)$ since $6 | (17 - 5) = 12$
  - $-1 equiv 11 quad (mod 4)$ since $4 | (-1 - 11) = -12$
  - $100 equiv 0 quad (mod 10)$ since $10 | 100$
  - $29 equiv.not 2 quad (mod 9)$ since $9 divides.not (29 - 2) = 27$... actually $9 | 27$, so $29 equiv 2 quad (mod 9)$
]

#theorem[
  Congruence modulo $n$ is an *equivalence relation* on the integers. That is, for all integers $a$, $b$, $c$:
  1. *Reflexivity:* $a equiv a quad (mod n)$
  2. *Symmetry:* If $a equiv b quad (mod n)$, then $b equiv a quad (mod n)$
  3. *Transitivity:* If $a equiv b quad (mod n)$ and $b equiv c quad (mod n)$, then $a equiv c quad (mod n)$
]

#proof[
  *(1)* $n | (a - a) = 0$. ✓

  *(2)* If $n | (a - b)$, then $n | (-(a - b)) = (b - a)$. ✓

  *(3)* If $n | (a - b)$ and $n | (b - c)$, then $n | ((a - b) + (b - c)) = (a - c)$. ✓
]

=== Properties of Modular Arithmetic

#theorem[
  If $a equiv b quad (mod n)$ and $c equiv d quad (mod n)$, then:
  1. $a + c equiv b + d quad (mod n)$
  2. $a - c equiv b - d quad (mod n)$
  3. $a c equiv b d quad (mod n)$
]

#proof[
  Since $a equiv b quad (mod n)$ and $c equiv d quad (mod n)$, there exist integers $s$ and $t$ such that $a = b + n s$ and $c = d + n t$.

  *(1)* $a + c = (b + n s) + (d + n t) = (b + d) + n(s + t)$, so $n | ((a + c) - (b + d))$.

  *(2)* $a - c = (b + n s) - (d + n t) = (b - d) + n(s - t)$, so $n | ((a - c) - (b - d))$.

  *(3)* $a c = (b + n s)(d + n t) = b d + n(b t + d s + n s t) = b d + n(b t + d s + n s t)$, so $n | (a c - b d)$.
]

#important[
  These three properties mean we can reduce intermediate results modulo $n$ at any point in a computation. This is essential for efficiency when working with large numbers.
]

#example[
  Compute $7^{100} quad (mod 10)$ (i.e., find the last digit of $7^{100}$).

  Observe the pattern of powers of 7 modulo 10:
  - $7^1 equiv 7$
  - $7^2 equiv 49 equiv 9$
  - $7^3 equiv 7 times 9 = 63 equiv 3$
  - $7^4 equiv 7 times 3 = 21 equiv 1$
  - $7^5 equiv 7 times 1 = 7$ (cycle repeats with period 4)

  Since $100 = 4 times 25$, we have $7^{100} = (7^4)^{25} equiv 1^{25} = 1 quad (mod 10)$.

  Therefore, the last digit of $7^{100}$ is *1*.
]

=== Applications

Modular arithmetic has many important applications:

*Checksums and Error Detection:*

#example[
  ISBN-10 numbers use a checksum based on modular arithmetic. For a 10-digit ISBN $d_1 d_2 dots d_{10}$, the check digit satisfies:
  $ d_1 + 2d_2 + 3d_3 + dots + 10 d_{10} equiv 0 quad (mod 11) $
  This detects any single-digit error and any transposition of adjacent digits.
]

*Day of the Week Calculations:*

#example[
  To find the day of the week $n$ days from today: if today is day $d$ (where 0 = Sunday, 1 = Monday, ..., 6 = Saturday), then the day in $n$ days is $(d + n) quad (mod 7)$.

  If today is Wednesday (day 3), then in 100 days it will be day $(3 + 100) quad (mod 7) = 103 quad (mod 7) = 5$, which is Friday.
]

*Cryptography:*

#remark[
  Many modern encryption systems, including RSA, are built on modular arithmetic with very large moduli. The security relies on the computational difficulty of certain problems in modular arithmetic, such as finding discrete logarithms.
]

== The Euclidean Algorithm

The Euclidean Algorithm is one of the oldest algorithms in mathematics, dating back to Euclid's *Elements* (c. 300 BCE). It efficiently computes the greatest common divisor of two integers by repeatedly applying the Division Algorithm.

The key observation is:

#theorem[
  For integers $a$ and $b$ with $b != 0$, if $a = b q + r$ (with $0 <= r < |b|$), then:
  $ gcd(a, b) = gcd(b, r) $
]

#proof[
  Let $d = gcd(a, b)$ and $e = gcd(b, r)$.

  Since $d | a$ and $d | b$, we have $d | (a - b q) = r$. So $d$ is a common divisor of $b$ and $r$, meaning $d <= e$.

  Since $e | b$ and $e | r$, we have $e | (b q + r) = a$. So $e$ is a common divisor of $a$ and $b$, meaning $e <= d$.

  Therefore $d = e$, i.e., $gcd(a, b) = gcd(b, r)$.
]

=== Computing the GCD

The Euclidean Algorithm applies the division algorithm repeatedly, reducing the problem at each step until the remainder is 0.

#algorithm("Euclidean Algorithm")[
  To compute $gcd(a, b)$ where $a >= b > 0$:

  Apply the division algorithm repeatedly:
  $ a &= b q_1 + r_1 &quad& (0 <= r_1 < b) \
    b &= r_1 q_2 + r_2 &quad& (0 <= r_2 < r_1) \
    r_1 &= r_2 q_3 + r_3 &quad& (0 <= r_3 < r_2) \
    &dots.v \
    r_(n-2) &= r_(n-1) q_n + 0 $

  The last non-zero remainder is $gcd(a, b) = r_(n-1)$.
]

#example[
  Compute $gcd(252, 198)$.

  $ 252 &= 198 times 1 + 54 \
    198 &= 54 times 3 + 36 \
    54 &= 36 times 1 + 18 \
    36 &= 18 times 2 + 0 $

  The last non-zero remainder is 18, so $gcd(252, 198) = 18$.
]

#example[
  Compute $gcd(414, 662)$.

  $ 662 &= 414 times 1 + 248 \
    414 &= 248 times 1 + 166 \
    248 &= 166 times 1 + 82 \
    166 &= 82 times 2 + 2 \
    82 &= 2 times 41 + 0 $

  Therefore $gcd(414, 662) = 2$.
]

=== The Extended Euclidean Algorithm

The Extended Euclidean Algorithm not only computes $gcd(a, b)$, but also finds integers $s$ and $t$ such that $a s + b t = gcd(a, b)$. This is done by back-substituting through the steps of the Euclidean Algorithm.

#example[
  Find integers $s$ and $t$ such that $252 s + 198 t = gcd(252, 198) = 18$.

  From the Euclidean Algorithm steps:
  $ 18 &= 54 - 36 times 1 \
       &= 54 - (198 - 54 times 3) times 1 = 54 times 4 - 198 \
       &= (252 - 198 times 1) times 4 - 198 = 252 times 4 - 198 times 5 $

  Therefore $s = 4$, $t = -5$, and we can verify: $252 times 4 + 198 times (-5) = 1008 - 990 = 18$. ✓
]

=== Bézout's Identity

#theorem("Bézout's Identity")[
  For any integers $a$ and $b$, not both zero, there exist integers $s$ and $t$ such that:
  $ a s + b t = gcd(a, b) $

  Moreover, $gcd(a, b)$ is the smallest positive integer that can be expressed as an integer linear combination of $a$ and $b$.
]

#corollary[
  Integers $a$ and $b$ are relatively prime (i.e., $gcd(a,b) = 1$) if and only if there exist integers $s$ and $t$ such that $a s + b t = 1$.
]

#theorem[
  If $gcd(a, b) = 1$ and $a | b c$, then $a | c$.
]

#proof[
  Since $gcd(a, b) = 1$, by Bézout's Identity there exist integers $s$ and $t$ with $a s + b t = 1$.

  Multiplying both sides by $c$: $a s c + b t c = c$.

  Since $a | a s c$ and $a | b c$, we have $a | b t c$. Therefore $a | (a s c + b t c) = c$.
]

#remark[
  Bézout's Identity and its corollaries are used throughout number theory and abstract algebra. In particular, the corollary above is the key step in proving the *Fundamental Theorem of Arithmetic* (unique prime factorisation).
]
