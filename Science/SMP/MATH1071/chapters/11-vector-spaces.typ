#import "/lib.typ": *

= Vector Spaces

Vector spaces are the common language behind vectors in $RR^n$, matrices, polynomials, and solution sets of homogeneous systems. The objects may look different, but the same ideas of span, independence, basis, and dimension apply to all of them.

== Vector Spaces and Subspaces

#definition("Vector space")[
  A *vector space over* $RR$ is a set $V$ whose elements can be added and multiplied by real scalars, satisfying the usual rules:
  commutativity and associativity of addition, a zero vector, additive inverses, distributivity, and scalar associativity.
]

#example[
  The following are vector spaces over $RR$:
  - $RR^n$ with usual vector addition and scalar multiplication,
  - $M_(m times n)(RR)$, the set of $m times n$ real matrices,
  - $P_n(RR)$, the set of real polynomials of degree at most $n$.
]

#definition("Subspace")[
  A subset $U subset.eq V$ is a *subspace* of $V$ if:
  - $0 in U$,
  - whenever $u, v in U$, then $u + v in U$,
  - whenever $u in U$ and $c in RR$, then $c u in U$.
]

#proposition("Subspace test")[
  A non-empty subset $U subset.eq V$ is a subspace if and only if
  $
    c u + d v in U
  $
  for all $u, v in U$ and all $c, d in RR$.
]<prop:subspace-test>

#example[
  The set of $n times n$ upper triangular matrices is a subspace of $M_(n times n)(RR)$: the zero matrix is upper triangular, sums of upper triangular matrices are upper triangular, and scalar multiples are upper triangular.
]

#example[
  The set of $n times n$ orthogonal matrices is not a subspace. It contains $I$, but $2I$ is not orthogonal because
  $
    (2I)^T(2I) = 4I != I.
  $
]

#example[
  The set
  $
    {mat(x; y; z) in RR^3 : x + 2 y z = 6}
  $
  is not a subspace. It does not contain $0$, and the condition is not linear because of the product $y z$.
]

== Nullspaces

#definition("Nullspace")[
  The *nullspace* of a matrix $A$ is
  $
    op("ker") A = {x : A x = 0}.
  $
  It is also called the *kernel* of $A$.
]

#proposition("Nullspaces are subspaces")[
  For every matrix $A$, the nullspace $op("ker") A$ is a subspace.
]

#proof[
  Since $A 0 = 0$, we have $0 in op("ker") A$. If $u, v in op("ker") A$ and $c, d in RR$, then
  $
    A(c u + d v) = c A u + d A v = 0.
  $
  Hence $c u + d v in op("ker") A$.
]

#proposition("Nullspace inclusion")[
  If $A$ and $B$ are square matrices, then
  $
    op("ker") B subset.eq op("ker")(A B).
  $
]

#proof[
  If $x in op("ker") B$, then $B x = 0$. Therefore
  $
    A B x = A 0 = 0,
  $
  so $x in op("ker")(A B)$.
]

== Span

#definition("Linear combination")[
  A *linear combination* of vectors $v_1, dots, v_k$ is a vector of the form
  $
    c_1 v_1 + dots + c_k v_k,
  $
  where $c_1, dots, c_k in RR$.
]

#definition("Span")[
  The *span* of vectors $v_1, dots, v_k$ is the set of all their linear combinations:
  $
    op("span"){v_1, dots, v_k}
      = {c_1 v_1 + dots + c_k v_k : c_1, dots, c_k in RR}.
  $
]

#proposition("Spans are subspaces")[
  For any vectors $v_1, dots, v_k in V$, the set $op("span"){v_1, dots, v_k}$ is a subspace of $V$.
]

#example[
  The set
  $
    {mat(5t; -3t; t; t) in RR^4 : t in RR}
  $
  is
  $
    op("span"){mat(5; -3; 1; 1)}.
  $
  It is a one-dimensional subspace of $RR^4$.
]

== Linear Independence

