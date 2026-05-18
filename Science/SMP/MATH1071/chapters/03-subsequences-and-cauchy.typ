#import "/lib.typ": *

= More Sequences

The previous chapter studied what it means for an entire sequence to converge. This chapter studies what can still be said when the whole sequence does not settle down. The main tools are monotonicity, subsequences, upper and lower limits, cluster points, and Cauchy sequences.

== Monotone Sequences

#definition("Monotone sequence")[
  A sequence $(a_n)$ is:
  - *increasing* if $a_(n + 1) >= a_n$ for every $n in NN$;
  - *decreasing* if $a_(n + 1) <= a_n$ for every $n in NN$;
  - *strictly increasing* if $a_(n + 1) > a_n$ for every $n in NN$;
  - *strictly decreasing* if $a_(n + 1) < a_n$ for every $n in NN$.

  A sequence is *monotone* if it is increasing or decreasing.
]

The monotone sequences are the easiest sequences to understand: if they are prevented from escaping to infinity, they must converge.

#theorem("Monotone convergence theorem")[
  A monotone real sequence converges if and only if it is bounded.
]<thm:monotone-convergence>

#proof[
  Every convergent sequence is bounded by the #link(<thm:convergent-bounded>)[convergent sequences are bounded theorem].

  Conversely, suppose $(a_n)$ is increasing and bounded. Let
  $
    alpha = sup {a_n: n in NN}.
  $
  We prove $a_n -> alpha$. Let $epsilon > 0$. Since $alpha$ is the supremum, there exists $N in NN$ such that
  $
    alpha - epsilon < a_N <= alpha.
  $
  Since $(a_n)$ is increasing, every $n >= N$ satisfies
  $
    alpha - epsilon < a_N <= a_n <= alpha < alpha + epsilon.
  $
  Hence $abs(a_n - alpha) < epsilon$ for every $n >= N$, so $a_n -> alpha$.

  If $(a_n)$ is decreasing and bounded, apply the increasing case to $(-a_n)$.
]

#example[
  Define $a_1 = 2$ and
  $
    a_(n + 1) = 1 / 2 (a_n + 6).
  $
  We show that $(a_n)$ converges.

  First, $a_n < 6$ for all $n$. This is true for $n = 1$. If $a_n < 6$, then
  $
    a_(n + 1) = 1 / 2 (a_n + 6) < 1 / 2 (6 + 6) = 6.
  $
  Also,
  $
    a_(n + 1) - a_n = 1 / 2 (6 - a_n) > 0,
  $
  so $(a_n)$ is strictly increasing. It is increasing and bounded above, so it converges by the #link(<thm:monotone-convergence>)[monotone convergence theorem].
]

#definition("Limits to infinity")[
  We write $a_n -> infinity$ if for every $M > 0$ there exists $N in NN$ such that $a_n > M$ whenever $n >= N$.

  Similarly, $a_n -> -infinity$ if for every $M < 0$ there exists $N in NN$ such that $a_n < M$ whenever $n >= N$.
]

#example[
  The sequence $a_n = n^3$ satisfies $a_n -> infinity$. The sequence $b_n = -n$ satisfies $b_n -> -infinity$.
]

== Upper and Lower Limits

Even when a bounded sequence does not converge, its tails may still have a highest long-term level and a lowest long-term level.

#definition("Limit superior and limit inferior")[
  Let $(a_n)$ be a bounded real sequence. Define
  $
    x_k = sup {a_n: n >= k}, quad y_k = inf {a_n: n >= k}.
  $
  The *limit superior* and *limit inferior* of $(a_n)$ are
  $
    lim sup_(n -> infinity) a_n = lim_(k -> infinity) x_k,
    quad
    lim inf_(n -> infinity) a_n = lim_(k -> infinity) y_k.
  $
]

The sequence $(x_k)$ is decreasing: as $k$ increases, the tail loses terms, so its supremum cannot go up. Similarly, $(y_k)$ is increasing. Since $(a_n)$ is bounded, both $(x_k)$ and $(y_k)$ are bounded, so the #link(<thm:monotone-convergence>)[monotone convergence theorem] guarantees the two limits exist.

#note[
  For unbounded sequences, the same tail-supremum and tail-infimum idea is often interpreted in the extended real numbers. For example, if the tail suprema tend to $infinity$, we write $lim sup a_n = infinity$.
]

