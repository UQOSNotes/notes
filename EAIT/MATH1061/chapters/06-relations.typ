#import "/lib.typ": *

= Relations

Relations are a generalisation of functions. Whereas a function assigns to each input exactly one output, a relation between two sets merely specifies which pairs of elements are "related". Many fundamental mathematical structures — divisibility, congruence modulo $n$, set inclusion, and ordering — are most naturally expressed as relations. This chapter develops the theory of relations, culminating in two of the most important classes: equivalence relations (which generalise equality) and partial orders (which generalise $<=$ on the integers).

In this chapter we study:
- *Relations on sets:* how to define and represent a relation between two sets
- *Properties of relations:* reflexivity, symmetry, antisymmetry, and transitivity
- *Equivalence relations:* relations that partition a set into disjoint classes
- *Partial orders:* relations that generalise the notion of ordering

== Relations on Sets

A relation between two sets formalises the notion of a connection or association between elements. Unlike a function, a relation does not require every element of the domain to be associated with anything, and an element may be associated with multiple elements of the codomain.

=== Definition and Representation

#definition[
  Let $A$ and $B$ be sets. A *binary relation* $R$ from $A$ to $B$ is a subset of the Cartesian product $A times B$:
  $ R subset.eq A times B $

  If $(a, b) in R$, we say that $a$ is *related to* $b$ by $R$, written $a R b$. If $(a, b) in.not R$, we write $a cancel(R) b$.

  A *relation on $A$* is a relation from $A$ to $A$; that is, a subset of $A times A$.
]

#example[
  Let $A = {1, 2, 3}$ and $B = {a, b}$. Then $R = {(1, a), (1, b), (3, a)}$ is a relation from $A$ to $B$. We have $1 R a$ and $3 R a$, but $2 cancel(R) a$.
]

#example[
  The *divides* relation on $ZZ^+$: define $a R b$ if and only if $a divides b$. Then:
  - $2 R 6$ (since $2 | 6$)
  - $3 R 12$ (since $3 | 12$)
  - $5 cancel(R) 7$ (since $5 divides.not 7$)
]

#example[
  The *less-than-or-equal* relation $<=$ on $ZZ$ is a relation on $ZZ$: $R = {(a, b) in ZZ times ZZ mid a <= b}$.
]

=== Relations as Sets of Ordered Pairs

Since a relation is simply a set of ordered pairs, all set operations apply. The *domain* and *range* of a relation can be defined analogously to functions.

#definition[
  Let $R$ be a relation from $A$ to $B$.
  - The *domain* of $R$ is $"dom"(R) = {a in A mid exists b in B, (a, b) in R}$
  - The *range* of $R$ is $"ran"(R) = {b in B mid exists a in A, (a, b) in R}$
  - The *inverse* of $R$ is $R^(-1) = {(b, a) mid (a, b) in R} subset.eq B times A$
]

#example[
  Let $R = {(1, 2), (1, 4), (3, 2)}$ on $A = {1, 2, 3, 4}$. Then:
  - $"dom"(R) = {1, 3}$
  - $"ran"(R) = {2, 4}$
  - $R^(-1) = {(2, 1), (4, 1), (2, 3)}$
]

#remark[
  Every function $f: A -> B$ is also a relation from $A$ to $B$; namely, $R_f = {(a, f(a)) mid a in A}$. Functions are therefore special relations in which every element of $A$ appears exactly once as a first component.
]

=== Directed Graphs of Relations

A relation on a finite set can be visualised as a *directed graph* (or *digraph*), which provides an intuitive picture of which elements are related.

#definition[
  Let $R$ be a relation on a set $A$. The *directed graph* of $R$ has:
  - A *vertex* (node) for each element of $A$
  - A *directed edge* (arrow) from $a$ to $b$ whenever $(a, b) in R$
]

#note[
  - A *loop* at vertex $a$ represents the pair $(a, a) in R$.
  - An arrow from $a$ to $b$ does not imply an arrow from $b$ to $a$ (unless $(b, a) in R$ also holds).
]

