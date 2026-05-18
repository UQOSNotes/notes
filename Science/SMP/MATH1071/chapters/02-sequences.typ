#import "/lib.typ": *

= Bounds, Sequences, and Limits

Limits are the first place where the course becomes genuinely analytical. The point is not to say that a sequence "gets close" to a number, but to say exactly what that means and then use the definition without hand-waving.

The main habit in this chapter is to separate two questions:
- What number should the limit be?
- Given an arbitrary tolerance $epsilon > 0$, how far along the sequence do we need to go before every later term is inside that tolerance?

== Upper and Lower Bounds

#definition("Bounds")[
  Let $Omega subset RR$.

  A number $M in RR$ is an *upper bound* for $Omega$ if $x <= M$ for every $x in Omega$.

  A number $m in RR$ is a *lower bound* for $Omega$ if $m <= x$ for every $x in Omega$.

  The set $Omega$ is *bounded above* if it has an upper bound, *bounded below* if it has a lower bound, and *bounded* if it is both bounded above and bounded below.
]

#example[
  The interval $(0, 3)$ is bounded above and below. For example, $4$ is an upper bound and $-1$ is a lower bound.

  The set $NN$ is bounded below, for instance by $1$ or $0$, but is not bounded above in $RR$.
]

Bounds need not be elements of the set. The interval $(0, 3)$ has upper bound $3$, but $3 in.not (0, 3)$.

#definition("Supremum and infimum")[
  Let $Omega subset RR$.

  A number $S$ is the *supremum* or *least upper bound* of $Omega$, written $S = sup Omega$, if:
  1. $S$ is an upper bound for $Omega$;
  2. if $M$ is any upper bound for $Omega$, then $S <= M$.

  A number $I$ is the *infimum* or *greatest lower bound* of $Omega$, written $I = inf Omega$, if:
  1. $I$ is a lower bound for $Omega$;
  2. if $m$ is any lower bound for $Omega$, then $m <= I$.
]

#example[
  $
    sup(0, 3) = 3, quad inf(0, 3) = 0.
  $
  The set $(0, 3)$ has no maximum or minimum, because neither endpoint belongs to the set.
]

#example[
  Let
  $
    Omega = {-1} union (0, 3) union {7} union {13}.
  $
  Then $sup Omega = 13$ and $inf Omega = -1$. In this case the supremum and infimum are also the maximum and minimum.
]

#proposition[
  If a supremum or infimum exists, it is unique.
]

#proof[
  Suppose $S$ and $T$ are both suprema of $Omega$. Since $S$ is a supremum and $T$ is an upper bound, $S <= T$. Since $T$ is a supremum and $S$ is an upper bound, $T <= S$. Hence $S = T$.

  The proof for infima is the same with the inequalities reversed.
]

#theorem("Least upper bound property of $RR$")[
  Every non-empty subset of $RR$ that is bounded above has a supremum in $RR$.
]

#remark[
  This theorem is a completeness property of the real numbers. It is not true in $QQ$. For example,
  $
    {q in QQ: q^2 < 2}
  $
  is non-empty and bounded above in $QQ$, but it has no supremum in $QQ$.
]

#theorem("Epsilon characterisation of the supremum")[
  Let $Omega subset RR$ be non-empty and bounded above. Then $S = sup Omega$ if and only if:
  1. $S$ is an upper bound for $Omega$;
  2. for every $epsilon > 0$, there exists $x in Omega$ such that $S - epsilon < x <= S$.
]

#proof[
  Suppose first that $S = sup Omega$. Then $S$ is an upper bound. Let $epsilon > 0$. If there were no $x in Omega$ with $S - epsilon < x$, then every $x in Omega$ would satisfy $x <= S - epsilon$. Thus $S - epsilon$ would be an upper bound smaller than $S$, contradicting that $S$ is the least upper bound.

  Conversely, suppose the two stated conditions hold. Since $S$ is already an upper bound, it remains to show that no smaller number is an upper bound. Let $M < S$. Put $epsilon = S - M > 0$. By the second condition, there exists $x in Omega$ such that
  $
    M = S - epsilon < x.
  $
  Hence $M$ is not an upper bound. Therefore every upper bound is at least $S$, so $S = sup Omega$.
]

== Sequences

#definition("Sequence")[
  A *real sequence* is a function $a: NN -> RR$. We usually write $a_n$ instead of $a(n)$, and denote the whole sequence by $(a_n)_(n=1)^infinity$ or simply $(a_n)$.
]

#important[
  The notation $a_n$ refers to the $n$th term. The notation $(a_n)$ refers to the whole sequence.
]

