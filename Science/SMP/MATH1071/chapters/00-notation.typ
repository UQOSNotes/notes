#import "/lib.typ": *

= Notation and Logic

Quick reference for the notation used in the rest of these notes. This is not meant to replace a proper logic course; MATH1061 and MATH1081 are better for that. For MATH1071, treat it as a translation table for the symbols that show up in definitions and proofs.

== Mathematical Statements

A *statement* is a sentence that is either true or false. For example, $2 < 5$ is true and $7 = 3$ is false. The phrase "$x < 5$" is not true or false until $x$ has been specified.

#definition("Common logical symbols")[
  - $P and Q$ means both $P$ and $Q$ are true.
  - $P or Q$ means at least one of $P$ and $Q$ is true. In mathematics, "or" usually includes the possibility that both are true.
  - $not P$ means $P$ is false.
  - $P ==> Q$ means "if $P$, then $Q$".
  - $P <==> Q$ means "$P$ if and only if $Q$"; this says both $P ==> Q$ and $Q ==> P$.
]

#example[
  The statement
  $
    x > 2 and x < 5
  $
  means $x$ lies between $2$ and $5$. The statement
  $
    x <= 2 or x >= 5
  $
  means $x$ is outside the open interval $(2, 5)$.
]

== If, Only If, and If and Only If

Students often lose marks by reversing "if" and "only if". Keep the direction explicit.

#definition("Implications")[
  The statement "$P$ if $Q$" means
  $
    Q ==> P.
  $
  The statement "$P$ only if $Q$" means
  $
    P ==> Q.
  $
  The statement "$P$ if and only if $Q$" means
  $
    P ==> Q quad "and" quad Q ==> P.
  $
]

#example[
  "A number is divisible by $4$ only if it is even" means
  $
    "divisible by " 4 ==> "even".
  $
  This is true. The reverse statement is false: $6$ is even but not divisible by $4$.
]

#example[
  The equation
  $
    x^2 = 1
  $
  is equivalent to
  $
    x = -1 or x = 1.
  $
  Equivalently,
  $
    x^2 = 1 <==> x in {-1, 1}.
  $
]

== Quantifiers

Quantifiers say how many objects a statement is talking about.

#definition("For all and there exists")[
  - $forall x in A, P(x)$ means every $x$ in $A$ satisfies $P(x)$.
  - $exists x in A " such that " P(x)$ means at least one $x$ in $A$ satisfies $P(x)$.
  - $exists! x in A " such that " P(x)$ means exactly one $x$ in $A$ satisfies $P(x)$.
]

#example[
  The statement
  $
    forall x in RR, x^2 >= 0
  $
  is true. The statement
  $
    exists x in RR " such that " x^2 = 2
  $
  is true. The statement
  $
    exists x in QQ " such that " x^2 = 2
  $
  is false.
]

The order of quantifiers matters.

#example[
  The statement
  $
    forall x in RR, exists y in RR " such that " y > x
  $
  is true: after seeing $x$, choose $y = x + 1$.

  The statement
  $
    exists y in RR " such that " forall x in RR, y > x
  $
  is false: there is no real number larger than every real number.
]

== Negating Statements

To disprove a statement, write down what its negation says and prove that instead.

#definition("Negating quantifiers")[
  The negation of
  $
    forall x in A, P(x)
  $
  is
  $
    exists x in A " such that " not P(x).
  $
  The negation of
  $
    exists x in A " such that " P(x)
  $
  is
  $
    forall x in A, not P(x).
  $
]

#example[
  To disprove "every bounded sequence converges", it is enough to give one bounded sequence that does not converge. The sequence $a_n = (-1)^n$ is such a counterexample.
]

#example[
  The negation of
  $
    forall epsilon > 0, exists N in NN " such that " n >= N ==> abs(a_n - L) < epsilon
  $
  is
  $
    exists epsilon > 0 " such that " forall N in NN, exists n >= N " with " abs(a_n - L) >= epsilon.
  $
  This is the form used when proving a sequence does not converge to $L$.
]

== Set Notation

#definition("Set-builder notation")[
  The notation
  $
    {x in A : P(x)}
  $
  means "the set of all $x$ in $A$ such that $P(x)$ is true".
]

#example[
  The interval $(0, 3)$ can be written as
  $
    {x in RR : 0 < x < 3}.
  $
  The set of even integers can be written as
  $
    {2k : k in ZZ}.
  $
]

The symbols $in$ and $subset.eq$ mean different things. Write $x in A$ when $x$ is an element of $A$. Write $A subset.eq B$ when every element of $A$ is also an element of $B$.

== Common Proof Words

#definition("Proof vocabulary")[
  - *Assume* introduces a hypothesis being used.
  - *Suppose for contradiction* means we temporarily assume the opposite of what we want and derive an impossibility.
  - *It follows that* means the next line is a consequence of previous lines.
  - *Without loss of generality* means the other cases are genuinely the same after relabelling or symmetry.
  - *Counterexample* means one example that shows a universal statement is false.
]

#important[
  Do not use "without loss of generality" unless the skipped case is actually the same. For example, if a proof treats $a <= b$, the case $b <= a$ is the same only when the statement is symmetric in $a$ and $b$.
]

== Standard Number Sets

The main number systems are:
$
  NN = {1, 2, 3, dots},
  quad
  ZZ = {dots, -2, -1, 0, 1, 2, dots},
$
$
  QQ = {p / q : p in ZZ, q in NN},
  quad
  RR = "the real numbers",
  quad
  CC = "the complex numbers".#footnote[The complex numbers are listed for orientation, but this course works almost entirely with real numbers and will not otherwise use $CC$.]
$

In these notes, $NN$ starts at $1$. If a problem uses $0$ as a natural number, it should say so.

#note[
  In limits and proofs, the letters $epsilon$ and $delta$ usually represent small positive real numbers. The letter $N$ usually represents a large natural number. These are conventions, not new kinds of numbers.
]