#example[
  Let $A = {1, 2, 3, 4}$ and $R = {(1,1), (1,2), (2,3), (3,1), (4,4)}$. The directed graph has:
  - Loops at 1 and 4
  - Arrows: $1 -> 2$, $2 -> 3$, $3 -> 1$
]

#diagram(caption: [
  Directed graph of $R = {(1,1),(1,2),(2,3),(3,1),(4,4)}$ on $A = {1,2,3,4}$.
  Vertices 1 and 4 carry self-loops; vertices 1, 2, 3 form a directed 3-cycle.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let n1 = (0.0, 1.5)
      let n2 = (2.0, 1.5)
      let n3 = (1.0, 0.0)
      let n4 = (3.7, 0.75)

      let arr(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d,         f.at(1) + rd * dy / d),
          (t.at(0) - (rd + 0.06) * dx / d, t.at(1) - (rd + 0.06) * dy / d),
          stroke: sw, mark: (end: ">"))
      }

      let loop-up(p) = {
        let cx = p.at(0)
        let cy = p.at(1)
        draw.bezier(
          (cx - 0.07, cy + rd),
          (cx + 0.07, cy + rd),
          (cx - 0.55, cy + rd + 0.78),
          (cx + 0.55, cy + rd + 0.78),
          stroke: sw, mark: (end: ">"))
      }

      arr(n1, n2); arr(n2, n3); arr(n3, n1)
      loop-up(n1); loop-up(n4)

      for p in (n1, n2, n3, n4) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((-0.30, 1.5),  text(size: 8.5pt)[$1$])
      draw.content((2.30,  1.5),  text(size: 8.5pt)[$2$])
      draw.content((1.0,  -0.30), text(size: 8.5pt)[$3$])
      draw.content((4.00,  0.75), text(size: 8.5pt)[$4$])
    })
  ]
]

== Reflexivity, Symmetry, and Transitivity

Relations on a set can possess several structural properties. These properties describe how elements relate to themselves (reflexivity), how the relation behaves when its pairs are reversed (symmetry and antisymmetry), and how it chains through intermediate elements (transitivity). Understanding these properties is the key to classifying relations into the important types studied later in this chapter.

=== Reflexive Relations

#definition[
  A relation $R$ on a set $A$ is *reflexive* if every element of $A$ is related to itself:
  $ forall a in A, quad a R a $
  Equivalently, $(a, a) in R$ for all $a in A$.
]

#example[
  - The relation $<=$ on $ZZ$ is reflexive, since $a <= a$ for all $a in ZZ$.
  - The divides relation on $ZZ^+$ is reflexive, since $a | a$ for all $a in ZZ^+$.
  - Equality $=$ on any set is reflexive.
  - The relation $<$ on $ZZ$ is *not* reflexive, since $a < a$ is false for all $a$.
]

#note[
  In the directed graph of a reflexive relation, every vertex has a loop.
]

#definition[
  A relation $R$ on a set $A$ is *irreflexive* if no element is related to itself:
  $ forall a in A, quad (a, a) in.not R $
]

#example[
  The strict order $<$ on $ZZ$ is irreflexive. The relation "is a proper subset of" on sets is irreflexive.
]

=== Symmetric and Antisymmetric Relations

#definition[
  A relation $R$ on a set $A$ is *symmetric* if, whenever $a$ is related to $b$, then $b$ is also related to $a$:
  $ forall a, b in A, quad a R b arrow.r b R a $
]

#definition[
  A relation $R$ on a set $A$ is *antisymmetric* if, whenever $a$ is related to $b$ and $b$ is related to $a$, then $a$ and $b$ must be the same element:
  $ forall a, b in A, quad (a R b and b R a) arrow.r a = b $

  Equivalently: if $a != b$ and $a R b$, then $b cancel(R) a$.
]

#example[
  - The relation $=$ on $ZZ$ is both symmetric and antisymmetric.
  - The relation "has the same parity as" on $ZZ$ is symmetric (if $a$ and $b$ are both even, then so are $b$ and $a$), but not antisymmetric.
  - The divides relation on $ZZ^+$ is antisymmetric: if $a | b$ and $b | a$, then $a = b$.
  - The relation $<=$ on $ZZ$ is antisymmetric: if $a <= b$ and $b <= a$, then $a = b$.
  - The strict order $<$ is antisymmetric (vacuously: there are no $a, b$ with $a < b$ and $b < a$).
]

