#import "/lib.typ": *

= Systems of Linear Equations and Matrices

Linear algebra starts here with systems of equations. Matrix notation is useful because the same row operations solve the system, describe the solution set, and later test invertibility.

== Linear Systems

#definition("Linear equation")[
  A *linear equation* in variables $x_1, dots, x_n$ has the form
  $
    a_1 x_1 + a_2 x_2 + dots + a_n x_n = b,
  $
  where $a_1, dots, a_n, b in RR$ are fixed scalars. A *linear system* is a finite list of linear equations in the same variables.
]

#definition("Solution set")[
  A *solution* of a system is an ordered tuple $(x_1, dots, x_n)$ satisfying every equation. The *solution set* is the set of all solutions.
]

#note[
  A linear system has exactly one of the following behaviours: no solution, exactly one solution, or infinitely many solutions. The row-reduction process below is how we tell which case we are in.
]

#diagram(caption: [
  In $RR^2$, a system of two linear equations asks where two lines meet.
])[
  #canvas(length: 1cm, {
    let axis = 0.55pt + luma(120)
    let a = blue
    let b = green
    let redline = red
    let draw_axes(origin) = {
      draw.line((origin.at(0), origin.at(1) - 1.25), (origin.at(0), origin.at(1) + 1.25), stroke: axis)
      draw.line((origin.at(0) - 1.25, origin.at(1)), (origin.at(0) + 1.25, origin.at(1)), stroke: axis)
    }
    draw_axes((1.55, 1.65))
    draw.line((0.55, 1.05), (2.55, 2.35), stroke: 1pt + a)
    draw.line((0.55, 2.25), (2.55, 1.05), stroke: 1pt + b)
    draw.circle((1.55, 1.70), radius: 0.065, fill: redline, stroke: none)
    draw.content((1.55, 0.05), text(size: 8.5pt)[one solution])

    draw_axes((4.15, 1.65))
    draw.line((3.15, 1.1), (5.15, 2.2), stroke: 1pt + a)
    draw.line((3.15, 0.75), (5.15, 1.85), stroke: 1pt + b)
    draw.content((4.15, 0.05), text(size: 8.5pt)[no solution])

    draw_axes((6.75, 1.65))
    draw.line((5.75, 1.05), (7.75, 2.25), stroke: 1.5pt + a)
    draw.line((5.75, 1.05), (7.75, 2.25), stroke: 0.7pt + b)
    draw.content((6.75, 0.05), text(size: 8.5pt)[infinitely many])
  })
]

#example[
  The system
  $
    2x + y + 8z = 0, quad
    x + 2y + z = 3, quad
    3x + 7y + z = 11
  $
  has infinitely many solutions. Row reduction gives
  $
    x + 5z = -1, quad y - 2z = 2.
  $
  Taking $z = t$,
  $
    (x, y, z) = (-1 - 5t, 2 + 2t, t), quad t in RR.
  $
]

== Matrices and Augmented Matrices

#definition("Matrix")[
  An $m times n$ *matrix* is a rectangular array of scalars with $m$ rows and $n$ columns:
  $
    A = mat(
      a_(1 1), a_(1 2), dots, a_(1 n);
      a_(2 1), a_(2 2), dots, a_(2 n);
      dots, dots, dots, dots;
      a_(m 1), a_(m 2), dots, a_(m n)
    ).
  $
  The entry in row $i$ and column $j$ is denoted $a_(i j)$.
]

#definition("Coefficient and augmented matrices")[
  The system $A x = b$ has *coefficient matrix* $A$ and *augmented matrix* $[A | b]$. For example,
  $
    mat(2, 1, 8; 1, 2, 1; 3, 7, 1)
    mat(x; y; z)
    =
    mat(0; 3; 11)
  $
  corresponds to
  $
    [A | b]
    =
    mat(2, 1, 8, 0; 1, 2, 1, 3; 3, 7, 1, 11).
  $
]

#definition("Elementary row operations")[
  The elementary row operations are:
  - swap two rows,
  - multiply a row by a non-zero scalar,
  - add a scalar multiple of one row to another row.

  These operations do not change the solution set of the corresponding linear system.
]

#proposition("Row equivalence preserves solutions")[
  If one augmented matrix is obtained from another by elementary row operations, then the two augmented matrices represent systems with the same solution set.
]<prop:row-equivalence>

#proof[
  Swapping equations does not change which tuples satisfy all equations. Multiplying an equation by a non-zero scalar gives an equivalent equation. Replacing one equation by itself plus a multiple of another is reversible by subtracting the same multiple, so it also preserves the solution set.
]

