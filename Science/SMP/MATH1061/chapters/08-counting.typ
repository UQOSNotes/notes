#import "/lib.typ": *

= Counting and Probability

Counting is concerned with determining the number of ways objects can be arranged, selected, or distributed. Rather than listing every possibility, systematic principles allow the total count to be computed directly. This chapter develops the core tools of combinatorics: the addition and multiplication principles, permutations, combinations, selections with repetition, and the binomial theorem. It then introduces the foundations of probability, the inclusion-exclusion principle, and the pigeonhole principle.

In this chapter we study:
- *Introduction to counting:* the addition and multiplication principles, permutations, and combinations
- *Counting selections:* selections with repetition and arrangements with repeated elements
- *Probability:* sample spaces, events, and basic probability rules
- *Binomial coefficients:* Pascal's triangle and the Binomial Theorem
- *Inclusion-exclusion:* counting unions of overlapping sets
- *The Pigeonhole Principle:* a deceptively simple result with powerful consequences

== Introduction to Counting

The goal of combinatorics is to count the elements of a finite set without listing them all. The two most fundamental tools are the addition principle and the multiplication principle, from which all other counting methods are built.

=== The Addition and Multiplication Principles

#theorem("Addition Principle")[
  If $A$ and $B$ are disjoint finite sets, then $|A union B| = |A| + |B|$.

  More generally, if $A_1, A_2, dots, A_k$ are pairwise disjoint finite sets, then
  $ |A_1 union A_2 union dots union A_k| = |A_1| + |A_2| + dots + |A_k|. $
]

#remark[
  The addition principle applies when a task can be performed in one of several mutually exclusive ways: the total number of ways equals the sum of the counts for each case.
]

#theorem("Multiplication Principle")[
  If a procedure consists of $k$ sequential steps, where step $i$ can be performed in $n_i$ ways regardless of how earlier steps were performed, then the total number of ways to perform the procedure is
  $ n_1 times n_2 times dots.c times n_k. $

  Equivalently, if $A_1, A_2, dots, A_k$ are finite sets, then $|A_1 times A_2 times dots.c times A_k| = |A_1| times |A_2| times dots.c times |A_k|$.
]

#example[
  A student ID number consists of two uppercase letters followed by four digits. How many distinct ID numbers are possible?

  There are $26$ choices for each letter and $10$ choices for each digit. By the multiplication principle:
  $ 26 times 26 times 10 times 10 times 10 times 10 = 26^2 times 10^4 = 6{,}760{,}000. $
]

#example[
  How many integers between 1 and 100 (inclusive) are divisible by 3 or by 5?

  Let $A$ = multiples of 3 in $[1, 100]$ and $B$ = multiples of 5 in $[1, 100]$. Then $|A| = floor(100/3) = 33$ and $|B| = floor(100/5) = 20$. Since $A$ and $B$ are not disjoint (e.g., 15 belongs to both), we must use inclusion-exclusion (see Section 7.5). But the addition principle alone does not apply here.
]

=== Permutations

#definition[
  A *permutation* of a set of objects is an ordered arrangement of those objects. The number of permutations of $n$ distinct objects is
  $ n! = n times (n-1) times (n-2) times dots.c times 2 times 1. $
  By convention, $0! = 1$.
]

#definition[
  A *permutation of $n$ objects taken $r$ at a time* is an ordered selection of $r$ objects from $n$ distinct objects, without repetition. The number of such permutations is denoted $P(n, r)$:
  $ P(n, r) = n(n-1)(n-2) dots.c (n-r+1) = n! / (n-r)!. $
]

#proof[
  By the multiplication principle: there are $n$ choices for the first position, $n-1$ for the second, and so on down to $n-r+1$ for the $r$th position. The product telescopes to $n!/(n-r)!$ upon multiplying numerator and denominator by $(n-r)!$.
]

#example[
  In how many ways can a president, vice-president, and treasurer be chosen from a club of 15 members?

  The three positions are distinct and no member can hold two, so the answer is
  $ P(15, 3) = 15 times 14 times 13 = 2730. $
]

#example[
  How many four-letter strings can be formed from the letters $\{a, b, c, d, e, f\}$ with no letter repeated?
  $ P(6, 4) = 6 times 5 times 4 times 3 = 360. $
]

=== Combinations