#example[
  The formula $a_n = 1 / n$ defines the sequence
  $
    1, 1 / 2, 1 / 3, 1 / 4, dots
  $
  The terms approach $0$, although no term is equal to $0$.
]

#definition("Bounded sequence")[
  A sequence $(a_n)$ is:
  - *bounded above* if there exists $M in RR$ such that $a_n <= M$ for all $n in NN$;
  - *bounded below* if there exists $m in RR$ such that $m <= a_n$ for all $n in NN$;
  - *bounded* if it is bounded above and bounded below.
]

#proposition[
  A sequence $(a_n)$ is bounded if and only if there exists $C > 0$ such that $abs(a_n) <= C$ for all $n in NN$.
]

#proof[
  If $abs(a_n) <= C$ for all $n$, then $-C <= a_n <= C$, so the sequence is bounded.

  Conversely, suppose $m <= a_n <= M$ for all $n$. Let $C = max(abs(m), abs(M), 1)$. Then $-C <= a_n <= C$ for all $n$, hence $abs(a_n) <= C$.
]

== Limits of Sequences

#definition("Limit of a sequence")[
  Let $(a_n)$ be a real sequence and let $L in RR$. We say that $(a_n)$ *converges to* $L$, and write
  $
    lim_(n -> infinity) a_n = L,
  $
  if for every $epsilon > 0$ there exists $N in NN$ such that whenever $n >= N$,
  $
    abs(a_n - L) < epsilon.
  $

  If no such $L$ exists, the sequence *diverges*.
]

In this definition, $epsilon$ is chosen first. It represents the permitted error. The integer $N$ may depend on $epsilon$, but once $N$ is chosen, every later term must work.

#definition("Epsilon neighbourhood")[
  For $a in RR$ and $epsilon > 0$, the set
  $
    {x in RR: abs(x - a) < epsilon}
  $
  is the *epsilon neighbourhood* of $a$.
]

Since
$
  abs(x - a) < epsilon
$
is equivalent to
$
  a - epsilon < x < a + epsilon,
$
convergence means that every epsilon neighbourhood of $L$ eventually contains the whole tail of the sequence.

#example("A basic epsilon proof")[
  We prove that
  $
    lim_(n -> infinity) 1 / n = 0.
  $

  Let $epsilon > 0$. Choose $N in NN$ such that $N > 1 / epsilon$, possible by the Archimedean property. If $n >= N$, then
  $
    abs(1 / n - 0) = 1 / n <= 1 / N < epsilon.
  $
  Therefore $1 / n -> 0$.
]

#example[
  We prove that
  $
    lim_(n -> infinity) n / (n + 1) = 1.
  $

  Let $epsilon > 0$. Choose $N in NN$ such that $N > 1 / epsilon$. If $n >= N$, then
  $
    abs(n / (n + 1) - 1)
      = abs((n - n - 1) / (n + 1))
      = 1 / (n + 1)
      <= 1 / n
      <= 1 / N
      < epsilon.
  $
]

#example[
  We prove that
  $
    lim_(n -> infinity) 1 / sqrt(n) = 0.
  $

  Let $epsilon > 0$. Choose $N in NN$ such that $N > 1 / epsilon^2$. If $n >= N$, then
  $
    abs(1 / sqrt(n) - 0) = 1 / sqrt(n) <= 1 / sqrt(N) < epsilon.
  $
]

#example[
  We prove that
  $
    lim_(n -> infinity) 1 / (n^4 + 1) = 0.
  $

  Let $epsilon > 0$. Choose $N in NN$ such that $N > epsilon^(-1 / 4)$. If $n >= N$, then
  $
    abs(1 / (n^4 + 1) - 0)
      = 1 / (n^4 + 1)
      <= 1 / n^4
      <= 1 / N^4
      < epsilon.
  $
]

#note[
  In written proofs it is enough to say "choose $N in NN$ such that $N > 1 / epsilon$" rather than writing a floor or ceiling formula. The Archimedean property guarantees such an $N$ exists.
]

== Uniqueness and Boundedness

#theorem("Uniqueness of limits")[
  If a sequence converges, then its limit is unique.
]

#proof[
  Suppose $a_n -> L$ and $a_n -> M$. Let $epsilon > 0$. Since $a_n -> L$, there exists $N_1$ such that $abs(a_n - L) < epsilon / 2$ whenever $n >= N_1$. Since $a_n -> M$, there exists $N_2$ such that $abs(a_n - M) < epsilon / 2$ whenever $n >= N_2$.

  If $n >= max(N_1, N_2)$, then
  $
    abs(L - M)
      = abs(L - a_n + a_n - M)
      <= abs(L - a_n) + abs(a_n - M)
      < epsilon.
  $
  Since this holds for every $epsilon > 0$, we must have $abs(L - M) = 0$, and hence $L = M$.
]