#note[
  Each elementary row operation is itself an invertible transformation of the rows. This is why row reduction can simplify a system without losing information: every step can be undone by another elementary row operation.
]

#definition("Elementary matrix")[
  An *elementary matrix* is obtained by applying one elementary row operation to an identity matrix.
]

#proposition("Row operations as matrix multiplication")[
  Applying an elementary row operation to an $m times n$ matrix is the same as left-multiplying by an invertible $m times m$ elementary matrix.
]

#proof[
  Apply the row operation to $I_m$ and call the result $E$. For any $m times n$ matrix $A$, the product $E A$ performs that same operation on the rows of $A$. The row operation can be undone, so the inverse operation gives an elementary matrix $F$ with $F E = E F = I_m$. Hence $E$ is invertible.
]

== Echelon Form

#definition("Row echelon form")[
  A matrix is in *row echelon form* if:
  - every non-zero row is above every zero row,
  - each leading non-zero entry is strictly to the right of the leading non-zero entry in the row above,
  - entries below each leading entry are zero.

  A leading non-zero entry is called a *pivot*.
]

#definition("Reduced row echelon form")[
  A matrix is in *reduced row echelon form* if it is in row echelon form, every pivot is $1$, and every pivot is the only non-zero entry in its column.
]

#proposition("Reading a reduced system")[
  In a reduced augmented matrix:
  - a row of the form $0 = c$ with $c != 0$ means the system is inconsistent;
  - a variable in a pivot column is a pivot variable;
  - a variable in a non-pivot column is a free variable.
]

#example[
  Row reduction gives
  $
    mat(
      2, -2, 4, 0;
      1, 4, -3, 3;
      4, -3, 7, 1
    )
    ~
    mat(
      1, 0, 1, 0;
      0, 1, -1, 0;
      0, 0, 0, 1
    ).
  $
  The last row says $0 = 1$, so the system is inconsistent.
]

#example[
  Row reduction gives
  $
    mat(
      2, 3, -2, 1, -2;
      1, 1, 3, 5, 1;
      2, 4, 5, 7, 9
    )
    ~
    mat(
      1, 0, 0, 3, -6;
      0, 1, 0, -1, 4;
      0, 0, 1, 1, 1
    ).
  $
  Writing $x_4 = t$, the solution set is
  $
    (x_1, x_2, x_3, x_4)
      = (-6 - 3t, 4 + t, 1 - t, t),
    quad t in RR.
  $
]

== Homogeneous Systems

#definition("Homogeneous system")[
  A system of the form
  $
    A x = 0
  $
  is called *homogeneous*.
]

#proposition("Homogeneous systems are always consistent")[
  Every homogeneous system has at least the zero solution $x = 0$.
]

#note[
  The zero solution is called the *trivial solution*. A homogeneous system has non-trivial solutions exactly when at least one variable is free after row reduction.
]

#definition("Kernel and rank")[
  For a matrix $A$, the *kernel* is the solution set of the homogeneous system:
  $
    op("ker") A = {x : A x = 0}.
  $
  The *rank* of $A$ is the number of non-zero rows in a row echelon form of $A$.
]

#example[
  For
  $
    A = mat(1, 2, 3; 0, 0, 1; 2, 4, 6),
  $
  the homogeneous system $A x = 0$ gives $z = 0$ and $x + 2y = 0$. Hence
  $
    (x, y, z) = t(-2, 1, 0), quad t in RR.
  $
]

#example[
  For
  $
    A = mat(
      1, 0, 0, -7, 8;
      0, 1, 0, 3, 2;
      0, 0, 1, 1, -5
    ),
  $
  the homogeneous system has free variables $x_4 = s$ and $x_5 = t$. The solution set is
  $
    (x_1, x_2, x_3, x_4, x_5)
      = s(7, -3, -1, 1, 0) + t(-8, -2, 5, 0, 1).
  $
]

== Matrix Arithmetic

#definition("Matrix addition and scalar multiplication")[
  Matrices of the same size are added entrywise:
  $
    (A + B)_(i j) = a_(i j) + b_(i j).
  $
  Scalars multiply matrices entrywise:
  $
    (c A)_(i j) = c a_(i j).
  $
]

#definition("Matrix multiplication")[
  If $A$ is $m times n$ and $B$ is $n times p$, then $A B$ is the $m times p$ matrix with entries
  $
    (A B)_(i j) = sum_(k=1)^n a_(i k) b_(k j).
  $
]