#example[
  Let
  $
    a_n = cases(-1 + 3^(-n) & "if " n " is odd", 2^(-n) & "if " n " is even").
  $
  The even terms are positive and tend to $0$; the odd terms are close to $-1$ and tend to $-1$.

  For every $k$, the largest value in the tail occurs at the first even index at least $k$, so $x_k -> 0$. Hence
  $
    lim sup_(n -> infinity) a_n = 0.
  $
  For instance,
  $
    x_2 = sup {2^(-2), -1 + 3^(-3), 2^(-4), dots} = 1 / 4
  $
  and
  $
    x_8 = sup {2^(-8), -1 + 3^(-9), 2^(-10), dots} = 1 / 256.
  $
  The smallest values in the tails come from the odd terms and approach $-1$, so
  $
    lim inf_(n -> infinity) a_n = -1.
  $
]

#example[
  Some useful quick calculations are:
  - If $a_n = (-1)^n / n$, then both even and odd tails tend to $0$, so $lim sup a_n = lim inf a_n = 0$.
  - If $a_n = (-1)^n (n^4 + 5) / n^4$, then the even terms tend to $1$ and the odd terms tend to $-1$, so $lim sup a_n = 1$ and $lim inf a_n = -1$.
  - If $a_n = (8 - n^3) / (n - 2)$ for $n >= 3$, then $a_n -> -infinity$, so the extended upper and lower limits are both $-infinity$.
]

#example[
  For $a_n = (-1)^n$, every tail contains infinitely many $1$s and infinitely many $-1$s. Therefore
  $
    lim sup_(n -> infinity) a_n = 1,
    quad
    lim inf_(n -> infinity) a_n = -1.
  $
  Since these are different, the sequence does not converge.
]

#proposition("Subadditivity of limsup")[
  If $(a_n)$ and $(b_n)$ are bounded real sequences, then
  $
    lim sup_(n -> infinity) (a_n + b_n)
      <= lim sup_(n -> infinity) a_n + lim sup_(n -> infinity) b_n.
  $
]<prop:limsup-subadditive>

#proof[
  For each $k$, set
  $
    A_k = sup {a_n: n >= k}, quad B_k = sup {b_n: n >= k},
    quad C_k = sup {a_n + b_n: n >= k}.
  $
  If $n >= k$, then $a_n <= A_k$ and $b_n <= B_k$, so
  $
    a_n + b_n <= A_k + B_k.
  $
  Taking the supremum over $n >= k$ gives $C_k <= A_k + B_k$. Now take limits as $k -> infinity$.
]

#theorem("Convergence via limsup and liminf")[
  A bounded real sequence $(a_n)$ converges to $L$ if and only if
  $
    lim sup_(n -> infinity) a_n = lim inf_(n -> infinity) a_n = L.
  $
]<thm:limsup-liminf-convergence>

#proof[
  Suppose $a_n -> L$. Let $epsilon > 0$. For all sufficiently large $n$,
  $
    L - epsilon < a_n < L + epsilon.
  $
  Hence, for all sufficiently large $k$,
  $
    L - epsilon <= y_k <= x_k <= L + epsilon.
  $
  Taking limits gives $lim inf a_n = lim sup a_n = L$.

  Conversely, suppose $lim sup a_n = lim inf a_n = L$. Let $epsilon > 0$. For all sufficiently large $k$,
  $
    L - epsilon < y_k <= a_k <= x_k < L + epsilon.
  $
  Thus $abs(a_k - L) < epsilon$ for all sufficiently large $k$, so $a_n -> L$.
]

== Subsequences

#definition("Subsequence")[
  Let $(a_n)$ be a sequence. A *subsequence* of $(a_n)$ is a sequence of the form $(a_(n_k))$, where
  $
    n_1 < n_2 < n_3 < dots
  $
  are natural numbers.
]

#diagram(caption: [
  A subsequence is formed by choosing terms whose indices continue to increase. Here the selected terms are $a_2, a_4, a_5, a_7, dots$.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      let axis = 0.75pt + black
      let vals = (1.3, 2.4, 1.8, 2.8, 2.5, 1.4, 2.1, 1.7)

      draw.line((0.2, 0.45), (6.6, 0.45), stroke: axis, mark: (end: ">"))
      for i in range(0, vals.len()) {
        let x = 0.7 + i * 0.75
        let y = vals.at(i)
        draw.line((x, 0.35), (x, 0.55), stroke: 0.55pt + black)
        draw.content((x, 0.15), text(size: 8pt)[$#(i + 1)$])
        draw.circle((x, y), radius: 0.06, fill: blue, stroke: none)
      }
      for i in (1, 3, 4, 6) {
        let x = 0.7 + i * 0.75
        let y = vals.at(i)
        draw.circle((x, y), radius: 0.10, fill: none, stroke: 1pt + green)
      }
      draw.content((6.85, 0.45), text(size: 9pt)[$n$])
    })
  ]
]

