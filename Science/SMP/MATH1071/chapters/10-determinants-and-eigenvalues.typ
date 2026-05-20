#import "/lib.typ": *

= Determinants, Eigenvalues, and Eigenvectors

Determinants are scalar tests for invertibility. Eigenvalues and eigenvectors record directions on which a matrix acts by simple scaling. These ideas are tightly connected: eigenvalues are found by applying a determinant to $A - lambda I$.

== Determinants

#definition("Determinant")[
  The *determinant* assigns a scalar $op("det") A$ to each square matrix $A$. It measures whether the rows or columns are independent; below we prove that a square matrix is invertible exactly when its determinant is non-zero.

  The determinant is defined recursively. If $A = mat(a)$ is $1 times 1$, then $op("det") A = a$. If $A$ is $n times n$ with $n >= 2$, delete row $1$ and column $j$ to obtain the $(n - 1) times (n - 1)$ matrix $A_(1 j)$. Then
  $
    op("det") A = sum_(j=1)^n (-1)^(1 + j) a_(1 j) op("det") A_(1 j).
  $

  For
  $
    A = mat(a, b; c, d),
  $
  the determinant is
  $
    op("det") A = a d - b c.
  $
]

#definition("Minors and cofactors")[
  Let $A$ be an $n times n$ matrix. Write $A_(i j)$ for the matrix obtained from $A$ by deleting row $i$ and column $j$. The $(i, j)$-*minor* is
  $
    M_(i j) = op("det") A_(i j).
  $

  The $(i, j)$-*cofactor* is
  $
    C_(i j) = (-1)^(i + j) M_(i j).
  $
]

#theorem("Cofactor expansion")[
  The determinant of an $n times n$ matrix can be expanded along any row or any column:
  $
    op("det") A = sum_(j=1)^n a_(i j) C_(i j)
  $
  for a fixed row $i$, and
  $
    op("det") A = sum_(i=1)^n a_(i j) C_(i j)
  $
  for a fixed column $j$.
]

#note[
  Cofactor expansion is usually best when a row or column has many zeroes. For larger matrices, row operations are usually faster.
]

#proposition("Determinants and row operations")[
  Let $A$ be a square matrix.
  - Swapping two rows multiplies the determinant by $-1$.
  - Multiplying one row by $c$ multiplies the determinant by $c$.
  - Adding a multiple of one row to another row does not change the determinant.
]

#note[
  These rules are the computational backbone of determinants in this course. The recursive definition is useful for explaining what the determinant is; row operations are usually better for computing large determinants.
]

#proposition("Triangular determinant")[
  If $A$ is upper triangular or lower triangular, then $op("det") A$ is the product of the diagonal entries.
]<prop:triangular-det>

#example[
  For
  $
    A = mat(x, 1, 2; 1, x, 3; 0, 0, 1),
  $
  cofactor expansion along the last row gives
  $
    op("det") A = op("det") mat(x, 1; 1, x) = x^2 - 1.
  $
  Hence $A$ is non-invertible exactly when $x = plus.minus 1$.
]

== Determinant Laws

#theorem("Basic determinant laws")[
  If $A$ and $B$ are $n times n$ matrices, then
  $
    op("det")(A B) = op("det")(A) op("det")(B),
    quad
    op("det")(A^T) = op("det")(A).
  $
  If $A$ is invertible, then
  $
    op("det")(A^(-1)) = 1 / (op("det")(A)).
  $
]<thm:det-laws>

#theorem("Invertibility and determinant")[
  A square matrix $A$ is invertible if and only if
  $
    op("det") A != 0.
  $
]<thm:det-invertible>