#note[
  Matrix multiplication is defined only when the inner dimensions match. It is associative and distributive, but generally not commutative: usually $A B != B A$.
]

#example[
  Let
  $
    D = mat(x, 0; 0, y),
    quad
    E = mat(a, b; c, d).
  $
  Then
  $
    D E = mat(x a, x b; y c, y d),
    quad
    E D = mat(a x, b y; c x, d y).
  $
  These are equal for every $E$ exactly when $x = y$. Otherwise $D$ commutes only with matrices satisfying $(x - y)b = 0$ and $(y - x)c = 0$.
]

#pagebreak()

== Matrix Transformations

Matrices and linear transformations are two ways of describing the same finite-dimensional behaviour. In this course we mostly use the standard bases of $RR^n$ and $RR^m$, so a linear map can be recorded by the matrix whose columns are its outputs on the standard basis vectors.

#definition("Standard basis")[
  The *standard basis* of $RR^n$ is $e_1, dots, e_n$, where $e_j$ has a $1$ in the $j$-th position and $0$ elsewhere.
]

#definition("Matrix transformation")[
  If $A$ is an $m times n$ matrix, it defines a function
  $
    T_(A): RR^n -> RR^m,
    quad
    T_(A)(x) = A x.
  $
  This function is linear:
  $
    T_(A)(c x + d y) = c T_(A)(x) + d T_(A)(y).
  $
]

#proposition("Matrices represent linear transformations")[
  If $T: RR^n -> RR^m$ is linear, then
  $
    T(x) = A x
  $
  where the columns of $A$ are $T(e_1), dots, T(e_n)$.
]

#proof[
  Write $x = x_1 e_1 + dots + x_n e_n$. By linearity,
  $
    T(x) = x_1 T(e_1) + dots + x_n T(e_n),
  $
  which is exactly the matrix product $A x$ when the columns of $A$ are $T(e_1), dots, T(e_n)$.
]

#note[
  For a general finite-dimensional vector space, one first chooses a basis and then records coordinates relative to that basis. The standard-basis case above is the version needed for $RR^n$.
]

#proposition("Composition corresponds to multiplication")[
  If $A$ is $m times n$ and $B$ is $n times p$, then
  $
    T_(A) compose T_(B) = T_(A B).
  $
]

#proof[
  For $x in RR^p$,
  $
    (T_(A) compose T_(B))(x) = T_(A)(B x) = A(B x) = (A B)x.
  $
]

#pagebreak()

== Inverse Matrices

#definition("Identity matrix")[
  The $n times n$ *identity matrix* is
  $
    I_n = mat(
      1, 0, dots, 0;
      0, 1, dots, 0;
      dots, dots, dots, dots;
      0, 0, dots, 1
    ).
  $
  It satisfies $I_n A = A$ and $A I_n = A$ whenever the products are defined.
]

#definition("Inverse matrix")[
  A square matrix $A$ is *invertible* if there is a matrix $B$ such that
  $
    A B = B A = I.
  $
  In that case $B$ is the *inverse* of $A$ and is written $A^(-1)$.
]

#proposition("Uniqueness of inverses")[
  A square matrix has at most one inverse.
]<prop:matrix-inverse-unique>

#proof[
  If $B$ and $C$ are both inverses of $A$, then
  $
    B = B I = B (A C) = (B A) C = I C = C.
  $
]

#proposition("One-sided inverses")[
  Let $A, B, C$ be $n times n$ matrices. If
  $
    A B = C A = I_n,
  $
  then $B = C$. Hence $B = C = A^(-1)$.
]

#proof[
  We have
  $
    B = I_n B = (C A)B = C(A B) = C I_n = C.
  $
  Thus the same matrix is both a left and right inverse for $A$.
]

#proposition("Inverse of a product")[
  If $A$ and $B$ are invertible $n times n$ matrices, then $A B$ is invertible and
  $
    (A B)^(-1) = B^(-1) A^(-1).
  $
  Also, $(A^(-1))^(-1) = A$.
]

#proof[
  Since
  $
    (A B)(B^(-1) A^(-1)) = A(B B^(-1))A^(-1) = A A^(-1) = I_n
  $
  and similarly
  $
    (B^(-1) A^(-1))(A B) = I_n,
  $
  the inverse of $A B$ is $B^(-1) A^(-1)$. The statement $(A^(-1))^(-1) = A$ follows directly from the definition of inverse.
]

