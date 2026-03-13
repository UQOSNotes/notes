#import "/lib.typ": *

= Algebraic Structures

The integers, rationals, reals, and complex numbers all support arithmetic with rich structural properties that can be studied in the abstract. By identifying the essential axioms behind operations, abstract algebra yields general theorems applicable simultaneously to all structures satisfying those axioms. This chapter introduces two fundamental algebraic structures: *groups*, which capture the notion of a set with a single associative operation admitting an identity and inverses; and *fields*, which generalise the arithmetic of $QQ$, $RR$, and $CC$ by requiring two compatible operations linked by distributivity.

In this chapter we study:
- *Groups:* sets equipped with one binary operation satisfying closure, associativity, identity, and inverses
- *Fields:* sets with two binary operations linked by distributivity, generalising the arithmetic of familiar number systems

== Groups

A group is the simplest and most fundamental algebraic structure. The integers under addition, the non-zero rationals under multiplication, and the integers modulo $n$ under addition all form groups. Abstracting their common features reveals properties that hold for all groups simultaneously.

=== Definition and Examples

#definition[
  A *group* is an ordered pair $(G, *)$ where $G$ is a non-empty set and $*$ is a binary operation on $G$ satisfying the following four axioms:
  1. *Closure:* For all $a, b in G$, $a * b in G$.
  2. *Associativity:* For all $a, b, c in G$, $(a * b) * c = a * (b * c)$.
  3. *Identity:* There exists $e in G$ such that $a * e = e * a = a$ for all $a in G$.
  4. *Inverses:* For each $a in G$, there exists $a^(-1) in G$ such that
  $ a * a^(-1) = a^(-1) * a = e. $
  If additionally $a * b = b * a$ for all $a, b in G$, the group is called *abelian* (or *commutative*).
]

#note[
  Closure is sometimes taken as implicit in the requirement that $*$ is a binary operation on $G$, since a binary operation on $G$ maps $G times G$ into $G$ by definition. Many texts therefore list only three group axioms: associativity, identity, and inverses.
]

#example[
  *Integers under addition.* $(ZZ, +)$ is an abelian group. The identity is $0$, since $a + 0 = 0 + a = a$. The inverse of $a$ is $-a$, since $a + (-a) = 0$. Closure and associativity are standard properties of integer arithmetic.
]

#example[
  *Non-zero rationals under multiplication.* $(QQ without {0}, times)$ is an abelian group. The identity is $1$, and the inverse of $a != 0$ is $1/a$, which belongs to $QQ without {0}$. The set $QQ$ itself does not form a group under multiplication because $0$ has no multiplicative inverse.
]

#example[
  *Integers modulo $n$.* Let $n >= 2$ be a positive integer. The set $ZZ_n = {[0], [1], dots, [n-1]}$ of residue classes modulo $n$, equipped with addition modulo $n$ (denoted $+_n$), is an abelian group. The identity is $[0]$, and the inverse of $[a]$ is $[n - a]$, since $[a] +_n [n - a] = [n] = [0]$.
]

#example[
  The real numbers $(RR, +)$ and the complex numbers $(CC, +)$ are abelian groups under addition, with identity $0$ and inverse $-a$.
]

#example[
  *The trivial group.* The set ${e}$ with the single operation $e * e = e$ is a group, called the *trivial group*. It is the unique group of order $1$.
]

#example[
  *Non-examples.*
  - $(ZZ, times)$ is not a group: while $1$ serves as an identity, an integer such as $2$ has no multiplicative inverse in $ZZ$.
  - $(NN, +)$ is not a group: the identity $0$ exists, but a positive integer $a$ has no additive inverse in $NN$ (since $-a in.not NN$).
]

For finite groups, the binary operation can be displayed compactly in a table.

#definition[
  A *Cayley table* (or *operation table*) for a finite group $(G, *)$ is an $n times n$ table, where $n = |G|$, whose rows and columns are each indexed by the elements of $G$ in some fixed order. The entry in the row labelled $a$ and the column labelled $b$ is $a * b$.
]

#example[
  The Cayley table for $(ZZ_4, +_4)$:

  #table(
    columns: 5,
    align: center,
    inset: 8pt,
    stroke: 0.5pt,
    $+_4$, $[0]$, $[1]$, $[2]$, $[3]$,
    $[0]$, $[0]$, $[1]$, $[2]$, $[3]$,
    $[1]$, $[1]$, $[2]$, $[3]$, $[0]$,
    $[2]$, $[2]$, $[3]$, $[0]$, $[1]$,
    $[3]$, $[3]$, $[0]$, $[1]$, $[2]$,
  )
]

