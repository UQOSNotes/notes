#import "/lib.typ": *

= Sets and Functions

Set theory provides the language in which virtually all of mathematics is expressed. A set is simply a collection of objects, and the operations on sets mirror the logical connectives we studied in Chapter 1. Functions formalise the idea of a rule that assigns each input exactly one output. Together, sets and functions are foundational to every branch of mathematics.

== Set Theory Definitions

=== Sets and Elements

#definition[
  A *set* is an unordered collection of distinct objects called *elements* (or *members*).

  We write $x in A$ to mean "$x$ is an element of $A$", and $x in.not A$ to mean "$x$ is not an element of $A$".
]

Sets are typically denoted by capital letters $A, B, C, \ldots$ and elements by lowercase letters $a, b, c, \ldots$

#definition[
  Two sets $A$ and $B$ are *equal*, written $A = B$, if and only if they have exactly the same elements:
  $ A = B arrow.l.r forall x, (x in A arrow.l.r x in B) $
]

#example[
  - $A = \{1, 2, 3\}$ and $B = \{3, 1, 2\}$ are equal (order does not matter)
  - $C = \{1, 2, 2, 3\}$ and $A$ are equal (repetition does not matter)
  - The *empty set* $emptyset = \{\}$ contains no elements
]

=== Set-Builder Notation

#definition[
  *Set-builder notation* defines a set by a property its elements must satisfy:
  $ {x in D mid P(x)} $
  read as "the set of all $x$ in $D$ such that $P(x)$".
]

#example[
  - $\{x in ZZ mid x > 0\} = \{1, 2, 3, 4, \ldots\}$; positive integers
  - $\{x in RR mid x^2 < 4\} = (-2, 2)$; real numbers between $-2$ and $2$
  - $\{n in ZZ mid 2 divides n\} = \{\ldots, -4, -2, 0, 2, 4, \ldots\}$; even integers
]

=== Common Sets of Numbers

The following sets of numbers are standard throughout mathematics:

#table(
  columns: (auto, auto, auto),
  align: (center, left, left),
  inset: 10pt,
  [*Symbol*], [*Name*], [*Description*],
  [$NN$], [Natural numbers], [$\{0, 1, 2, 3, \ldots\}$ (sometimes $\{1, 2, 3, \ldots\}$)],
  [$ZZ$], [Integers], [$\{\ldots, -2, -1, 0, 1, 2, \ldots\}$],
  [$QQ$], [Rational numbers], [$\{a/b mid a, b in ZZ, b != 0\}$],
  [$RR$], [Real numbers], [All points on the number line],
  [$CC$], [Complex numbers], [$\{a + b i mid a, b in RR\}$],
)

Note the containment chain: $NN subset ZZ subset QQ subset RR subset CC$.

=== Subsets and Power Sets

#definition[
  $A$ is a *subset* of $B$, written $A subset.eq B$, if every element of $A$ is also an element of $B$:
  $ A subset.eq B arrow.l.r forall x, (x in A arrow.r x in B) $

  $A$ is a *proper subset* of $B$, written $A subset B$, if $A subset.eq B$ and $A != B$.
]

#example[
  - $\{1, 3\} subset.eq \{1, 2, 3\}$ (subset)
  - $\{1, 3\} subset \{1, 2, 3\}$ (proper subset)
  - $emptyset subset.eq A$ for every set $A$
  - $A subset.eq A$ for every set $A$ (a set is a subset of itself)
]

#important[
  To prove $A subset.eq B$: let $x$ be an arbitrary element of $A$ and show $x in B$.

  To prove $A = B$: prove $A subset.eq B$ and $B subset.eq A$.
]

#definition[
  The *power set* of $A$, denoted $cal(P)(A)$, is the set of all subsets of $A$:
  $ cal(P)(A) = {S mid S subset.eq A} $
]

#example[
  If $A = \{1, 2, 3\}$, then:
  $ cal(P)(A) = \{emptyset, \{1\}, \{2\}, \{3\}, \{1,2\}, \{1,3\}, \{2,3\}, \{1,2,3\}\} $
]