#diagram(caption: [
  When $det A = 0$, the associated linear map collapses area: two-dimensional input can land on a line, so the map cannot be invertible.
])[
  #canvas(length: 1cm, {
    let axis = 0.55pt + luma(145)
    let blue-line = blue
    let green-line = green
    draw.line((0.45, 0.45), (3.1, 0.45), stroke: axis, mark: (end: ">"))
    draw.line((0.65, 0.25), (0.65, 2.85), stroke: axis, mark: (end: ">"))
    draw.line((1.05, 0.8), (2.2, 0.8), stroke: 1pt + blue-line)
    draw.line((2.2, 0.8), (2.2, 1.95), stroke: 1pt + blue-line)
    draw.line((2.2, 1.95), (1.05, 1.95), stroke: 1pt + blue-line)
    draw.line((1.05, 1.95), (1.05, 0.8), stroke: 1pt + blue-line)
    draw.content((1.62, 2.25), text(size: 8.5pt, fill: blue)[area $> 0$])

    draw.line((3.45, 1.55), (4.35, 1.55), stroke: 0.75pt + black, mark: (end: ">"))
    draw.content((3.9, 1.9), text(size: 8.5pt)[$A$])

    draw.line((4.75, 0.45), (7.4, 0.45), stroke: axis, mark: (end: ">"))
    draw.line((4.95, 0.25), (4.95, 2.85), stroke: axis, mark: (end: ">"))
    draw.line((5.25, 1.0), (7.15, 2.15), stroke: 2pt + green-line)
    draw.circle((5.55, 1.18), radius: 0.055, fill: green-line, stroke: none)
    draw.circle((6.0, 1.45), radius: 0.055, fill: green-line, stroke: none)
    draw.circle((6.45, 1.72), radius: 0.055, fill: green-line, stroke: none)
    draw.content((6.15, 2.45), text(size: 8.5pt, fill: green)[area $= 0$])
  })
]

#example[
  Suppose $op("det")(A B^2) = 4$ and $op("det")(A^2 B) = 2$. Let $x = op("det") A$ and $y = op("det") B$. Then
  $
    x y^2 = 4,
    quad
    x^2 y = 2.
  $
  Dividing gives $y / x = 2$, so $y = 2x$. Substituting into $x^2 y = 2$ gives $2x^3 = 2$, hence
  $
    op("det") A = 1,
    quad
    op("det") B = 2.
  $
]

#example[
  If $A^2 = A$, then
  $
    op("det")(A)^2 = op("det")(A).
  $
  Hence $op("det")(A)(op("det")(A) - 1) = 0$, so $op("det")(A) = 0$ or $op("det")(A) = 1$.
]

#note[The orthogonal-matrix facts in this subsection are from the 2026 tutorials.]

#definition("Orthogonal matrix")[
  A square matrix $Q$ is *orthogonal* if
  $
    Q^(-1) = Q^T.
  $
]

#proposition("Determinant of an orthogonal matrix")[
  If $Q$ is orthogonal, then $op("det") Q = plus.minus 1$.
]

#proof[
  Since $Q^T Q = I$,
  $
    op("det")(Q^T Q) = op("det") I.
  $
  Using #link(<thm:det-laws>)[the determinant laws], this gives $(op("det") Q)^2 = 1$.
]

#proposition("Products of orthogonal matrices")[
  If $X$ and $Y$ are orthogonal matrices of the same size, then $X Y$ is orthogonal.
]

#proof[
  Since $X^(-1) = X^T$ and $Y^(-1) = Y^T$,
  $
    (X Y)^(-1) = Y^(-1) X^(-1) = Y^T X^T = (X Y)^T.
  $
]

#proposition("Orthogonal matrices preserve dot products")[
  If $Q$ is orthogonal, then
  $
    (Q x) dot (Q y) = x dot y
  $
  for all $x, y in RR^n$. Hence orthogonal matrices preserve lengths and angles.
]

#proof[
  Since $Q^T Q = I$,
  $
    (Q x) dot (Q y) = x^T Q^T Q y = x^T y = x dot y.
  $
]

#note[The trace, symmetry, and nilpotent-matrix facts below are from the 2026 tutorials.]

#definition("Trace")[
  The *trace* of a square matrix is the sum of its diagonal entries:
  $
    op("tr")(A) = a_(1 1) + dots + a_(n n).
  $
]

#definition("Symmetric and skew-symmetric matrices")[
  A square matrix $A$ is *symmetric* if $A^T = A$, and *skew-symmetric* if $A^T = -A$.
]

