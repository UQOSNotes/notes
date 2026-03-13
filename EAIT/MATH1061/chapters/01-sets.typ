#import "/lib.typ": *

= Sets and Logic

#lorem(35)

#definition("Set")[
  A *set* is an unordered collection of distinct objects called *elements*.
  We write $x in A$ to mean $x$ is an element of $A$, and $x in.not A$ otherwise.
  Two sets are equal if and only if they contain exactly the same elements.
]

#lorem(20)

#definition("Subset")[
  $A$ is a *subset* of $B$, written $A subset.eq B$, if every element of $A$ is
  also an element of $B$. $A$ is a *proper subset* of $B$, written $A subset B$,
  if $A subset.eq B$ and $A eq.not B$.
]

#example("Power Set")[
  The power set of $A = {1, 2, 3}$ is
  $
    cal(P)(A) = {emptyset, {1}, {2}, {3}, {1,2}, {1,3}, {2,3}, {1,2,3}}.
  $
  In general, if $|A| = n$ then $|cal(P)(A)| = 2^n$.
]

#lorem(25)

#theorem("De Morgan's Laws")[
  For any sets $A$ and $B$ within a universal set $U$:
  $
    overline(A union B) = overline(A) inter overline(B)
    quad "and" quad
    overline(A inter B) = overline(A) union overline(B).
  $
]

#proof[
  We prove the first law; the second is analogous. Let $x$ be arbitrary.
  $
    x in overline(A union B)
    &arrow.l.r.double x in.not (A union B) \
    &arrow.l.r.double x in.not A "and" x in.not B \
    &arrow.l.r.double x in overline(A) "and" x in overline(B) \
    &arrow.l.r.double x in overline(A) inter overline(B).
  $
]

#remark[
  De Morgan's laws extend to arbitrary (even infinite) collections of sets:
  $overline(union.big_(i in I) A_i) = inter.big_(i in I) overline(A_i)$.
]

#note[
  #lorem(20)
]