#theorem[
  If $|A| = n$ (i.e., $A$ has $n$ elements), then $|cal(P)(A)| = 2^n$.
]

== Properties of Sets

=== Set Operations

#definition[
  Let $A$ and $B$ be subsets of a *universal set* $U$.

  - *Union:* $A union B = \{x in U mid x in A "or" x in B\}$
  - *Intersection:* $A inter B = \{x in U mid x in A "and" x in B\}$
  - *Difference:* $A without B = \{x in U mid x in A "and" x in.not B\}$
  - *Complement:* $A^c = \{x in U mid x in.not A\}$
]

#example[
  Let $U = \{1,2,3,4,5,6,7,8\}$, $A = \{1,2,3,4\}$, $B = \{3,4,5,6\}$.
  - $A union B = \{1,2,3,4,5,6\}$
  - $A inter B = \{3,4\}$
  - $A without B = \{1,2\}$
  - $A^c = \{5,6,7,8\}$
]

#definition[
  Sets $A$ and $B$ are *disjoint* if $A inter B = emptyset$.
]

=== Venn Diagrams

Venn diagrams represent sets as overlapping regions within a rectangle (the universal set). They are useful for visualising set relationships and verifying set identities.

#note[
  For two sets $A$ and $B$, a Venn diagram has four regions:
  - Inside $A$ only: $A without B$
  - Inside $B$ only: $B without A$
  - Inside both: $A inter B$
  - Outside both: $(A union B)^c$
]

=== Laws of Set Algebra

The laws of set algebra closely parallel the laws of logical equivalence from Chapter 1. This is not a coincidence; the correspondence is:

#table(
  columns: (auto, auto),
  align: (left, left),
  inset: 10pt,
  [*Logic*], [*Set Theory*],
  [$or$ (disjunction)], [$union$ (union)],
  [$and$ (conjunction)], [$inter$ (intersection)],
  [$not$ (negation)], [complement],
  [T (tautology)], [$U$ (universal set)],
  [F (contradiction)], [$emptyset$ (empty set)],
)

#table(
  columns: (auto, auto),
  align: (left, left),
  inset: 10pt,
  [*Law*], [*Identity*],
  [De Morgan's Laws],
  $(A union B)^c = A^c inter B^c$,
  [],
  $(A inter B)^c = A^c union B^c$,
  [Commutative Laws],
  [$A union B = B union A$ #h(1em) and #h(1em) $A inter B = B inter A$],
  [Associative Laws],
  $A union (B union C) = (A union B) union C$,
  [],
  $A inter (B inter C) = (A inter B) inter C$,
  [Distributive Laws],
  $A union (B inter C) = (A union B) inter (A union C)$,
  [],
  $A inter (B union C) = (A inter B) union (A inter C)$,
  [Identity Laws],
  [$A union emptyset = A$ #h(1em) and #h(1em) $A inter U = A$],
  [Complement Laws],
  [$A union A^c = U$ #h(1em) and #h(1em) $A inter A^c = emptyset$],
  [Double Complement],
  $(A^c)^c = A$,
  [Idempotent Laws],
  [$A union A = A$ #h(1em) and #h(1em) $A inter A = A$],
)

#example[
  *Prove:* $(A without B) union (B without A) = (A union B) without (A inter B)$.

  Both sides equal the set of elements in exactly one of $A$ or $B$ (the symmetric difference). We can verify using membership tables or by showing set containment in both directions.
]

=== Cartesian Products

#definition[
  The *ordered pair* $(a, b)$ is distinct from $(c, d)$ unless $a = c$ and $b = d$.

  The *Cartesian product* of sets $A$ and $B$ is:
  $ A times B = \{(a, b) mid a in A "and" b in B\} $
]

#example[
  If $A = \{1, 2\}$ and $B = \{x, y, z\}$:
  $ A times B = \{(1,x), (1,y), (1,z), (2,x), (2,y), (2,z)\} $

  Note $|A times B| = |A| dot |B| = 2 times 3 = 6$.
]

#remark[
  The Cartesian product $RR times RR = RR^2$ is the familiar $x y$-plane. More generally, $RR^n$ is $n$-dimensional Euclidean space.
]