#note[
  Symmetric and antisymmetric are not opposites. A relation can be both (e.g., $=$), one but not the other, or neither (e.g., $R = {(1,2), (2,1), (1,3)}$ is neither symmetric nor antisymmetric on ${1,2,3}$).
]

=== Transitive Relations

#definition[
  A relation $R$ on a set $A$ is *transitive* if, whenever $a$ is related to $b$ and $b$ is related to $c$, then $a$ is related to $c$:
  $ forall a, b, c in A, quad (a R b and b R c) arrow.r a R c $
]

#example[
  - The relation $<=$ on $ZZ$ is transitive: if $a <= b$ and $b <= c$, then $a <= c$.
  - The divides relation on $ZZ^+$ is transitive: if $a | b$ and $b | c$, then $a | c$ (proved in Chapter 3).
  - Congruence modulo $n$ is transitive: if $a equiv b quad (mod n)$ and $b equiv c quad (mod n)$, then $a equiv c quad (mod n)$.
  - The relation $R = {(1,2), (2,3)}$ on ${1,2,3}$ is *not* transitive, since $(1,2)$ and $(2,3)$ are in $R$ but $(1,3)$ is not.
]

#note[
  To disprove transitivity, find $a, b, c$ (not necessarily distinct) such that $a R b$ and $b R c$ but $a cancel(R) c$.
]

#example[
  Determine which properties the following relation on $A = {1, 2, 3, 4}$ satisfies:
  $ R = {(1,1), (2,2), (3,3), (4,4), (1,2), (2,1), (3,4), (4,3)} $

  - *Reflexive:* $(1,1), (2,2), (3,3), (4,4) in R$. ✓
  - *Symmetric:* $(1,2) in R$ and $(2,1) in R$; $(3,4) in R$ and $(4,3) in R$. ✓
  - *Antisymmetric:* $(1,2)$ and $(2,1)$ are both in $R$ but $1 != 2$. ✗
  - *Transitive:* $(1,2)$ and $(2,1)$ are in $R$; is $(1,1)$ in $R$? Yes. $(3,4)$ and $(4,3)$ are in $R$; is $(3,3)$ in $R$? Yes. ✓
]

== Equivalence Relations

An equivalence relation is one that behaves like equality. It captures the idea of two elements being "the same in some respect" without necessarily being identical. Congruence modulo $n$, having the same birthday, and being parallel lines are all equivalence relations.

=== Definition and Examples

#definition[
  A relation $R$ on a set $A$ is an *equivalence relation* if it is:
  1. *Reflexive:* $a R a$ for all $a in A$
  2. *Symmetric:* if $a R b$, then $b R a$
  3. *Transitive:* if $a R b$ and $b R c$, then $a R c$
]

#example[
  *Congruence modulo $n$:* Define $a R b$ if and only if $n | (a - b)$ (equivalently, $a equiv b quad (mod n)$). This is an equivalence relation on $ZZ$ for any positive integer $n$:
  - *Reflexive:* $n | (a - a) = 0$. ✓
  - *Symmetric:* If $n | (a - b)$, then $n | (-(a-b)) = (b - a)$. ✓
  - *Transitive:* If $n | (a - b)$ and $n | (b - c)$, then $n | ((a-b) + (b-c)) = (a-c)$. ✓
]

#example[
  Define a relation $R$ on $ZZ$ by: $a R b$ if and only if $a - b$ is even (i.e., $a$ and $b$ have the same parity). This is an equivalence relation:
  - *Reflexive:* $a - a = 0$ is even. ✓
  - *Symmetric:* If $a - b$ is even, then $b - a = -(a - b)$ is even. ✓
  - *Transitive:* If $a - b$ and $b - c$ are even, then $a - c = (a - b) + (b - c)$ is even. ✓
]

