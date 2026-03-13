#import "/lib.typ": *

= Functions and Relations

#lorem(30)

#definition("Function")[
  A *function* $f : A -> B$ is a rule that assigns to each element $a in A$
  exactly one element $f(a) in B$. We call $A$ the *domain* and $B$ the
  *codomain* of $f$. The *image* (or range) of $f$ is
  $"Im"(f) = {f(a) mid a in A} subset.eq B$.
]

#definition("Injective, Surjective, Bijective")[
  A function $f : A -> B$ is:
  - *Injective* (one-to-one) if $f(a_1) = f(a_2) ==> a_1 = a_2$.
  - *Surjective* (onto) if for every $b in B$ there exists $a in A$ with $f(a) = b$.
  - *Bijective* if it is both injective and surjective.
]

#lorem(20)

#example("Bijectivity")[
  The function $f : RR -> RR$ defined by $f(x) = 2x + 1$ is bijective.

  *Injective:* $f(x) = f(y) => 2x+1 = 2y+1 => x = y$. \
  *Surjective:* given $y in RR$, set $x = (y-1)/2$; then $f(x) = y$.
]

#theorem("Pigeonhole Principle")[
  If $n$ objects are distributed among $k$ containers with $n > k$, then at
  least one container holds more than one object. Equivalently, if
  $f : A -> B$ is injective and $A$, $B$ are finite, then $|A| <= |B|$.
]

#proof[
  Suppose for contradiction that every container holds at most one object.
  Then the total number of objects is at most $k < n$, a contradiction.
]

#proposition[
  A function $f : A -> B$ between finite sets with $|A| = |B|$ is injective
  if and only if it is surjective.
]

#important[
  #lorem(25)
]