#proposition("Finding inverses by row reduction")[
  A square matrix $A$ is invertible exactly when $[A | I]$ row-reduces to $[I | B]$. In that case $B = A^(-1)$.
]<prop:inverse-row-reduction>

#proof[
  Row operations on $[A | I]$ are left multiplication by elementary matrices. A sequence of row operations is therefore left multiplication by some invertible matrix $E$.

  If the reduction gives $[I | B]$, then $E A = I$ and $E I = B$. Thus $B = E$ and $B A = I$. Since $E$ is invertible, $A = E^(-1)$, so $B = A^(-1)$.

  Conversely, if $A$ is invertible, row reduction cannot get stuck before a pivot appears in every column; otherwise there would be a non-zero vector $x$ with $A x = 0$, contradicting $x = A^(-1) A x = 0$. Hence $A$ row-reduces to $I$, and applying the same row operations to the right half gives $A^(-1)$.
]

#example[
  Let
  $
    A = mat(0, 1, 2; 1, 0, 3; 0, 0, 1).
  $
  Row-reducing $[A | I]$ gives
  $
    mat(
      0, 1, 2, 1, 0, 0;
      1, 0, 3, 0, 1, 0;
      0, 0, 1, 0, 0, 1
    )
    ~
    mat(
      1, 0, 0, 0, 1, -3;
      0, 1, 0, 1, 0, -2;
      0, 0, 1, 0, 0, 1
    ).
  $
  Hence
  $
    A^(-1) = mat(0, 1, -3; 1, 0, -2; 0, 0, 1).
  $
]

#theorem("Invertibility criteria")[
  For an $n times n$ matrix $A$, the following statements are equivalent.
  - $A$ is invertible.
  - $A$ has a right inverse: there exists a matrix $B$ such that $A B = I_n$.
  - $op("rank")(A) = n$.
  - $op("ker") A = {0}$.
]

#proof[
  If $A$ is invertible and $x in op("ker") A$, then
  $
    x = A^(-1) A x = A^(-1) 0 = 0,
  $
  so $op("ker") A = {0}$.

  If $op("ker") A = {0}$, then the homogeneous system has no free variable. Thus every column has a pivot, so $op("rank")(A) = n$.

  If $op("rank")(A) = n$, then $A x = b$ has a unique solution for every $b in RR^n$. In particular, for each standard basis vector $e_i$, choose the unique vector $x^(i)$ with $A x^(i) = e_i$. Putting these vectors as the columns of a matrix $B$ gives $A B = I_n$, so $A$ has a right inverse.

  Finally, if $A B = I_n$, then $op("ker") B = {0}$ because $B x = 0$ implies $x = A B x = 0$. By the previous implications, $B$ has a right inverse $C$. Since $A B = I_n$ and $B C = I_n$, the one-sided inverse result gives $A = C$, so $A$ is the inverse of $B$ and hence is invertible.
]

#proposition("Transpose and inverse")[
  If $A$ is invertible, then $A^T$ is invertible and
  $
    (A^T)^(-1) = (A^(-1))^T.
  $
]<prop:transpose-inverse>

#proof[
  Since $A A^(-1) = I$ and $A^(-1) A = I$, taking transposes gives
  $
    (A^(-1))^T A^T = I,
    quad
    A^T (A^(-1))^T = I.
  $
]

#pagebreak()

== Euclidean Vectors

#note[Found in the 2026 tutorials. This section collects the vector-geometry tools used in tutorial questions.]

#definition("Dot product and norm")[
  For vectors
  $
    u = mat(u_1; dots; u_n)
    quad "and" quad
    v = mat(v_1; dots; v_n)
  $
  in $RR^n$, the *dot product* is
  $
    u dot v = sum_(i=1)^n u_i v_i.
  $
  The *norm* or *length* of $u$ is
  $
    norm(u) = sqrt(u dot u).
  $
]

#definition("Orthogonality and angle")[
  Two vectors $u$ and $v$ are *orthogonal* if $u dot v = 0$. If $u$ and $v$ are non-zero, the angle $theta$ between them is determined by
  $
    cos theta = (u dot v) / (norm(u) norm(v)).
  $
]

#theorem("Cauchy-Schwarz inequality")[
  For all $u, v in RR^n$,
  $
    abs(u dot v) <= norm(u) norm(v).
  $
]<thm:cauchy-schwarz>