#definition("Linear independence")[
  Vectors $v_1, dots, v_k$ are *linearly independent* if the equation
  $
    c_1 v_1 + dots + c_k v_k = 0
  $
  implies
  $
    c_1 = dots = c_k = 0.
  $
  If there is a non-trivial solution, the vectors are *linearly dependent*.
]

#proposition("Subsets and supersets")[
  - Every subset of a linearly independent set is linearly independent.
  - Every superset of a linearly dependent set is linearly dependent.
]

#proof[
  For the first statement, a non-trivial dependence relation among a subset would also be a non-trivial dependence relation among the original set by giving the missing vectors coefficient $0$. For the second statement, keep the existing non-trivial dependence relation and again give every added vector coefficient $0$.
]

#example[
  The Pauli spin matrices
  $
    A = mat(0, 1; 1, 0),
    quad
    B = mat(0, -i; i, 0),
    quad
    C = mat(1, 0; 0, -1)
  $
  are linearly independent in $M_(2 times 2)(CC)$. If
  $
    c_1 A + c_2 B + c_3 C = mat(0, 0; 0, 0),
  $
  then comparing entries gives
  $
    c_3 = 0,
    quad
    c_1 - i c_2 = 0,
    quad
    c_1 + i c_2 = 0.
  $
  Adding the last two equations gives $2c_1 = 0$, hence $c_1 = c_2 = c_3 = 0$.
]

#proposition("Eigenvectors with distinct eigenvalues")[
  Eigenvectors corresponding to distinct eigenvalues are linearly independent.
]

#note[
  This is the vector-space version of #link(<prop:distinct-eigenvectors-independent>)[the eigenvector independence result] from the previous chapter.
]

== Bases and Dimension

#definition("Basis")[
  A list of vectors $(v_1, dots, v_k)$ is a *basis* for a vector space $V$ if:
  - the vectors span $V$,
  - the vectors are linearly independent.
]

#definition("Dimension")[
  If $V$ has a finite basis, then the number of vectors in any basis of $V$ is called the *dimension* of $V$, denoted $op("dim")(V)$.
]

#example[
  The set
  $
    U = {mat(a; b; c; d; e) in RR^5 : a - c - d = 0}
  $
  is a subspace. Since $a = c + d$,
  $
    mat(a; b; c; d; e)
      = b mat(0; 1; 0; 0; 0)
        + c mat(1; 0; 1; 0; 0)
        + d mat(1; 0; 0; 1; 0)
        + e mat(0; 0; 0; 0; 1).
  $
  These four vectors form a basis, so $op("dim")(U) = 4$.
]

#example[
  Let
  $
    V = {p(x) in P_7(RR) : p(1) = 0}.
  $
  This is a vector space: if $p(1) = q(1) = 0$, then $(c p + d q)(1) = 0$. A clean basis is
  $
    x - 1,quad
    x(x - 1),quad
    x^2(x - 1),quad
    dots,quad
    x^6(x - 1).
  $
  Hence $op("dim")(V) = 7$.
]

#pagebreak()

#example[
  The four vectors
  $
    mat(x; x; 1; 1),
    quad
    mat(1; 1; 1; 1),
    quad
    mat(1; 1; x; 1),
    quad
    mat(1; 1; 1; x)
  $
  never form a basis of $RR^4$, because every vector in their span has first coordinate equal to second coordinate. If $x = 1$, all four vectors are equal, so the span has dimension $1$. If $x != 1$, their span is the three-dimensional subspace
  $
    {mat(a; a; b; c) : a, b, c in RR}.
  $
]

== Sums and Intersections of Subspaces

#definition("Sum of subspaces")[
  If $U$ and $V$ are subspaces of a vector space $W$, their sum is
  $
    U + V = {u + v : u in U, v in V}.
  $
]

#proposition("Sums and intersections")[
  If $U$ and $V$ are subspaces of $W$, then $U + V$ and $U inter V$ are subspaces of $W$.
]

#proof[
  For $U + V$, use the subspace test:
  $
    c(u_1 + v_1) + d(u_2 + v_2)
      = (c u_1 + d u_2) + (c v_1 + d v_2) in U + V.
  $
  For $U inter V$, if $x, y$ lie in both spaces, then $c x + d y$ lies in both spaces.
]