== Functions Defined on General Sets

=== Definition and Notation

#definition[
  A *function* $f$ from a set $A$ to a set $B$, written $f: A -> B$, is a rule that assigns to each element $x in A$ exactly one element $f(x) in B$.

  - $A$ is the *domain* of $f$
  - $B$ is the *codomain* of $f$
  - $f(x)$ is the *image* of $x$ under $f$
  - The *range* (or *image*) of $f$ is $\{f(x) mid x in A\} subset.eq B$
]

#important[
  A function must be:
  - *Well-defined:* every element of the domain has an image
  - *Single-valued:* each element of the domain has exactly one image

  A relation that assigns multiple outputs to one input is not a function.
]

#example[
  - $f: RR -> RR$ defined by $f(x) = x^2$ is a function (domain $RR$, codomain $RR$, range $[0, infinity)$)
  - $g: ZZ -> ZZ$ defined by $g(n) = 2n + 1$ is a function
  - The relation $h(x) = plus.minus sqrt(x)$ on $RR$ is *not* a function (two outputs for $x > 0$)
]

=== Image and Preimage

#definition[
  Let $f: A -> B$.

  - The *image of a set $S subset.eq A$* under $f$ is $f(S) = \{f(x) mid x in S\}$
  - The *preimage* (or *inverse image*) of a set $T subset.eq B$ is $f^(-1)(T) = \{x in A mid f(x) in T\}$
]

#example[
  Let $f: RR -> RR$ be defined by $f(x) = x^2$.
  - $f(\{-2, -1, 0, 1, 2\}) = \{0, 1, 4\}$
  - $f^(-1)(\{4\}) = \{-2, 2\}$
  - $f^(-1)([-1, 4]) = [-2, 2]$
  - $f^(-1)(\{-1\}) = emptyset$ (no real number squares to $-1$)
]

== One-to-One, Onto, and Inverse Functions

=== Injective Functions

#definition[
  A function $f: A -> B$ is *injective* (or *one-to-one*) if no two distinct elements of $A$ map to the same element of $B$:
  $ forall x_1, x_2 in A, quad f(x_1) = f(x_2) arrow.r x_1 = x_2 $
  Equivalently (by contrapositive): $x_1 != x_2 arrow.r f(x_1) != f(x_2)$.
]

#example[
  - $f: RR -> RR$, $f(x) = 3x + 2$ is injective. (If $3x_1 + 2 = 3x_2 + 2$ then $x_1 = x_2$.)
  - $g: RR -> RR$, $g(x) = x^2$ is *not* injective. ($g(-1) = g(1) = 1$ but $-1 != 1$.)
  - $h: ZZ -> ZZ$, $h(n) = 2n$ is injective. (If $2n_1 = 2n_2$ then $n_1 = n_2$.)
]

#note[
  To *prove* $f$ is injective: assume $f(x_1) = f(x_2)$ and derive $x_1 = x_2$.

  To *disprove* injectivity: find $x_1 != x_2$ with $f(x_1) = f(x_2)$.
]

=== Surjective Functions

#definition[
  A function $f: A -> B$ is *surjective* (or *onto*) if every element of $B$ is the image of at least one element of $A$:
  $ forall y in B, exists x in A "such that" f(x) = y $
  Equivalently, the range of $f$ equals the codomain: $f(A) = B$.
]

#example[
  - $f: RR -> RR$, $f(x) = 3x + 2$ is surjective. (Given $y in RR$, take $x = (y-2)/3$.)
  - $g: RR -> RR$, $g(x) = x^2$ is *not* surjective. (No $x in RR$ satisfies $x^2 = -1$.)
  - $h: ZZ -> ZZ$, $h(n) = 2n$ is *not* surjective. (The odd integer 1 has no preimage.)
  - $h: ZZ -> \{"even integers"\}$, $h(n) = 2n$ *is* surjective (with restricted codomain).
]

