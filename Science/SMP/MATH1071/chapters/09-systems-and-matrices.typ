#import "/lib.typ": *

= Systems of Linear Equations and Matrices

Linear algebra begins with the problem of solving several linear equations at once. The main point of matrix notation is that the same row operations solve the system, describe the set of solutions, and later decide invertibility.

== Euclidean Vectors

#definition("Dot product and norm")[
  For vectors $u = mat(u_1; dots; u_n)$ and $v = mat(v_1; dots; v_n)$ in $RR^n$, the *dot product* is
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
  For $u = mat(u_1; u_2; u_3)$ and $v = mat(v_1; v_2; v_3)$, the *cross product* is
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

#proposition("Finding inverses by row reduction")[
  A square matrix $A$ is invertible exactly when $[A | I]$ row-reduces to $[I | B]$. In that case $B = A^(-1)$.
]<prop:inverse-row-reduction>

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