#example[
  Define a relation on the set of all triangles: triangle $T_1$ is related to triangle $T_2$ if they are similar (same angles). This is an equivalence relation.
]

#example[
  The relation $<$ on $ZZ$ is *not* an equivalence relation; it is not reflexive ($a < a$ is false) and not symmetric.
]

=== Equivalence Classes

When a set is equipped with an equivalence relation, its elements are naturally grouped according to which elements they are related to.

#definition[
  Let $R$ be an equivalence relation on a set $A$, and let $a in A$. The *equivalence class of $a$*, denoted $[a]$ (or $overline(a)$), is the set of all elements of $A$ that are related to $a$:
  $ [a] = {x in A mid x R a} $

  Any element $b in [a]$ is called a *representative* of the class.
]

#example[
  Let $R$ be congruence modulo 3 on $ZZ$. The equivalence classes are:
  $
    [0] = {dots, -6, -3, 0, 3, 6, dots} quad & "(multiples of 3)" \
    [1] = {dots, -5, -2, 1, 4, 7, dots} quad & "(integers congruent to 1 mod 3)" \
    [2] = {dots, -4, -1, 2, 5, 8, dots} quad & "(integers congruent to 2 mod 3)"
  $

  Note that $[0] = [3] = [6] = dots$ (every element of a class is a valid representative).
]

#theorem[
  Let $R$ be an equivalence relation on $A$. For all $a, b in A$:
  1. $a in [a]$ (every element belongs to its own equivalence class)
  2. $[a] = [b]$ if and only if $a R b$
  3. Either $[a] = [b]$ or $[a] inter [b] = emptyset$ (equivalence classes are either identical or disjoint)
]

#proof[
  *(1)* Since $R$ is reflexive, $a R a$, so $a in [a]$.

  *(2)* ($arrow.r$) Suppose $[a] = [b]$. Since $a in [a] = [b]$, we have $a R b$.

  ($arrow.l$) Suppose $a R b$. Let $x in [a]$, so $x R a$. By transitivity, $x R b$, so $x in [b]$. Hence $[a] subset.eq [b]$. By symmetry, $b R a$, so a symmetric argument gives $[b] subset.eq [a]$. Therefore $[a] = [b]$.

  *(3)* Suppose $[a] inter [b] != emptyset$. Then there exists $c in [a] inter [b]$, so $c R a$ and $c R b$. By symmetry, $a R c$, and by transitivity with $c R b$, we get $a R b$. By part (2), $[a] = [b]$.
]

#important[
  Property (3) of the theorem above is the key property: equivalence classes either coincide or are completely disjoint. There is no partial overlap.
]

=== Partitions

Equivalence classes naturally divide a set into non-overlapping groups. The formal name for such a grouping is a partition.

#definition[
  A *partition* of a set $A$ is a collection $cal(P) = {A_1, A_2, A_3, dots}$ of non-empty subsets of $A$ such that:
  1. The subsets are *pairwise disjoint:* $A_i inter A_j = emptyset$ whenever $i != j$
  2. Their *union covers $A$:* $A_1 union A_2 union A_3 union dots = A$

  Each $A_i$ is called a *block* (or *cell*) of the partition.
]

#example[
  Let $A = {1, 2, 3, 4, 5, 6}$. Then $cal(P) = {{1, 3, 5}, {2, 4}, {6}}$ is a partition of $A$ into three blocks.
]

#example[
  The equivalence classes of congruence modulo 3 on $ZZ$ form a partition of $ZZ$ into three blocks: $[0]$, $[1]$, and $[2]$.
]

=== The Connection Between Equivalence Relations and Partitions

Equivalence relations and partitions are two descriptions of the same phenomenon.

#theorem[
  Let $R$ be an equivalence relation on a non-empty set $A$. Then the collection of all distinct equivalence classes of $R$ forms a partition of $A$.

  Conversely, every partition of $A$ defines an equivalence relation on $A$: declare $a R b$ if and only if $a$ and $b$ belong to the same block of the partition.
]