#note[
  To *prove* $f$ is surjective: given an arbitrary $y in B$, construct $x in A$ with $f(x) = y$.

  To *disprove* surjectivity: exhibit $y in B$ with no $x in A$ satisfying $f(x) = y$.
]

=== Bijective Functions

#definition[
  A function $f: A -> B$ is *bijective* (a *bijection* or *one-to-one correspondence*) if it is both injective and surjective.
]

#example[
  - $f: RR -> RR$, $f(x) = 3x + 2$ is bijective (injective and surjective over $RR$)
  - $f: \{1,2,3\} -> \{a,b,c\}$, $f(1) = a, f(2) = b, f(3) = c$ is bijective
]

#theorem[
  A function $f: A -> B$ is bijective if and only if it has an inverse function.
]

=== Inverse Functions

#definition[
  If $f: A -> B$ is bijective, its *inverse function* $f^(-1): B -> A$ is defined by:
  $ f^(-1)(y) = x arrow.l.r f(x) = y $

  The inverse satisfies: $f^(-1)(f(x)) = x$ for all $x in A$, and $f(f^(-1)(y)) = y$ for all $y in B$.
]

#example[
  For $f: RR -> RR$, $f(x) = 3x + 2$: solving $y = 3x + 2$ for $x$ gives $f^(-1)(y) = (y - 2)/3$.

  Verify: $f^(-1)(f(x)) = f^(-1)(3x+2) = (3x+2-2)/3 = x$ ✓
]

#important[
  A function has an inverse if and only if it is bijective. This is why both injectivity and surjectivity matter; injectivity guarantees the inverse is well-defined (no two inputs share an output), and surjectivity guarantees the inverse is defined on all of $B$.
]

== Composition of Functions

=== Definition and Examples

#definition[
  Let $f: A -> B$ and $g: B -> C$. The *composition* of $g$ and $f$, written $g compose f$ (read "$g$ composed with $f$"), is the function $g compose f: A -> C$ defined by:
  $ (g compose f)(x) = g(f(x)) $
]

#important[
  For $g compose f$ to be defined, the codomain of $f$ must equal (or be a subset of) the domain of $g$. Note also that $g compose f$ applies $f$ first, then $g$; the order matters.
]

#example[
  Let $f: RR -> RR$, $f(x) = x^2$ and $g: RR -> RR$, $g(x) = x + 1$.
  - $(g compose f)(x) = g(f(x)) = f(x) + 1 = x^2 + 1$
  - $(f compose g)(x) = f(g(x)) = (x+1)^2 = x^2 + 2x + 1$

  Since $g compose f != f compose g$, composition is generally *not commutative*.
]

=== Properties of Composition

#theorem[
  Composition of functions is *associative*:
  $ h compose (g compose f) = (h compose g) compose f $
  whenever the compositions are defined.
]

#theorem[
  - The composition of two injective functions is injective
  - The composition of two surjective functions is surjective
  - The composition of two bijective functions is bijective
]

#proof[
  We prove the injective case. Let $f: A -> B$ and $g: B -> C$ both be injective.

  Suppose $(g compose f)(x_1) = (g compose f)(x_2)$. Then $g(f(x_1)) = g(f(x_2))$.

  Since $g$ is injective, $f(x_1) = f(x_2)$. Since $f$ is injective, $x_1 = x_2$.

  Therefore $g compose f$ is injective.
]

#theorem[
  If $f: A -> B$ is bijective, then $f^(-1) compose f = "id"_A$ and $f compose f^(-1) = "id"_B$, where $"id"_A(x) = x$ is the identity function on $A$.
]

== Cardinalities

=== Finite and Infinite Sets

#definition[
  A set $A$ is *finite* if $A = emptyset$ or if $A$ has exactly $n$ elements for some positive integer $n$. In the latter case, the *cardinality* of $A$ is $n$, written $|A| = n$.

  A set that is not finite is *infinite*.
]