#theorem("Convergent sequences are bounded")[
  Every convergent real sequence is bounded.
]

#proof[
  Suppose $a_n -> L$. Apply the definition of convergence with $epsilon = 1$. There exists $N in NN$ such that $abs(a_n - L) < 1$ whenever $n >= N$.

  For $n >= N$,
  $
    abs(a_n) = abs(a_n - L + L) <= abs(a_n - L) + abs(L) < 1 + abs(L).
  $
  The first $N - 1$ terms form a finite list, so they have a maximum absolute value. Let
  $
    C = max(abs(a_1), abs(a_2), dots, abs(a_(N - 1)), 1 + abs(L)).
  $
  Then $abs(a_n) <= C$ for every $n$, so $(a_n)$ is bounded.
]

#important[
  Boundedness is necessary for convergence, but not sufficient. The sequence $a_n = (-1)^n$ is bounded, but it does not converge.
]

== Limit Laws

#theorem("Algebra of limits")[
  Suppose $a_n -> a$, $b_n -> b$, and $lambda in RR$. Then:
  1. $a_n + b_n -> a + b$;
  2. $lambda a_n -> lambda a$;
  3. $a_n b_n -> a b$;
  4. if $b != 0$ and $b_n != 0$ eventually, then $a_n / b_n -> a / b$.
]

#proof[
  For sums, let $epsilon > 0$. Choose $N_1$ such that $abs(a_n - a) < epsilon / 2$ for $n >= N_1$, and choose $N_2$ such that $abs(b_n - b) < epsilon / 2$ for $n >= N_2$. If $n >= max(N_1, N_2)$, then
  $
    abs((a_n + b_n) - (a + b))
      <= abs(a_n - a) + abs(b_n - b)
      < epsilon.
  $

  Scalar multiplication is immediate if $lambda = 0$. If $lambda != 0$, choose $N$ such that $abs(a_n - a) < epsilon / abs(lambda)$ for $n >= N$.

  For products, write
  $
    a_n b_n - a b = a_n(b_n - b) + b(a_n - a).
  $
  Since $(a_n)$ converges, it is bounded. Choose $C > 0$ such that $abs(a_n) <= C$ for all $n$. Then
  $
    abs(a_n b_n - a b)
      <= C abs(b_n - b) + abs(b) abs(a_n - a).
  $
  Choose $N_1$ so that $C abs(b_n - b) < epsilon / 2$ for $n >= N_1$, and choose $N_2$ so that $abs(b) abs(a_n - a) < epsilon / 2$ for $n >= N_2$. This proves the product law.

  For reciprocals, suppose $b_n -> b != 0$. Choose $N_1$ such that $abs(b_n - b) < abs(b) / 2$ for $n >= N_1$. By the reverse triangle inequality,
  $
    abs(b_n) >= abs(b) - abs(b_n - b) > abs(b) / 2.
  $
  Hence, for $n >= N_1$,
  $
    abs(1 / b_n - 1 / b)
      = abs(b - b_n) / (abs(b_n) abs(b))
      < 2 abs(b_n - b) / abs(b)^2.
  $
  Since $b_n -> b$, the final expression can be made smaller than any $epsilon > 0$. Thus $1 / b_n -> 1 / b$. The quotient law follows from the product law applied to $a_n dot (1 / b_n)$.
]

#example[
  Find
  $
    lim_(n -> infinity) (3 n^2 + 2 n) / (5 n^2 + 3).
  $

  Divide numerator and denominator by $n^2$:
  $
    (3 n^2 + 2 n) / (5 n^2 + 3)
      = (3 + 2 / n) / (5 + 3 / n^2).
  $
  Since $1 / n -> 0$ and $1 / n^2 -> 0$, the limit laws give
  $
    lim_(n -> infinity) (3 n^2 + 2 n) / (5 n^2 + 3) = 3 / 5.
  $
]

#proposition("Polynomial quotients")[
  If $b_k != 0$, then
  $
    lim_(n -> infinity)
    (a_k n^k + a_(k - 1)n^(k - 1) + dots + a_1 n + a_0)
      /
    (b_k n^k + b_(k - 1)n^(k - 1) + dots + b_1 n + b_0)
    = a_k / b_k.
  $
]

#proof[
  Divide numerator and denominator by $n^k$. Every lower-order term contains a positive power of $1 / n$, and therefore converges to $0$.
]