#proof[
  *Equivalence relation $arrow.r$ partition:*

  We must verify the two conditions for a partition.
  - *Non-empty:* By reflexivity, $a in [a]$, so each equivalence class is non-empty.
  - *Pairwise disjoint:* By part (3) of the previous theorem, any two equivalence classes are either equal or disjoint.
  - *Union covers $A$:* Since $a in [a]$ for every $a in A$, every element belongs to some class, so $A = union_(a in A) [a]$.

  *Partition $arrow.r$ equivalence relation:*

  Define $a R b$ if and only if $a$ and $b$ are in the same block. Then:
  - *Reflexive:* Every $a$ is in the same block as itself.
  - *Symmetric:* If $a$ and $b$ are in the same block, then $b$ and $a$ are in the same block.
  - *Transitive:* If $a$ and $b$ are in the same block, and $b$ and $c$ are in the same block, then (since blocks are disjoint) all three are in the same block, so $a$ and $c$ are in the same block.
]

#example[
  The partition ${{1, 3, 5}, {2, 4, 6}}$ of ${1, 2, 3, 4, 5, 6}$ corresponds to the equivalence relation "has the same parity". Its equivalence classes are the odd integers and the even integers.
]

== Partial Order Relations

A partial order generalises the familiar "less than or equal to" relation on the integers. The term "partial" reflects the fact that not every pair of elements need be comparable; some elements may be incomparable.

=== Definition and Examples

#definition[
  A relation $R$ on a set $A$ is a *partial order* if it is:
  1. *Reflexive:* $a R a$ for all $a in A$
  2. *Antisymmetric:* if $a R b$ and $b R a$, then $a = b$
  3. *Transitive:* if $a R b$ and $b R c$, then $a R c$

  A set $A$ together with a partial order $R$ is called a *partially ordered set* (or *poset*), written $(A, R)$.

  The partial order is commonly denoted $prec.eq$; we write $a prec.eq b$ for $a R b$.
]

#example[
  - $(ZZ, <=)$ is a poset. The relation $<=$ is reflexive, antisymmetric, and transitive.
  - $(ZZ^+, divides)$ is a poset: $a | a$; if $a | b$ and $b | a$ then $a = b$; if $a | b$ and $b | c$ then $a | c$.
  - $(cal(P)(A), subset.eq)$ is a poset for any set $A$: $B subset.eq B$; if $B subset.eq C$ and $C subset.eq B$ then $B = C$; if $B subset.eq C$ and $C subset.eq D$ then $B subset.eq D$.
  - The strict less-than relation $<$ on $ZZ$ is *not* a partial order, as it is not reflexive.
]

#definition[
  In a poset $(A, prec.eq)$, two elements $a$ and $b$ are *comparable* if $a prec.eq b$ or $b prec.eq a$. Otherwise they are *incomparable*.
]

#example[
  In the poset $(cal(P)({1,2,3}), subset.eq)$, the sets $\{1\}$ and $\{2\}$ are incomparable (neither is a subset of the other), while $\{1\} subset.eq \{1,2\}$ so they are comparable.
]

#definition[
  Let $(A, prec.eq)$ be a poset. An element $m in A$ is:
  - a *minimal element* if there is no $x in A$ with $x prec.eq m$ and $x != m$
  - a *maximal element* if there is no $x in A$ with $m prec.eq x$ and $x != m$
  - the *least element* (or *minimum*) if $m prec.eq a$ for all $a in A$
  - the *greatest element* (or *maximum*) if $a prec.eq m$ for all $a in A$
]

#remark[
  A least element is always minimal, but a minimal element need not be a least element. A poset may have many minimal elements but at most one least element.
]

=== Hasse Diagrams

Hasse diagrams are a compact visual representation of a poset that eliminates the redundancy present in a full directed graph.

#definition[
  The *Hasse diagram* of a finite poset $(A, prec.eq)$ is drawn as follows:
  1. Represent each element as a vertex
  2. If $a prec.eq b$ and $a != b$ and there is no $c$ with $a prec.eq c prec.eq b$ (i.e., $b$ *covers* $a$), draw a line from $a$ upward to $b$
  3. Omit loops (reflexive pairs) and edges that are implied by transitivity
]