#definition[
  A *combination of $n$ objects taken $r$ at a time* is an unordered selection of $r$ objects from $n$ distinct objects. The number of such combinations is the *binomial coefficient*
  $ binom(n, r) = n! / (r!(n-r)!) $
  for $0 <= r <= n$. We define $binom(n, r) = 0$ if $r > n$ or $r < 0$.
]

#proof[
  Each combination of $r$ objects can be arranged in $r!$ ways (permutations of those $r$ objects). Since every ordered arrangement arises from exactly one combination, $binom(n, r) times r! = P(n, r)$. Solving gives $binom(n, r) = P(n,r)/r! = n!/(r!(n-r)!)$.
]

#example[
  How many 5-card hands can be dealt from a standard 52-card deck?
  $
    binom(52, 5) = 52! / (5! times 47!) = (52 times 51 times 50 times 49 times 48) / (5 times 4 times 3 times 2 times 1) = 2{,}598{,}960.
  $
]

#example[
  A committee of 4 is to be chosen from 10 people. How many committees contain at least one specific person $p$?

  *Method:* Total committees minus those containing no specific person:
  $ binom(10, 4) - binom(9, 4) = 210 - 126 = 84. $

  Alternatively: committees containing $p$ require choosing 3 more from the remaining 9: $binom(9, 3) = 84$. ✓
]

The following properties follow directly from the definition.

#theorem[
  For integers $0 <= r <= n$:
  1. $binom(n, 0) = binom(n, n) = 1$
  2. $binom(n, 1) = binom(n, n-1) = n$
  3. $binom(n, r) = binom(n, n-r)$ *(symmetry)*
  4. $binom(n, r) = binom(n-1, r-1) + binom(n-1, r)$ *(Pascal's identity)*
]

#proof[
  Properties (1)–(3) follow by direct substitution into the formula.

  *(4) Combinatorial proof of Pascal's identity:* Consider a set $S$ of $n$ objects and fix one element $x in S$. Every $r$-element subset of $S$ either contains $x$ or does not.
  - Subsets *containing* $x$: choose the remaining $r - 1$ from the $n - 1$ objects other than $x$: $binom(n-1, r-1)$ subsets.
  - Subsets *not containing* $x$: choose all $r$ from the $n-1$ objects other than $x$: $binom(n-1, r)$ subsets.
  Since these cases partition all $r$-subsets of $S$, the total is $binom(n-1, r-1) + binom(n-1, r)$.
]

== Counting Selections

Not every counting problem involves distinct objects or no repetition. This section considers selections where elements may be repeated, and arrangements of objects that are not all distinct.

=== Selections with Repetition

#theorem[
  The number of ways to select $r$ objects from $n$ distinct types, where repetition is allowed and order does not matter, is
  $ binom(n + r - 1, r). $
]

#proof[
  *Stars and bars:* represent a selection as a sequence of $r$ stars (objects) divided into $n$ groups (types) by $n - 1$ bars. The total length of the sequence is $r + (n - 1)$; choosing which $r$ positions are stars determines the selection. Hence the count is $binom(r + n - 1, r)$.
]

#example[
  How many ways can 10 identical chocolates be distributed among 4 children (where some children may receive none)?

  Here $r = 10$ chocolates are selected from $n = 4$ types (one per child) with repetition allowed:
  $ binom(10 + 4 - 1, 10) = binom(13, 10) = binom(13, 3) = 286. $
]

#example[
  How many solutions in non-negative integers does $x_1 + x_2 + x_3 = 12$ have?

  Each solution assigns 12 to three "types" (variables) with repetition: $binom(12 + 3 - 1, 12) = binom(14, 12) = binom(14, 2) = 91$.
]

#remark[
  If repetition is allowed and *order matters*, the number of $r$-length sequences from $n$ types is simply $n^r$ (by the multiplication principle: $n$ choices at each of $r$ positions).
]

=== Arrangements with Repeated Elements

#theorem[
  The number of distinct arrangements of $n$ objects in which object type $i$ appears $n_i$ times, where $n_1 + n_2 + dots + n_k = n$, is the *multinomial coefficient*
  $ n! / (n_1! n_2! dots.c n_k!). $
]

#proof[
  There are $n!$ arrangements of all $n$ objects if they were all distinct. Since objects within type $i$ are identical, we divide by $n_i!$ for each type to remove the over-counting. This gives $n! / (n_1! n_2! dots.c n_k!)$.
]