#proposition("Union warning")[
  If neither $U$ nor $V$ is contained in the other, then $U union V$ is not a subspace.
]

#proof[
  Choose $u in U$ with $u in.not V$ and $v in V$ with $v in.not U$. If $u + v in U$, then $v = (u + v) - u in U$, a contradiction. If $u + v in V$, then $u = (u + v) - v in V$, a contradiction. Thus $U union V$ is not closed under addition.
]

#theorem("Dimension formula")[
  If $U$ and $V$ are finite-dimensional subspaces, then
  $
    op("dim")(U + V) = op("dim")(U) + op("dim")(V) - op("dim")(U inter V).
  $
]<thm:dimension-formula>

#example[
  If $U$ and $V$ are two-dimensional subspaces of $RR^4$, then $op("dim")(U inter V)$ can be $0$, $1$, or $2$. By #link(<thm:dimension-formula>)[the dimension formula],
  $
    op("dim")(U + V) = 4 - op("dim")(U inter V),
  $
  so $op("dim")(U + V)$ can be $4$, $3$, or $2$ respectively.
]

#example[
  If $U$ and $V$ are distinct three-dimensional subspaces of $RR^4$, then $op("dim")(U inter V) = 2$. Indeed, $U + V subset.eq RR^4$, so
  $
    op("dim")(U inter V) = 6 - op("dim")(U + V) >= 2.
  $
  Since $U != V$, the intersection cannot have dimension $3$. Hence it has dimension $2$.
]

== Matrix Subspaces

#example[
  Let
  $
    W = {X in M_(2 times 2)(RR) : X = X^T, op("tr")(X) = 0}.
  $
  A matrix in $W$ has the form
  $
    mat(a, b; b, -a)
      = a mat(1, 0; 0, -1) + b mat(0, 1; 1, 0).
  $
  Hence a basis is
  $
    mat(1, 0; 0, -1),
    quad
    mat(0, 1; 1, 0),
  $
  and $op("dim")(W) = 2$.
]

#example[
  The set of $2 times 2$ real matrices $A$ satisfying $A^2 = 0$ is not a subspace. For example,
  $
    A = mat(0, 1; 0, 0),
    quad
    B = mat(0, 0; 1, 0)
  $
  both satisfy $A^2 = B^2 = 0$, but
  $
    (A + B)^2 = mat(1, 0; 0, 1) != 0.
  $
]

== Linear Maps

#definition("Linear map")[
  A function $T: V -> W$ between vector spaces is *linear* if
  $
    T(c u + d v) = c T(u) + d T(v)
  $
  for all $u, v in V$ and $c, d in RR$.
]

#note[
  To prove a map is linear, it is enough to check additivity $T(u + v) = T(u) + T(v)$ and homogeneity $T(c u) = c T(u)$. To disprove linearity, find one counterexample to either rule.
]

#example[
  Define $T: M_(2 times 2)(RR) -> M_(2 times 2)(RR)$ by
  $
    T(A) = 3A^T + op("tr")(A) mat(0, -1; 1, 0).
  $
  This map is linear because transpose and trace are linear:
  $
    T(c A + d B)
      = 3(c A + d B)^T + op("tr")(c A + d B) mat(0, -1; 1, 0)
      = c T(A) + d T(B).
  $
]

#definition("Eigenvector of a linear map")[
  If $T: V -> V$ is linear, a non-zero vector $v in V$ is an *eigenvector* of $T$ with eigenvalue $lambda$ if
  $
    T(v) = lambda v.
  $
]

#example[
  For the map above,
  $
    T(mat(1, 0; 0, -1)) = 3 mat(1, 0; 0, -1),
  $
  so $mat(1, 0; 0, -1)$ is an eigenvector with eigenvalue $3$. But
  $
    T(I) = 3I + 2 mat(0, -1; 1, 0),
  $
  which is not a scalar multiple of $I$, so $I$ is not an eigenvector.
]