#note[
  In a group's Cayley table, every element appears exactly once in each row and exactly once in each column. This is the *Latin square property*, and it follows from the cancellation laws proved in the next section.
]

=== Elementary Properties of Groups

Several important properties follow directly from the group axioms.

#theorem("Uniqueness of the identity")[
  In any group $(G, *)$, the identity element is unique.
]

#proof[
  Suppose $e$ and $e'$ are both identity elements of $G$. Then:
  $ e = e * e' = e', $
  where the first equality uses $e'$ as an identity applied to $e$, and the second uses $e$ as an identity applied to $e'$. Hence $e = e'$.
]

#theorem("Uniqueness of inverses")[
  In any group $(G, *)$, every element has a unique inverse.
]

#proof[
  Let $a in G$ and suppose $b, c in G$ both satisfy $a * b = b * a = e$ and $a * c = c * a = e$. Then:
  $ b = b * e = b * (a * c) = (b * a) * c = e * c = c, $
  where associativity is used at the third step. Hence $b = c$.
]

#theorem("Cancellation laws")[
  Let $(G, *)$ be a group and let $a, b, c in G$.
  - *Left cancellation:* If $a * b = a * c$, then $b = c$.
  - *Right cancellation:* If $b * a = c * a$, then $b = c$.
]

#proof[
  We prove left cancellation; the proof of right cancellation is analogous. Suppose $a * b = a * c$. Multiplying both sides on the left by $a^(-1)$:
  $ a^(-1) * (a * b) = a^(-1) * (a * c). $
  By associativity, $(a^(-1) * a) * b = (a^(-1) * a) * c$, so $e * b = e * c$, and therefore $b = c$.
]

#theorem[
  In any group $(G, *)$, for all $a, b in G$:
  1. $(a^(-1))^(-1) = a$.
  2. $(a * b)^(-1) = b^(-1) * a^(-1)$.
]

#proof[
  *(1)* Since $a * a^(-1) = a^(-1) * a = e$, the element $a$ satisfies the defining property of the inverse of $a^(-1)$. By the uniqueness of inverses, $(a^(-1))^(-1) = a$.

  *(2)* We verify that $b^(-1) * a^(-1)$ is the inverse of $a * b$ by checking both products equal $e$:
  $ (a * b) * (b^(-1) * a^(-1)) = a * (b * b^(-1)) * a^(-1) = a * e * a^(-1) = a * a^(-1) = e, $
  $ (b^(-1) * a^(-1)) * (a * b) = b^(-1) * (a^(-1) * a) * b = b^(-1) * e * b = b^(-1) * b = e. $
  By the uniqueness of inverses, $(a * b)^(-1) = b^(-1) * a^(-1)$.
]

#remark[
  The formula $(a * b)^(-1) = b^(-1) * a^(-1)$ is sometimes called the *socks-and-shoes property*: to undo the combined effect of two operations, reverse the order. This reversal is necessary in non-abelian groups where $a * b != b * a$ in general.
]

=== Subgroups

A subgroup is a subset of a group that is itself a group under the same operation.

#definition[
  Let $(G, *)$ be a group. A non-empty subset $H subset.eq G$ is a *subgroup* of $G$, written $H <= G$, if $(H, *)$ is a group under the same operation. This requires:
  1. *Closure:* For all $a, b in H$, $a * b in H$.
  2. *Identity:* The identity $e$ of $G$ belongs to $H$.
  3. *Inverses:* For all $a in H$, $a^(-1) in H$.
  Associativity is inherited automatically from $G$.
]

#note[
  The identity condition is implied by non-emptiness and closure under inverses: for any $a in H$, we have $a^(-1) in H$, and then $e = a * a^(-1) in H$ by closure. Many texts therefore state the subgroup conditions as: non-emptiness, closure under the operation, and closure under inverses.
]

#example[
  Every group $G$ has at least two subgroups:
  - The *trivial subgroup* ${e}$, containing only the identity.
  - $G$ itself.
  These are the *improper* subgroups of $G$. A subgroup $H$ with ${e} subset H subset G$ is called a *proper* subgroup.
]

#example[
  *Even integers.* $(2ZZ, +)$ is a subgroup of $(ZZ, +)$:
  - *Closure:* the sum of two even integers is even.
  - *Identity:* $0 in 2ZZ$.
  - *Inverses:* if $a in 2ZZ$ then $-a in 2ZZ$.
]