#example[
  How many distinct arrangements are there of the letters in MISSISSIPPI?

  The letters are: M (once), I (4 times), S (4 times), P (twice). Total letters: $n = 11$.
  $ 11! / (1! times 4! times 4! times 2!) = 39916800 / (1 times 24 times 24 times 2) = 34650. $
]

#example[
  How many arrangements of AABBBC are there?
  $ 6! / (2! times 3! times 1!) = 720 / (2 times 6 times 1) = 60. $
]

== Introduction to Probability

Probability provides a mathematical framework for quantifying uncertainty and analysing the outcomes of random experiments.

=== Sample Spaces and Events

#definition[
  A *random experiment* is a procedure whose outcome cannot be predicted with certainty.

  The *sample space* $S$ of an experiment is the set of all possible outcomes.

  An *event* $E$ is any subset of the sample space. The *complement* of $E$, written $E^c$, is the set of all outcomes not in $E$. Events $E$ and $F$ are *mutually exclusive* if $E inter F = emptyset$.
]

#example[
  *Rolling a fair six-sided die:* The sample space is $S = {1, 2, 3, 4, 5, 6}$. The event "rolling an even number" is $E = {2, 4, 6}$, with complement $E^c = {1, 3, 5}$.
]

#example[
  *Flipping two fair coins:* The sample space is $S = {H H, H T, T H, T T}$. The event "at least one head" is $E = {H H, H T, T H}$.
]

=== Basic Probability Rules

#definition[
  For a finite *uniform sample space* (all outcomes equally likely), the *probability* of an event $E$ is
  $ P(E) = |E| / |S|. $
]

#theorem("Probability Axioms (Kolmogorov)")[
  A probability function $P$ on a sample space $S$ satisfies:
  1. $P(E) >= 0$ for every event $E$
  2. $P(S) = 1$
  3. If $E_1, E_2, dots$ are pairwise mutually exclusive events, then
  $ P(E_1 union E_2 union dots) = P(E_1) + P(E_2) + dots $
]

The following rules are consequences of the axioms.

#theorem[
  For any events $E$ and $F$ in a sample space $S$:
  1. *Complement rule:* $P(E^c) = 1 - P(E)$
  2. *Inclusion-exclusion:* $P(E union F) = P(E) + P(F) - P(E inter F)$
  3. *Monotonicity:* If $E subset.eq F$, then $P(E) <= P(F)$
]

#proof[
  *(1)* Since $E$ and $E^c$ are mutually exclusive and $E union E^c = S$, axioms (2) and (3) give $P(E) + P(E^c) = 1$.

  *(2)* Write $E union F = E union (F without E)$, where $E$ and $F without E$ are mutually exclusive. By axiom (3), $P(E union F) = P(E) + P(F without E)$. Since $F = (E inter F) union (F without E)$, similarly $P(F) = P(E inter F) + P(F without E)$. Rearranging gives $P(F without E) = P(F) - P(E inter F)$, and substituting yields the result.

  *(3)* Write $F = E union (F without E)$ with the two sets disjoint. Then $P(F) = P(E) + P(F without E) >= P(E)$.
]

#definition[
  The *conditional probability* of $E$ given $F$, written $P(E | F)$, is defined for $P(F) > 0$ by
  $ P(E | F) = P(E inter F) / P(F). $

  Events $E$ and $F$ are *independent* if $P(E inter F) = P(E) P(F)$, or equivalently (when $P(F) > 0$) if $P(E | F) = P(E)$.
]

#example[
  A card is drawn at random from a standard 52-card deck. Given that the card is a heart, what is the probability it is a face card?

  Let $E$ = face card and $F$ = heart. Then $|E inter F| = 3$ (J, Q, K of hearts) and $|F| = 13$:
  $ P(E | F) = P(E inter F) / P(F) = (3/52) / (13/52) = 3/13. $
]

== Binomial Coefficients

The binomial coefficients $binom(n, r)$ arise naturally in expanding powers of sums, and their properties are captured elegantly by Pascal's triangle and the Binomial Theorem.

=== Pascal's Triangle

Pascal's triangle is an infinite triangular array in which the entry in row $n$ and position $k$ (counting from $n = 0$, $k = 0$) is $binom(n, k)$:

#align(center)[
  #table(
    columns: 9,
    align: center,
    stroke: none,
    inset: 6pt,
    [], [], [], [], [1], [], [], [], [],
    [], [], [], [1], [], [1], [], [], [],
    [], [], [1], [], [2], [], [1], [], [],
    [], [1], [], [3], [], [3], [], [1], [],
    [1], [], [4], [], [6], [], [4], [], [1],
  )
]

Each interior entry equals the sum of the two entries directly above it (Pascal's identity: $binom(n-1, k-1) + binom(n-1, k) = binom(n, k)$). The edges are all 1s ($binom(n, 0) = binom(n, n) = 1$).

#note[
  The sum of row $n$ is $sum_(k=0)^n binom(n, k) = 2^n$, which counts the total number of subsets of an $n$-element set.
]

=== The Binomial Theorem

#theorem("Binomial Theorem")[
  For any real numbers $a$ and $b$ and any non-negative integer $n$,
  $ (a + b)^n = sum_(k=0)^n binom(n, k) a^(n-k) b^k. $
]

#proof[
  Expand $(a + b)^n = (a + b)(a + b) dots.c (a+b)$ ($n$ factors). Each term in the expansion is obtained by choosing $b$ from $k$ of the $n$ factors and $a$ from the remaining $n - k$. The number of ways to choose which $k$ factors contribute $b$ is $binom(n, k)$. Summing over $k = 0, 1, dots, n$ gives the result.
]

#example[
  $(x + y)^4 = binom(4, 0) x^4 + binom(4, 1) x^3 y + binom(4, 2) x^2 y^2 + binom(4, 3) x y^3 + binom(4, 4) y^4 = x^4 + 4x^3 y + 6 x^2 y^2 + 4 x y^3 + y^4.$
]

#theorem[
  The following identities follow from the Binomial Theorem.
  1. Setting $a = b = 1$: $display(sum_(k=0)^n binom(n, k) = 2^n)$
  2. Setting $a = 1$, $b = -1$: $display(sum_(k=0)^n (-1)^k binom(n, k) = 0)$
  3. Setting $a = 1$, $b = 1$ and differentiating: $display(sum_(k=0)^n k binom(n, k) = n 2^(n-1))$
]

#example[
  What is the coefficient of $x^3 y^7$ in $(2x - y)^(10)$?

  Using the Binomial Theorem with $a = 2x$ and $b = -y$:
  $ binom(10, 7)(2x)^3(-y)^7 = binom(10, 7) dot 8 x^3 dot (-1)^7 y^7 = 120 times 8 times (-1) x^3 y^7 = -960 x^3 y^7. $
  The coefficient is $-960$.
]

== Inclusion and Exclusion

The inclusion-exclusion principle extends the addition rule to sets that are not necessarily disjoint, by carefully accounting for elements counted multiple times.

=== The Inclusion-Exclusion Principle for Two Sets

#theorem[
  For any two finite sets $A$ and $B$,
  $ |A union B| = |A| + |B| - |A inter B|. $
]

#proof[
  Every element of $A union B$ is in $A$, in $B$, or both. When we compute $|A| + |B|$, elements in $A inter B$ are counted twice. Subtracting $|A inter B|$ corrects the count to exactly once per element.
]

#example[
  How many integers from 1 to 100 are divisible by 3 or by 5?

  Let $A$ = multiples of 3 in $[1,100]$ and $B$ = multiples of 5 in $[1,100]$. Then $|A| = 33$, $|B| = 20$, and $|A inter B|$ = multiples of 15 in $[1,100]$ = 6. By inclusion-exclusion:
  $ |A union B| = 33 + 20 - 6 = 47. $
]

=== The General Inclusion-Exclusion Principle

#theorem("Inclusion-Exclusion Principle")[
  For finite sets $A_1, A_2, dots, A_n$,
  $
    |A_1 union dots union A_n| &= sum_(i) |A_i| - sum_(i < j) |A_i inter A_j| \
                                  &quad + sum_(i < j < k) |A_i inter A_j inter A_k| - dots \
                                  &quad + (-1)^(n+1) |A_1 inter A_2 inter dots inter A_n|.
  $

  In summation notation:
  $ |A_1 union dots union A_n| = sum_(emptyset != S subset.eq {1,dots,n}) (-1)^(|S|+1) |inter.big_(i in S) A_i|. $
]