#example[
  - $|\{a, b, c\}| = 3$
  - $|emptyset| = 0$
  - $NN, ZZ, QQ, RR$ are all infinite
]

=== Comparing Cardinalities

#definition[
  Two sets $A$ and $B$ have the *same cardinality*, written $|A| = |B|$, if there exists a bijection $f: A -> B$.

  $|A| <= |B|$ if there exists an injection $f: A -> B$.

  $|A| < |B|$ if $|A| <= |B|$ and $|A| != |B|$.
]

#remark[
  For finite sets, this agrees with the usual notion of size. For infinite sets, this provides a precise way to compare "sizes" of infinite collections; with surprising results.
]

#example[
  The sets $NN = \{0, 1, 2, 3, \ldots\}$ and $E = \{0, 2, 4, 6, \ldots\}$ (even naturals) have the same cardinality. The bijection $f: NN -> E$ defined by $f(n) = 2n$ witnesses this.

  This seems paradoxical; $E$ is a proper subset of $NN$, yet $|E| = |NN|$. This is a characteristic property of infinite sets.
]

== Countable and Uncountable Sets

=== Countably Infinite Sets

#definition[
  A set $A$ is *countably infinite* if $|A| = |NN|$, i.e., if there is a bijection $f: NN -> A$.

  A set is *countable* if it is finite or countably infinite. A set that is not countable is *uncountable*.
]

#theorem[
  The integers $ZZ$ are countably infinite.
]

#proof[
  Define $f: NN -> ZZ$ by:
  $ f(n) = cases(n/2 & "if" n "is even", -(n+1)/2 & "if" n "is odd") $

  This gives the enumeration $0, -1, 1, -2, 2, -3, 3, \ldots$, which is a bijection from $NN$ to $ZZ$.
]

#theorem[
  The rational numbers $QQ$ are countably infinite.
]

#proof[
  Arrange all positive rationals $p/q$ (in lowest terms) in an infinite grid indexed by $(p, q)$. Traverse this grid diagonally to produce an enumeration of all positive rationals. Adding 0 and the negative rationals gives a bijection from $NN$ to $QQ$.
]

#theorem[
  A countable union of countable sets is countable.
]

=== Uncountable Sets and Cantor's Theorem

#theorem("Cantor's Theorem")[
  The set of real numbers $RR$ is uncountable. Moreover, $|RR| > |NN|$.
]

#proof[
  We prove $(0,1) subset RR$ is uncountable using *Cantor's diagonal argument*.

  Suppose, for contradiction, that $(0,1)$ is countable. Then its elements can be listed:
  $ r_1 = 0.d_(11) d_(12) d_(13) dots $
  $ r_2 = 0.d_(21) d_(22) d_(23) dots $
  $ r_3 = 0.d_(31) d_(32) d_(33) dots $
  $ dots.v $

  Define $x = 0.x_1 x_2 x_3 \ldots$ where $x_n = 5$ if $d_(n n) != 5$, and $x_n = 6$ if $d_(n n) = 5$.

  Then $x in (0,1)$, but $x != r_n$ for every $n$ (they differ in the $n$-th decimal place). This contradicts our assumption that the list contains all elements of $(0,1)$.

  Therefore $(0,1)$; and hence $RR$; is uncountable.
]

#theorem("Cantor's Power Set Theorem")[
  For any set $A$, $|A| < |cal(P)(A)|$. In particular, no set can be placed in bijection with its own power set.
]

#remark[
  Cantor's theorems establish that there are infinitely many "sizes" of infinity:
  $ |NN| < |cal(P)(NN)| < |cal(P)(cal(P)(NN))| < dots $

  The cardinality $|NN|$ is denoted $aleph_0$ ("aleph-null"), and $|RR| = 2^(aleph_0)$. Whether there is a cardinality strictly between $aleph_0$ and $2^(aleph_0)$; the *Continuum Hypothesis* cannot be resolved from the standard axioms of set theory.
]