#example[
  $({1, -1}, times)$ is a subgroup of $(QQ without {0}, times)$:
  - *Closure:* $1 times 1 = 1$, $1 times (-1) = -1$, $(-1) times (-1) = 1$.
  - *Identity:* $1 in {1, -1}$.
  - *Inverses:* $1^(-1) = 1$ and $(-1)^(-1) = -1$.
]

The following criterion gives a concise way to verify that a subset is a subgroup.

#theorem("Subgroup Test")[
  Let $(G, *)$ be a group and let $H$ be a non-empty subset of $G$. Then $H$ is a subgroup of $G$ if and only if
  $ forall a, b in H, quad a * b^(-1) in H. $
]

#proof[
  ($arrow.r$) If $H$ is a subgroup and $a, b in H$, then $b^(-1) in H$ by closure under inverses, and $a * b^(-1) in H$ by closure under the operation.

  ($arrow.l$) Suppose $H$ is non-empty and $a * b^(-1) in H$ for all $a, b in H$.
  - *Identity:* Since $H$ is non-empty, choose any $a in H$. Setting $b = a$ gives $a * a^(-1) = e in H$.
  - *Inverses:* For any $a in H$, we have $e in H$. Applying the hypothesis with first element $e$ and second element $a$: $e * a^(-1) = a^(-1) in H$.
  - *Closure:* For any $a, b in H$, the previous step gives $b^(-1) in H$. Applying the hypothesis with $a$ and $b^(-1)$: $a * (b^(-1))^(-1) = a * b in H$.
]

#definition[
  The *order* of a group $G$, written $|G|$, is the cardinality of the set $G$. A group is *finite* if $|G|$ is finite, and *infinite* otherwise.
]

#example[
  $|ZZ_n| = n$ for all $n >= 1$. The groups $(ZZ, +)$, $(QQ without {0}, times)$, $(RR, +)$, and $(CC, +)$ are all infinite.
]

== Fields

The integers, rationals, reals, and complex numbers all support both addition and multiplication, with the two operations linked by distributivity. A field is the abstract structure capturing exactly these properties.

=== Definition and Examples

#definition[
  A *field* is a set $F$ together with two binary operations $+$ (addition) and $times$ (multiplication) satisfying:
  1. $(F, +)$ is an abelian group with identity element $0$ (the *additive identity*).
  2. $(F without {0}, times)$ is an abelian group with identity element $1$ (the *multiplicative identity*).
  3. *Distributivity:* For all $a, b, c in F$,
  $ a times (b + c) = (a times b) + (a times c). $
  The additive inverse of $a$ is written $-a$; the multiplicative inverse of a non-zero $a$ is written $a^(-1)$ (or $1/a$).
]

#remark[
  A field can equivalently be described as a commutative ring with unity (satisfying $1 != 0$) in which every non-zero element has a multiplicative inverse.
]

#example[
  *Standard infinite fields.*
  - $(QQ, +, times)$: the rational numbers form a field.
  - $(RR, +, times)$: the real numbers form a field.
  - $(CC, +, times)$: the complex numbers form a field.
  In each case, the field axioms are the familiar arithmetic properties of those number systems.
]

#example[
  *Finite fields $FF_p$.* Let $p$ be a prime. The set $ZZ_p = {[0], [1], dots, [p-1]}$ with addition $+_p$ and multiplication $times_p$ modulo $p$ forms a field, denoted $FF_p$:
  - $(ZZ_p, +_p)$ is an abelian group (shown in the Groups section above).
  - Every non-zero $[a]$ has a multiplicative inverse modulo $p$: since $p$ is prime and $1 <= a <= p-1$, we have $gcd(a, p) = 1$. By Bézout's identity, there exist integers $u, v$ with $a u + p v = 1$, so $[a] times_p [u] = [1]$.
  - Distributivity holds because it holds in $ZZ$.

  For example, in $FF_5$: $[2]^(-1) = [3]$ since $2 times 3 = 6 equiv 1 quad (mod 5)$, and $[4]^(-1) = [4]$ since $4 times 4 = 16 equiv 1 quad (mod 5)$.
]

#example[
  *Non-examples.*
  - $(ZZ, +, times)$: the integers are not a field, since $2$ has no multiplicative inverse in $ZZ$ (as $1/2 in.not ZZ$).
  - $(ZZ_n, +_n, times_n)$ for composite $n$: not a field. In $ZZ_6$, for instance, $[2] times_6 [3] = [0]$ while $[2] != [0]$ and $[3] != [0]$. A product of two non-zero elements equals zero, which cannot occur in a field (as proved in the next section).
]

=== Properties of Fields