#example[
  Three sets $A$, $B$, $C$ with $|A| = 10$, $|B| = 8$, $|C| = 6$, $|A inter B| = 4$, $|A inter C| = 3$, $|B inter C| = 2$, $|A inter B inter C| = 1$. Then:
  $ |A union B union C| = 10 + 8 + 6 - 4 - 3 - 2 + 1 = 16. $
]

=== Applications to Counting

#definition[
  A *derangement* of $\{1, 2, dots, n\}$ is a permutation $sigma$ such that $sigma(i) != i$ for all $i$; that is, no element occupies its original position. The number of derangements of $n$ elements is denoted $D_n$.
]

#theorem[
  $ D_n = n! sum_(k=0)^n (-1)^k / k! = n! lr((1 - 1/1! + 1/2! - 1/3! + dots + (-1)^n / n!)). $

  As $n -> infinity$, $D_n / n! -> 1/e approx 0.3679$, so approximately $36.8%$ of all permutations of a large set are derangements.
]

#proof[
  Let $A_i$ be the set of permutations that fix $i$ (i.e., $sigma(i) = i$). Then $|A_i| = (n-1)!$, $|A_i inter A_j| = (n-2)!$, and more generally $|A_{i_1} inter dots inter A_{i_k}| = (n-k)!$. There are $binom(n, k)$ choices of $k$ indices. By inclusion-exclusion, the number of permutations fixing at least one element is:
  $ sum_(k=1)^n (-1)^(k+1) binom(n, k)(n-k)! = sum_(k=1)^n (-1)^(k+1) n!/k!. $
  Subtracting from $n!$ gives $D_n = n! sum_(k=0)^n (-1)^k / k!$.
]

#example[
  $D_3 = 3!(1 - 1 + 1/2 - 1/6) = 6 times 1/3 = 2$. The two derangements of $\{1,2,3\}$ are $(2,3,1)$ and $(3,1,2)$.
]

== The Pigeonhole Principle

The Pigeonhole Principle is a simple combinatorial observation with far-reaching consequences in mathematics and computer science.

=== Statement and Basic Applications

#theorem("Pigeonhole Principle")[
  If $n + 1$ or more objects are distributed among $n$ boxes, then at least one box contains two or more objects.
]

#proof[
  Suppose, for the sake of contradiction, that every box contains at most one object. Then the total number of objects is at most $n$, contradicting the assumption that there are $n + 1$ or more.
]

#example[
  In any group of 13 or more people, at least two were born in the same month. (12 months are the "boxes"; the people are the "objects".)
]

#example[
  Among any 5 integers, at least two have the same remainder when divided by 4. (The four possible remainders $\{0, 1, 2, 3\}$ are the boxes.)
]

#example[
  Let $S$ be any set of 10 integers. Show that two distinct non-empty subsets of $S$ have the same sum.

  $S$ has $2^{10} - 1 = 1023$ non-empty subsets. Each subset sum lies between 1 and at most $10 times max(S)$. When $S subset.eq \{1, dots, 55\}$, for example, each sum is at most 550, but there are 1023 subsets — far fewer "boxes" than "objects".
]

=== The Generalised Pigeonhole Principle

#theorem("Generalised Pigeonhole Principle")[
  If $n$ objects are distributed among $k$ boxes, then at least one box contains at least $ceil(n \/ k)$ objects.
]

#proof[
  Suppose every box contains at most $ceil(n\/k) - 1$ objects. Since $ceil(n\/k) - 1 < n\/k$, the total number of objects is less than $k times (n\/k) = n$, a contradiction.
]

#example[
  In a group of 85 people, at least $ceil(85\/12) = ceil(7.08dots) = 8$ share a birth month.
]

#example[
  Show that among any 11 integers, two have the same last digit.

  The last digit (units digit) is one of $\{0, 1, dots, 9\}$ — ten possible values. By the Pigeonhole Principle, at least $ceil(11\/10) = 2$ of the integers share a last digit.
]

#remark[
  The Pigeonhole Principle can also be applied in continuous settings. For example, among any five points placed inside a unit square, two must lie within distance $sqrt(2)/2$ of each other (divide the square into four smaller squares of side $1/2$; by the Pigeonhole Principle, two points share a sub-square, and the diagonal of that sub-square has length $sqrt(2)/2$).
]