#example[
  The Hasse diagram for the poset $(cal(P)({a, b, c}), subset.eq)$ has $emptyset$ at the bottom, the three singletons $\{a\}, \{b\}, \{c\}$ in the middle, the three two-element sets $\{a,b\}, \{a,c\}, \{b,c\}$ above them, and $\{a,b,c\}$ at the top. Each set is connected by a line to the sets that cover it (those obtained by adding exactly one element).
]

#example[
  The Hasse diagram of $(D_{12}, divides)$, where $D_{12} = {1, 2, 3, 4, 6, 12}$ is the set of divisors of 12:

  - 1 is at the bottom (the least element)
  - 1 is covered by 2 and 3
  - 2 is covered by 4 and 6
  - 3 is covered by 6
  - 4 and 6 are covered by 12
  - 12 is at the top (the greatest element)
]

#diagram(caption: [
  Hasse diagram of $(D_(12), divides)$, where $D_(12) = {1,2,3,4,6,12}$.
  Upward position indicates divisibility; each edge represents a cover relation.
  The element 1 is the unique minimum and 12 the unique maximum.
])[
  #align(center)[
    #canvas(length: 1cm, {
      let rd = 0.12
      let sw = 0.7pt + black
      let p1  = (2.0, 0.0)
      let p2  = (1.0, 1.5)
      let p3  = (3.0, 1.5)
      let p4  = (1.0, 3.0)
      let p6  = (3.0, 3.0)
      let p12 = (2.0, 4.5)

      let seg(f, t) = {
        let dx = t.at(0) - f.at(0)
        let dy = t.at(1) - f.at(1)
        let d = calc.sqrt(dx * dx + dy * dy)
        draw.line(
          (f.at(0) + rd * dx / d, f.at(1) + rd * dy / d),
          (t.at(0) - rd * dx / d, t.at(1) - rd * dy / d),
          stroke: sw)
      }

      seg(p1, p2); seg(p1, p3)
      seg(p2, p4); seg(p2, p6)
      seg(p3, p6)
      seg(p4, p12); seg(p6, p12)

      for p in (p1, p2, p3, p4, p6, p12) {
        draw.circle(p, radius: rd, fill: black, stroke: none)
      }

      draw.content((2.0,  -0.30), text(size: 8.5pt)[$1$])
      draw.content((0.68,  1.50), text(size: 8.5pt)[$2$])
      draw.content((3.32,  1.50), text(size: 8.5pt)[$3$])
      draw.content((0.68,  3.00), text(size: 8.5pt)[$4$])
      draw.content((3.32,  3.00), text(size: 8.5pt)[$6$])
      draw.content((2.0,   4.82), text(size: 8.5pt)[$12$])
    })
  ]
]

#note[
  In a Hasse diagram, upward movement corresponds to the direction of the relation: $a prec.eq b$ means $b$ is higher than $a$ in the diagram (or at the same level if $a = b$, but only the strict coverings are drawn).
]

=== Totally Ordered Sets

#definition[
  A partial order on $A$ is a *total order* (or *linear order*) if every pair of elements is comparable:
  $ forall a, b in A, quad a prec.eq b quad "or" quad b prec.eq a $

  A set with a total order is called a *totally ordered set* (or *chain*).
]

#example[
  - $(ZZ, <=)$ is totally ordered: for any two integers $a$ and $b$, either $a <= b$ or $b <= a$.
  - $(QQ, <=)$ and $(RR, <=)$ are totally ordered.
  - $(cal(P)({1,2}), subset.eq)$ is *not* totally ordered: $\{1\}$ and $\{2\}$ are incomparable.
  - $(D_{12}, divides)$ is *not* totally ordered: $4$ and $6$ are incomparable (neither divides the other).
]

#theorem[
  Every finite totally ordered set has a least element and a greatest element.
]

#remark[
  Total orders arise naturally in the context of sorting algorithms and comparison-based data structures, where any two elements must be comparable. Partial orders arise in contexts such as task scheduling (some tasks must precede others, but many are independent), compiler optimisation, and lattice theory in algebra.
]