The field axioms, together with the group properties established earlier, imply several fundamental arithmetic identities.

#theorem[
  Let $F$ be a field. For all $a in F$:
  $ 0 times a = a times 0 = 0. $
]

#proof[
  Using $0 = 0 + 0$ and the distributive law:
  $ 0 times a = (0 + 0) times a = (0 times a) + (0 times a). $
  Adding $-(0 times a)$ to both sides yields $0 = 0 times a$. The identity $a times 0 = 0$ follows by commutativity of multiplication in a field.
]

#theorem[
  Let $F$ be a field. For all $a in F$:
  $ (-1) times a = -a. $
]

#proof[
  Compute:
  $ a + (-1) times a = (1 times a) + ((-1) times a) = (1 + (-1)) times a = 0 times a = 0. $
  So $(-1) times a$ is the additive inverse of $a$. By the uniqueness of additive inverses in $(F, +)$, we have $(-1) times a = -a$.
]

#theorem("No zero divisors")[
  Let $F$ be a field. If $a, b in F$ and $a times b = 0$, then $a = 0$ or $b = 0$.
]

#proof[
  Suppose $a times b = 0$ and $a != 0$. Since $F$ is a field, $a^(-1)$ exists. Multiplying both sides on the left by $a^(-1)$:
  $ b = 1 times b = (a^(-1) times a) times b = a^(-1) times (a times b) = a^(-1) times 0 = 0, $
  where the last step applies the previous theorem with $a^(-1)$ in place of $a$. Hence $b = 0$.
]

#theorem[
  Let $F$ be a field. For all $a, b in F$:
  $ (-a) times (-b) = a times b. $
]

#proof[
  Using $-a = (-1) times a$ and $-b = (-1) times b$:
  $ (-a) times (-b) = ((-1) times a) times ((-1) times b) = ((-1) times (-1)) times (a times b). $
  It remains to show $(-1) times (-1) = 1$. By the previous theorem with $a = -1$, we have $(-1) times (-1) = -(-1)$. Since $(-1) + 1 = 0$, the additive inverse of $-1$ is $1$, so $-(-1) = 1$. Therefore $(-a) times (-b) = a times b$.
]

#definition[
  The *characteristic* of a field $F$, written $"char"(F)$, is the smallest positive integer $n$ such that the $n$-fold sum of $1$ with itself equals $0$:
  $ 1 + 1 + dots.c + 1 = 0 $
  (with $n$ terms on the left-hand side). If no such $n$ exists, the characteristic is defined to be $0$.
]

#example[
  - $"char"(QQ) = "char"(RR) = "char"(CC) = 0$: no finite sum of copies of $1$ is zero in any of these fields.
  - $"char"(FF_p) = p$ for any prime $p$: in $ZZ_p$, the $p$-fold sum $[1] + [1] + dots.c + [1] = [p] = [0]$, and no smaller positive number of terms gives $[0]$, since $p$ is prime.
]

#theorem[
  The characteristic of any field is either $0$ or a prime number.
]

#proof[
  Suppose $"char"(F) = p > 0$ and write $p = r dot s$ with $r, s >= 1$. Let $u$ denote the $r$-fold sum of $1$ with itself, and $v$ the $s$-fold sum. By repeated application of distributivity, $u times v$ equals the $(r dot s)$-fold sum of $1$ with itself, which is the $p$-fold sum and therefore equals $0$. By the no-zero-divisors theorem, $u = 0$ or $v = 0$. By the minimality of $p$ as the characteristic, the $r$-fold sum is $0$ only if $r >= p$, and the $s$-fold sum is $0$ only if $s >= p$. Since $r dot s = p$ and $r, s >= 1$, this forces $r = 1$ or $s = 1$. Hence $p$ has no non-trivial factorisation and is prime.
]

#remark[
  Fields provide the natural setting for linear algebra: a vector space is defined over a field, and all of matrix theory, including determinants, eigenvalues, and linear systems, rests on field arithmetic. Polynomial arithmetic over a field $F$ (the polynomial ring $F[x]$) admits a Euclidean division algorithm analogous to that for the integers, from which notions of greatest common divisors and irreducible polynomials follow.

  The finite fields $FF_p$ and their extensions $FF_(p^k)$ are of central importance in cryptography and coding theory. Public-key cryptographic schemes, including elliptic curve cryptography, perform arithmetic in $FF_p$ or $FF_(2^k)$. Error-correcting codes such as Reed-Solomon codes, used in QR codes and storage devices, are constructed over finite fields and exploit their algebraic structure to detect and correct transmission errors.
]