#theorem("Subsequences of convergent sequences")[
  If $a_n -> L$, then every subsequence of $(a_n)$ also converges to $L$.
]<thm:subsequence-of-convergent>

#proof[
  Let $(a_(n_k))$ be a subsequence and let $epsilon > 0$. Since $a_n -> L$, there exists $N in NN$ such that $abs(a_n - L) < epsilon$ whenever $n >= N$.

  Since $n_k >= k$, every $k >= N$ satisfies $n_k >= N$. Therefore
  $
    abs(a_(n_k) - L) < epsilon
  $
  whenever $k >= N$, so $a_(n_k) -> L$.
]

#example[
  The sequence $a_n = (-1)^n$ has two constant subsequences:
  $
    a_2, a_4, a_6, dots = 1, 1, 1, dots
  $
  and
  $
    a_1, a_3, a_5, dots = -1, -1, -1, dots.
  $
  These subsequences converge to different limits, so the original sequence cannot converge by the #link(<thm:subsequence-of-convergent>)[subsequences of convergent sequences theorem].
]

== Cluster Points

#definition("Cluster point")[
  A number $a in RR$ is a *cluster point* of a sequence $(a_n)$ if for every $epsilon > 0$, there are infinitely many indices $n in NN$ such that
  $
    abs(a_n - a) < epsilon.
  $
]

#diagram(caption: [
  A cluster point has infinitely many sequence terms in every epsilon-neighbourhood. A sequence may have more than one cluster point.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let red = rgb("#dc2626")
      let green = rgb("#65a30d")
      let axis = 0.75pt + black

      draw.line((0.2, 0.6), (7.2, 0.6), stroke: axis)
      draw.line((2.0, 0.35), (2.0, 0.85), stroke: 0.7pt + green)
      draw.line((5.2, 0.35), (5.2, 0.85), stroke: 0.7pt + green)
      draw.content((2.0, 0.15), text(size: 8.5pt)[$-1$])
      draw.content((5.2, 0.15), text(size: 8.5pt)[$1$])

      draw.line((1.35, 1.15), (2.65, 1.15), stroke: 1.4pt + green)
      draw.line((4.55, 1.15), (5.85, 1.15), stroke: 1.4pt + green)
      draw.content((2.0, 1.45), text(size: 8pt, fill: green)[$epsilon$-neighbourhood])
      draw.content((5.2, 1.45), text(size: 8pt, fill: green)[$epsilon$-neighbourhood])

      for p in ((1.75, 0.6), (1.90, 0.6), (2.10, 0.6), (2.32, 0.6), (4.85, 0.6), (5.05, 0.6), (5.25, 0.6), (5.48, 0.6)) {
        draw.circle(p, radius: 0.055, fill: blue, stroke: none)
      }
      draw.circle((3.6, 0.6), radius: 0.06, fill: red, stroke: none)
      draw.content((3.6, 0.18), text(size: 8pt, fill: red)[not a cluster point])
    })
  ]
]

#theorem("Cluster points and subsequences")[
  Let $(a_n)$ be a real sequence and let $a in RR$.
  1. $a$ is a cluster point if and only if for every $epsilon > 0$ and every $N in NN$, there exists $n >= N$ such that $abs(a_n - a) < epsilon$.
  2. $a$ is a cluster point if and only if $(a_n)$ has a subsequence converging to $a$.
]<thm:cluster-subsequence>

#proof[
  For (1), if $a$ is a cluster point, every epsilon-neighbourhood contains infinitely many terms, so at least one must occur after any prescribed index $N$. Conversely, if the stated condition holds, apply it repeatedly with larger and larger $N$ to find infinitely many terms in the epsilon-neighbourhood.

  For (2), suppose $a$ is a cluster point. Use (1) with $epsilon = 1$ and $N = 1$ to choose $n_1$. Then use $epsilon = 1 / 2$ and $N = n_1 + 1$ to choose $n_2 > n_1$. Continuing in this way gives
  $
    n_1 < n_2 < n_3 < dots
  $
  and $abs(a_(n_k) - a) < 1 / k$, so $a_(n_k) -> a$.

  Conversely, if a subsequence $a_(n_k) -> a$, then every epsilon-neighbourhood of $a$ contains all sufficiently late terms of that subsequence, and hence infinitely many terms of the original sequence.
]

#remark[
  For a bounded sequence, $lim sup a_n$ and $lim inf a_n$ are respectively the largest and smallest cluster points.
]