== Squeeze Arguments

#theorem("Squeeze theorem")[
  Suppose $a_n <= b_n <= c_n$ for all sufficiently large $n$. If $a_n -> L$ and $c_n -> L$, then $b_n -> L$.
]

#proof[
  Let $epsilon > 0$. Since $a_n -> L$ and $c_n -> L$, there exists $N$ such that for all $n >= N$,
  $
    L - epsilon < a_n <= b_n <= c_n < L + epsilon.
  $
  Therefore $abs(b_n - L) < epsilon$ for all $n >= N$, so $b_n -> L$.
]

#example[
  Since $-1 <= sin(n) <= 1$,
  $
    -1 / n^2 <= sin(n) / n^2 <= 1 / n^2.
  $
  The outer sequences both converge to $0$, so
  $
    lim_(n -> infinity) sin(n) / n^2 = 0.
  $
]

#example[
  Find
  $
    lim_(n -> infinity) (n - 1) / (n^4 + 2).
  $
  For $n >= 1$,
  $
    0 <= (n - 1) / (n^4 + 2) <= n / n^4 = 1 / n^3.
  $
  Since $1 / n^3 -> 0$, the squeeze theorem gives
  $
    lim_(n -> infinity) (n - 1) / (n^4 + 2) = 0.
  $
]

#example[
  Rationalise to find
  $
    lim_(n -> infinity) (sqrt(n + 1) - sqrt(n)).
  $
  We have
  $
    sqrt(n + 1) - sqrt(n)
      = ((sqrt(n + 1) - sqrt(n))(sqrt(n + 1) + sqrt(n))) / (sqrt(n + 1) + sqrt(n))
      = 1 / (sqrt(n + 1) + sqrt(n)).
  $
  Hence
  $
    0 <= sqrt(n + 1) - sqrt(n) <= 1 / sqrt(n),
  $
  and the right-hand side converges to $0$. Therefore the required limit is $0$.
]

#proposition[
  If $a_n -> 0$ and $(b_n)$ is bounded, then $a_n b_n -> 0$.
]

#proof[
  Since $(b_n)$ is bounded, choose $C > 0$ such that $abs(b_n) <= C$ for all $n$. Then
  $
    abs(a_n b_n) <= C abs(a_n).
  $
  Since $C abs(a_n) -> 0$, the squeeze theorem gives $a_n b_n -> 0$.
]

== Divergence

To prove a sequence diverges, it is often enough to show that convergence would contradict either uniqueness of limits or boundedness.

#example[
  The sequence $a_n = 3 - (-1)^n$ diverges.

  If $n$ is odd, then $a_n = 4$. If $n$ is even, then $a_n = 2$. Suppose $a_n -> L$. Taking $epsilon = 1 / 2$, all sufficiently late terms would need to lie in $(L - 1 / 2, L + 1 / 2)$. But arbitrarily late odd terms equal $4$ and arbitrarily late even terms equal $2$, which are distance $2$ apart. No interval of radius $1 / 2$ can contain both. Therefore the sequence diverges.
]

#example[
  The sequence $a_n = n^3$ diverges. If it converged, it would be bounded. But for every $C > 0$, the Archimedean property gives $n in NN$ with $n > root(3, C)$, and then $n^3 > C$. Thus $(n^3)$ is not bounded.
]

#example[
  The sequence
  $
    a_n = (n^6 + 1) / n^3
  $
  diverges, because
  $
    a_n = n^3 + 1 / n^3.
  $
  The term $n^3$ is unbounded and $1 / n^3 >= 0$, so $a_n$ is unbounded. Hence it cannot converge.
]

#note[
  Two divergent sequences can have a convergent sum. For example, $a_n = n$ and $b_n = -n$ both diverge, but $a_n + b_n = 0$ for all $n$.

  A convergent sequence multiplied by a divergent sequence may converge or diverge. For example, $(0) dot n = 0$ converges, while $1 dot n = n$ diverges.
]

== Standard Limits

The following limits are used often. Some are proved later using monotonicity, exponentials, logarithms, or series.

#theorem("Useful standard limits")[
  1. If $abs(lambda) < 1$, then $lambda^n -> 0$.
  2. If $c > 0$, then $root(n, c) -> 1$.
  3. $root(n, n) -> 1$.
]

#example[
  Since $0 < 1 / 2 < 1$,
  $
    2^(-n) = (1 / 2)^n -> 0.
  $
  Therefore $cos^2(n) / 2^n -> 0$ by the bounded-times-null result, because $0 <= cos^2(n) <= 1$.
]