#proposition("Useful transpose facts")[
  For any square matrix $A$:
  - $A + A^T$ is symmetric;
  - if $A$ is skew-symmetric, then $op("tr")(A) = 0$;
  - if $A$ is skew-symmetric and has odd size, then $op("det") A = 0$.
]

#proof[
  First,
  $
    (A + A^T)^T = A^T + A = A + A^T.
  $
  If $A$ is skew-symmetric, then every diagonal entry satisfies $a_(i i) = -a_(i i)$, so $a_(i i) = 0$ and $op("tr")(A) = 0$. If $A$ is $n times n$ and $n$ is odd, then
  $
    op("det") A = op("det")(A^T) = op("det")(-A) = (-1)^n op("det") A = -op("det") A,
  $
  so $op("det") A = 0$.
]

#definition("Nilpotent matrix")[
  A square matrix $A$ is *nilpotent* if $A^k = 0$ for some $k in NN$.
]

#proposition("Nilpotent matrices are singular")[
  If $A$ is nilpotent, then $op("det") A = 0$.
]

#proof[
  If $A^k = 0$, then
  $
    (op("det") A)^k = op("det")(A^k) = op("det") 0 = 0.
  $
  Hence $op("det") A = 0$.
]

#proposition("Vandermonde determinant")[
  #note[Starred result from the 2026 tutorials.]

  For
  $
    V_n = mat(
      1, x_1, x_1^2, dots, x_1^(n - 1);
      1, x_2, x_2^2, dots, x_2^(n - 1);
      dots, dots, dots, dots, dots;
      1, x_n, x_n^2, dots, x_n^(n - 1)
    ),
  $
  we have
  $
    op("det") V_n = product_(1 <= i < j <= n) (x_j - x_i).
  $
]

#proof[
  The determinant is a polynomial in $x_n$ of degree at most $n - 1$. If $x_n = x_i$ for some $i < n$, then two rows are equal, so the determinant is $0$. Hence
  $
    product_(i=1)^(n - 1) (x_n - x_i)
  $
  divides $op("det") V_n$ as a polynomial in $x_n$. Comparing the coefficient of $x_n^(n - 1)$ gives the determinant of $V_(n - 1)$. Induction gives the formula.
]

== Characteristic Polynomials

#definition("Eigenvalue and eigenvector")[
  Let $A$ be a square matrix. A scalar $lambda$ is an *eigenvalue* of $A$ if there is a non-zero vector $v$ such that
  $
    A v = lambda v.
  $
  Such a vector $v$ is an *eigenvector* for $lambda$.
]

#definition("Eigenspace")[
  The *eigenspace* for an eigenvalue $lambda$ is
  $
    E_lambda = op("ker")(A - lambda I)
      = {v : (A - lambda I)v = 0}.
  $
  The zero vector belongs to the eigenspace, but is not called an eigenvector.
]

#theorem("Characteristic equation")[
  A scalar $lambda$ is an eigenvalue of $A$ if and only if
  $
    op("det")(A - lambda I) = 0.
  $
  The polynomial $op("det")(A - lambda I)$ is the *characteristic polynomial* of $A$.
]<thm:characteristic-equation>

#proof[
  The equation $A v = lambda v$ is equivalent to $(A - lambda I)v = 0$. This has a non-zero solution exactly when $A - lambda I$ is non-invertible, which is equivalent to $op("det")(A - lambda I) = 0$ by #link(<thm:det-invertible>)[invertibility and determinant].
]

#example[
  For
  $
    A = mat(5, 0, 0; 1, 2, 1; 1, 1, 2),
  $
  we have
  $
    op("det")(A - lambda I)
      = op("det") mat(5 - lambda, 0, 0; 1, 2 - lambda, 1; 1, 1, 2 - lambda)
  $
  $
      = (5 - lambda)((2 - lambda)^2 - 1)
      = (5 - lambda)(3 - lambda)(1 - lambda).
  $
  Hence the eigenvalues are $5$, $3$, and $1$.
]

== Finding Eigenvectors