== Cauchy Sequences

#definition("Cauchy sequence")[
  A sequence $(a_n)$ is *Cauchy* if for every $epsilon > 0$ there exists $N in NN$ such that whenever $m, n >= N$,
  $
    abs(a_n - a_m) < epsilon.
  $
]

A convergent sequence is close to its limit. A Cauchy sequence is close to itself: far enough along the sequence, all remaining terms are close to one another.

#diagram(caption: [
  In a Cauchy sequence, the tail of the sequence eventually fits inside an interval of length $epsilon$.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let green = rgb("#65a30d")
      let axis = 0.75pt + black
      let vals = (3.2, 1.2, 2.7, 1.8, 2.25, 2.05, 2.16, 2.10, 2.13)

      draw.line((0.4, 0.45), (7.2, 0.45), stroke: axis, mark: (end: ">"))
      draw.line((4.15, 1.82), (6.9, 1.82), stroke: 1.3pt + green)
      draw.line((4.15, 2.42), (6.9, 2.42), stroke: 1.3pt + green)
      draw.content((6.95, 2.42), text(size: 8.5pt)[$L + epsilon / 2$])
      draw.content((6.95, 1.82), text(size: 8.5pt)[$L - epsilon / 2$])

      for i in range(0, vals.len()) {
        let x = 0.7 + i * 0.68
        let y = vals.at(i)
        draw.circle((x, y), radius: 0.055, fill: blue, stroke: none)
      }
      draw.line((4.05, 0.25), (4.05, 3.45), stroke: 0.65pt + luma(120))
      draw.content((4.05, 0.05), text(size: 8.5pt)[$N$])
    })
  ]
]

#theorem("Convergent sequences are Cauchy")[
  Every convergent real sequence is Cauchy.
]<thm:convergent-cauchy>

#proof[
  Suppose $a_n -> L$ and let $epsilon > 0$. Choose $N in NN$ such that
  $
    abs(a_n - L) < epsilon / 2
  $
  whenever $n >= N$. If $m, n >= N$, then
  $
    abs(a_n - a_m)
      = abs(a_n - L + L - a_m)
      <= abs(a_n - L) + abs(a_m - L)
      < epsilon.
  $
  Therefore $(a_n)$ is Cauchy.
]

#lemma("Cauchy sequences are bounded")[
  Every Cauchy real sequence is bounded.
]<lem:cauchy-bounded>

#proof[
  Apply the Cauchy definition with $epsilon = 1$. There exists $N in NN$ such that $abs(a_n - a_N) < 1$ whenever $n >= N$. Hence, for $n >= N$,
  $
    abs(a_n) <= abs(a_n - a_N) + abs(a_N) < 1 + abs(a_N).
  $
  The finitely many earlier terms are bounded, so the whole sequence is bounded.
]

#proposition("Cauchy permanence properties")[
  Let $(a_n)$ and $(b_n)$ be real sequences.
  1. Every subsequence of a Cauchy sequence is Cauchy.
  2. If $(a_n)$ and $(b_n)$ are Cauchy, then $(abs(a_n - b_n))$ is Cauchy.
]<prop:cauchy-permanence>

#proof[
  For (1), let $(a_(n_k))$ be a subsequence of a Cauchy sequence $(a_n)$. Given $epsilon > 0$, choose $N$ such that $abs(a_n - a_m) < epsilon$ whenever $m, n >= N$. If $j, k >= N$, then $n_j >= j >= N$ and $n_k >= k >= N$, so
  $
    abs(a_(n_j) - a_(n_k)) < epsilon.
  $

  For (2), use the reverse triangle inequality. Given $epsilon > 0$, choose $N_1$ such that $abs(a_n - a_m) < epsilon / 2$ whenever $m, n >= N_1$, and choose $N_2$ such that $abs(b_n - b_m) < epsilon / 2$ whenever $m, n >= N_2$. If $m, n >= max(N_1, N_2)$, then
  $
    abs(abs(a_n - b_n) - abs(a_m - b_m))
      <= abs((a_n - b_n) - (a_m - b_m))
      <= abs(a_n - a_m) + abs(b_n - b_m)
      < epsilon.
  $
]

#example[
  The following classifications are typical checks.

  #align(center)[
    #table(
      columns: (auto, auto, auto, auto),
      inset: 5pt,
      stroke: 0.35pt + luma(170),
      align: (left, center, center, center),
      table.header[*Sequence*][*Cauchy?*][*Monotone?*][*Bounded?*],
      [$1 / (2n + 1)$], [yes, $-> 0$], [strictly decreasing], [yes],
      [$(n^2 + 1) / n = n + 1 / n$], [no], [strictly increasing], [below only],
      [$(n - 2) / (3n + 4)$], [yes, $-> 1 / 3$], [strictly increasing], [yes],
      [$(2n + 1) / n = 2 + 1 / n$], [yes, $-> 2$], [strictly decreasing], [yes],
      [$(-1)^n n$], [no], [no], [no],
    )
  ]
]