#proof[
  If $v = 0$, then both sides are $0$. Otherwise, for every $t in RR$,
  $
    0 <= norm(u - t v)^2
      = norm(u)^2 - 2t(u dot v) + t^2 norm(v)^2.
  $
  Choose $t = (u dot v) / norm(v)^2$. Substitution gives
  $
    0 <= norm(u)^2 - (u dot v)^2 / norm(v)^2.
  $
  Multiplying by $norm(v)^2$ gives $(u dot v)^2 <= norm(u)^2 norm(v)^2$, and taking square roots gives the result.
]

#theorem("Vector triangle inequality")[
  For all $u, v in RR^n$,
  $
    norm(u + v) <= norm(u) + norm(v).
  $
]<thm:vector-triangle>

#proof[
  Squaring the left-hand side gives
  $
    norm(u + v)^2
      = norm(u)^2 + 2 u dot v + norm(v)^2.
  $
  By #link(<thm:cauchy-schwarz>)[Cauchy-Schwarz],
  $
    2 u dot v <= 2 abs(u dot v) <= 2 norm(u) norm(v).
  $
  Hence
  $
    norm(u + v)^2 <= (norm(u) + norm(v))^2.
  $
  Both sides are non-negative, so taking square roots proves the result.
]

#proposition("Parallelogram law")[
  For all $u, v in RR^n$,
  $
    norm(u + v)^2 + norm(u - v)^2 = 2 norm(u)^2 + 2 norm(v)^2.
  $
]

#proof[
  Expand both squared norms using the dot product:
  $
    norm(u + v)^2 = norm(u)^2 + 2u dot v + norm(v)^2,
  $
  $
    norm(u - v)^2 = norm(u)^2 - 2u dot v + norm(v)^2.
  $
  Adding cancels the dot-product terms.
]

#corollary("Equal lengths from orthogonal diagonals")[
  If $u + v$ and $u - v$ are orthogonal, then $norm(u) = norm(v)$.
]

#proof[
  Orthogonality gives
  $
    0 = (u + v) dot (u - v) = norm(u)^2 - norm(v)^2.
  $
  Hence $norm(u)^2 = norm(v)^2$, and norms are non-negative.
]

#definition("Projection")[
  If $a != 0$, the projection of $b$ onto $a$ is
  $
    op("proj")_a b = (b dot a) / (a dot a) a.
  $
  The component of $b$ orthogonal to $a$ is
  $
    op("orth")_a b = b - op("proj")_a b.
  $
]

#proposition("Projection residual is orthogonal")[
  If $a != 0$, then $op("orth")_a b$ is orthogonal to $a$.
]

#proof[
  Compute
  $
    a dot (b - op("proj")_a b)
      = a dot b - a dot ((b dot a) / (a dot a) a)
      = a dot b - (b dot a) = 0.
  $
]

#definition("Cross product in three dimensions")[
  For vectors
  $
    u = mat(u_1; u_2; u_3)
    quad "and" quad
    v = mat(v_1; v_2; v_3),
  $
  the *cross product* is
  $
    u times v
      = mat(
        u_2 v_3 - u_3 v_2;
        u_3 v_1 - u_1 v_3;
        u_1 v_2 - u_2 v_1
      ).
  $
  It is orthogonal to both $u$ and $v$.
]

#example[
  Let
  $
    A = mat(1; 2; 3),
    quad
    B = mat(7; 2; 1),
    quad
    C = mat(1; 3; 3).
  $
  Then
  $
    B - A = mat(6; 0; -2),
    quad
    C - A = mat(0; 1; 0).
  $
  Since $(B - A) dot (C - A) = 0$, the angle at $A$ is $pi / 2$.
]

#example[
  A vector orthogonal to the plane through $A$, $B$, and $C$ is
  $
    (B - A) times (C - A)
      = mat(6; 0; -2) times mat(0; 1; 0)
      = mat(2; 0; 6).
  $
  The length of the projection of $B - A$ onto $C - A$ is
  $
    abs((B - A) dot (C - A)) / norm(C - A) = 0.
  $
]

#example[
  Since
  $
    C - B = mat(-6; 1; 2),
  $
  a unit vector parallel to $C - B$ is
  $
    1 / sqrt(41) mat(-6; 1; 2).
  $
  A vector orthogonal to both $C - B$ and the $z$-axis is
  $
    mat(-6; 1; 2) times mat(0; 0; 1) = mat(1; 6; 0),
  $
  so a unit vector with this property is
  $
    1 / sqrt(37) mat(1; 6; 0).
  $
]

#pagebreak()