#proposition("How to find eigenvectors")[
  Once $lambda$ is known, solve the homogeneous system
  $
    (A - lambda I)v = 0.
  $
  The non-zero solutions are the eigenvectors for $lambda$.
]

#example[
  Continuing the previous example, row reduction gives:
  $
    E_5 = op("span"){mat(2; 1; 1)},
    quad
    E_3 = op("span"){mat(0; 1; 1)},
    quad
    E_1 = op("span"){mat(0; -1; 1)}.
  $
  Thus each eigenspace has dimension $1$.
]

#example[
  Let
  $
    A = mat(a, 2, 1; -1, 2, 1; 2, -2, -1).
  $
  Then
  $
    op("det")(A - lambda I)
      = (a - lambda) lambda (lambda - 1).
  $
  The eigenvalues are therefore among $0$, $1$, and $a$. Corresponding eigenvectors are
  $
    lambda = 0: mat(0; 1; -2),
    quad
    lambda = 1: mat(-1; a; -(a + 1)),
    quad
    lambda = a: mat(-a; 1; -2).
  $
  If $a in.not {0, 1}$, these give three distinct one-dimensional eigenspaces. If $a = 0$ or $a = 1$, there are two distinct eigenvalues, each with a one-dimensional eigenspace.
]

== Useful Eigenvalue Facts

#proposition("Shifted eigenvalues")[
  If $lambda$ is an eigenvalue of $A$ with eigenvector $v$, then $lambda + c$ is an eigenvalue of $A + c I$ with the same eigenvector.
]

#proof[
  Since $A v = lambda v$,
  $
    (A + c I)v = A v + c v = (lambda + c)v.
  $
]

#proposition("Powers and inverses")[
  Suppose $A v = lambda v$ with $v != 0$.
  - For $n in NN$, $A^n v = lambda^n v$.
  - If $A$ is invertible, then $lambda != 0$ and $A^(-1)v = lambda^(-1)v$.
]

#proof[
  The power statement follows by induction. If $A$ is invertible, then
  $
    v = A^(-1) A v = A^(-1) lambda v,
  $
  so $A^(-1)v = lambda^(-1)v$.
]

#proposition("Transpose has the same eigenvalues")[
  A square matrix $A$ and its transpose $A^T$ have the same eigenvalues.
]

#proof[
  Their characteristic polynomials are equal:
  $
    op("det")(A^T - lambda I)
      = op("det")((A - lambda I)^T)
      = op("det")(A - lambda I).
  $
  Hence they have the same roots.
]

#proposition("Eigenvectors for distinct eigenvalues")[
  Eigenvectors corresponding to distinct eigenvalues are linearly independent.
]<prop:distinct-eigenvectors-independent>

#proof[
  For two eigenvectors, suppose $c_1 v_1 + c_2 v_2 = 0$, where
  $
    A v_1 = lambda_1 v_1,
    quad
    A v_2 = lambda_2 v_2,
    quad
    lambda_1 != lambda_2.
  $
  Applying $A$ gives $c_1 lambda_1 v_1 + c_2 lambda_2 v_2 = 0$. Subtracting $lambda_2(c_1 v_1 + c_2 v_2) = 0$ gives
  $
    c_1(lambda_1 - lambda_2)v_1 = 0.
  $
  Since $v_1 != 0$ and $lambda_1 != lambda_2$, $c_1 = 0$. Then $c_2 = 0$.

  The same idea proves the general finite case by induction: apply $A$ to a dependence relation, subtract one eigenvalue times the original relation, and use the induction hypothesis on the remaining eigenvectors.
]

#proposition("Positive quadratic forms and eigenvalues")[
  Let $A$ be a symmetric $2 times 2$ matrix. If
  $
    x^T A x > 0
  $
  for every non-zero $x in RR^2$, then every eigenvalue of $A$ is positive.
]

#proof[
  If $A v = lambda v$ with $v != 0$, then
  $
    v^T A v = v^T(lambda v) = lambda (v^T v) = lambda norm(v)^2.
  $
  The left-hand side is positive and $norm(v)^2 > 0$, so $lambda > 0$.
]

#pagebreak()