== Monotone Subsequences and Bolzano-Weierstrass

#definition("Peak point")[
  An index $k in NN$ is a *peak point* of a sequence $(a_n)$ if
  $
    a_k > a_n
  $
  for every $n > k$.
]

#diagram(caption: [
  Peak points are terms larger than every later term.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let blue = rgb("#2563eb")
      let red = rgb("#dc2626")
      let vals = (1.2, 2.9, 1.7, 2.4, 1.5, 2.0, 1.6, 1.2)
      for i in range(0, vals.len() - 1) {
        let p = (0.8 + i * 0.7, vals.at(i))
        let q = (0.8 + (i + 1) * 0.7, vals.at(i + 1))
        draw.line(p, q, stroke: 0.75pt + black)
      }
      for i in range(0, vals.len()) {
        let p = (0.8 + i * 0.7, vals.at(i))
        draw.circle(p, radius: 0.06, fill: blue, stroke: none)
      }
      for i in (1, 3, 5) {
        let p = (0.8 + i * 0.7, vals.at(i))
        draw.circle(p, radius: 0.10, fill: none, stroke: 1pt + red)
      }
    })
  ]
]

#theorem("Every sequence has a monotone subsequence")[
  Every real sequence has a monotone subsequence.
]<thm:monotone-subsequence>

#proof[
  Let $(a_n)$ be a real sequence.

  If there are infinitely many peak points, list them as
  $
    n_1 < n_2 < n_3 < dots.
  $
  Since each $n_k$ is a peak point and $n_(k + 1) > n_k$, we have
  $
    a_(n_1) > a_(n_2) > a_(n_3) > dots,
  $
  so these terms form a decreasing subsequence.

  If there are only finitely many peak points, choose $n_1$ after the last peak point. Since $n_1$ is not a peak point, there exists $n_2 > n_1$ such that $a_(n_2) >= a_(n_1)$. Since $n_2$ is also not a peak point, there exists $n_3 > n_2$ such that $a_(n_3) >= a_(n_2)$. Continuing gives an increasing subsequence.
]

#theorem("Bolzano-Weierstrass theorem")[
  Every bounded real sequence has a convergent subsequence.
]<thm:bolzano-weierstrass>

#proof[
  By the #link(<thm:monotone-subsequence>)[monotone subsequence theorem], every sequence has a monotone subsequence. If the original sequence is bounded, then every subsequence is bounded. Hence the monotone subsequence is bounded, so it converges by the #link(<thm:monotone-convergence>)[monotone convergence theorem].
]

#theorem("Cauchy criterion for real sequences")[
  A real sequence converges if and only if it is Cauchy.
]<thm:cauchy-criterion>

#proof[
  The forward direction is the #link(<thm:convergent-cauchy>)[convergent sequences are Cauchy theorem].

  Conversely, suppose $(a_n)$ is Cauchy. By the #link(<lem:cauchy-bounded>)[Cauchy sequences are bounded lemma], $(a_n)$ is bounded. By the #link(<thm:bolzano-weierstrass>)[Bolzano-Weierstrass theorem], it has a convergent subsequence $(a_(n_k))$, say $a_(n_k) -> L$.

  We prove $a_n -> L$. Let $epsilon > 0$. Since $(a_n)$ is Cauchy, there exists $N_1$ such that
  $
    abs(a_n - a_m) < epsilon / 2
  $
  whenever $m, n >= N_1$. Since $a_(n_k) -> L$, there exists $K$ such that
  $
    abs(a_(n_k) - L) < epsilon / 2
  $
  whenever $k >= K$.

  Choose $k >= K$ such that $n_k >= N_1$. Then for every $n >= N_1$,
  $
    abs(a_n - L)
      <= abs(a_n - a_(n_k)) + abs(a_(n_k) - L)
      < epsilon.
  $
  Hence $a_n -> L$.
]

#example[
  The sequence $a_n = (-1)^n$ is bounded but not Cauchy. Taking $epsilon = 1$, no matter how far along the sequence we go, there are later even and odd indices $m, n$ with
  $
    abs(a_n - a_m) = 2.
  $
  Thus boundedness alone is not enough for the Cauchy property.
]
