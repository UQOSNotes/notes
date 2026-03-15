#import "/lib.typ": *

= Proof Techniques

Mathematical proof is the cornerstone of mathematical reasoning. A proof is a logically rigorous argument that establishes the truth of a mathematical statement beyond any doubt. Unlike empirical evidence or examples, which can suggest truth, a proof provides absolute certainty.

In this chapter, we study various techniques for constructing proofs:
- *Direct proof*: Start with the hypothesis and deduce the conclusion
- *Proof by contraposition*: Prove the logically equivalent contrapositive
- *Proof by contradiction*: Assume the negation and derive a contradiction
- *Proof by cases*: Break the problem into exhaustive cases
- *Counterexamples*: Disprove universal statements by finding exceptions

Understanding when and how to apply each technique is essential for reading and writing mathematical proofs. We begin with the most fundamental approach: direct proof.

== Direct Proofs

A direct proof is the most straightforward method of proving a statement. To prove a conditional statement "if $P$ then $Q$" directly, we assume $P$ is true and show that $Q$ must follow logically.

#definition[
  A *direct proof* of a conditional statement $P arrow.r Q$ proceeds as follows:
  1. Assume $P$ is true (the hypothesis)
  2. Use definitions, axioms, and previously proven theorems to deduce that $Q$ is true (the conclusion)
  3. Conclude that $P arrow.r Q$ is true
]

Direct proofs typically follow this pattern:
- *Assumption:* "Suppose $P$ is true..."
- *Body:* Chain of logical deductions using definitions, algebra, and known results
- *Conclusion:* "Therefore, $Q$ is true."

#example[
  *Theorem:* For all integers $n$, if $n$ is even, then $n^2$ is even.

  *Proof:* Suppose $n$ is an even integer. By definition of even, there exists an integer $k$ such that $n = 2k$.

  Then $n^2 = (2k)^2 = 4k^2 = 2(2k^2)$.

  Since $k$ is an integer, $2k^2$ is also an integer. Let $m = 2k^2$. Then $n^2 = 2m$ where $m$ is an integer.

  Therefore, by definition, $n^2$ is even.
]

#important[
  Key elements of a good direct proof:
  - Clearly state what you're assuming (the hypothesis)
  - Use precise definitions (e.g., "even means $n = 2k$ for some integer $k$")
  - Show each logical step explicitly
  - Conclude by explicitly stating what you've proven
]

=== Structure of a Direct Proof

Direct proofs follow a standard structure that helps organise the logical flow from hypothesis to conclusion.

*Standard Template for Direct Proof:*

#align(left)[
  *Theorem:* For all $x in D$, if $P(x)$ then $Q(x)$.

  *Proof:*
  1. Suppose $x in D$ and $P(x)$ is true. [Assume the hypothesis]
  2. ... [Chain of logical deductions]
  3. ... [Using definitions, axioms, previously proven results]
  4. Therefore, $Q(x)$ is true. [State the conclusion]
]

#example("Sum of Even Integers")[
  *Theorem:* The sum of any two even integers is even.

  *Proof:* Suppose $m$ and $n$ are even integers. [Assume hypothesis]

  By definition of even, there exist integers $r$ and $s$ such that $m = 2r$ and $n = 2s$. [Apply definition]

  Then $m + n = 2r + 2s = 2(r + s)$. [Algebraic manipulation]

  Since $r$ and $s$ are integers, $r + s$ is also an integer. [Closure of integers under addition]

  Let $t = r + s$. Then $m + n = 2t$ where $t$ is an integer. [Define witness]

  Therefore, by definition, $m + n$ is even. [Conclude]
]

#example("Product of Odd Integers")[
  *Theorem:* The product of any two odd integers is odd.

  *Proof:* Suppose $m$ and $n$ are odd integers.

  By definition of odd, there exist integers $r$ and $s$ such that $m = 2r + 1$ and $n = 2s + 1$.

  Then
  $ m n = (2r + 1)(2s + 1) = 4r s + 2r + 2s + 1 = 2(2r s + r + s) + 1 $

  Since $r$ and $s$ are integers, $2r s + r + s$ is also an integer. Let $t = 2r s + r + s$.

  Then $m n = 2t + 1$ where $t$ is an integer.

  Therefore, by definition, $m n$ is odd.
]

#note[
  *Using Definitions:* Most direct proofs rely heavily on definitions. When proving something is even, odd, divisible, rational, etc., you must:
  1. State the relevant definition precisely
  2. Apply the definition to expand the given information
  3. Manipulate to show the conclusion matches the definition
]

=== Proving Universal Statements

A universal statement has the form "for all $x in D$, $P(x)$" or equivalently "$forall x in D, P(x)$". To prove such a statement directly, we use the *method of generalising from the generic particular*.

#definition[
  To prove $forall x in D, P(x)$:
  1. Let $x$ be an arbitrary element of $D$ (not a specific example!)
  2. Show that $P(x)$ is true for this arbitrary $x$
  3. Conclude that $P(x)$ is true for all $x in D$
]

#important[
  The key word is *arbitrary*. You cannot prove a universal statement by checking specific examples. You must prove it works for a generic, unspecified element of the domain.
]

#example[
  *Theorem:* For all integers $n$, $n^2 - n$ is even.

  *Proof:* Let $n$ be an arbitrary integer. [Choose generic element]

  We consider two cases:

  *Case 1:* $n$ is even. Then $n = 2k$ for some integer $k$.
  $ n^2 - n = (2k)^2 - 2k = 4k^2 - 2k = 2(2k^2 - k) $
  Since $2k^2 - k$ is an integer, $n^2 - n$ is even.

  *Case 2:* $n$ is odd. Then $n = 2k + 1$ for some integer $k$.
  $ n^2 - n = (2k + 1)^2 - (2k + 1) = 4k^2 + 4k + 1 - 2k - 1 = 4k^2 + 2k = 2(2k^2 + k) $
  Since $2k^2 + k$ is an integer, $n^2 - n$ is even.

  In both cases, $n^2 - n$ is even. Since $n$ was arbitrary, the statement holds for all integers $n$.
]

#remark[
  When the domain has natural subcases (like integers being even or odd), *proof by cases* is often the clearest approach for universal statements.
]

=== Proving Existential Statements

An existential statement has the form "there exists $x in D$ such that $P(x)$", denoted $exists x in D, P(x)$. To prove such a statement, it suffices to find one specific element of $D$ for which $P(x)$ holds; this is called a *constructive proof of existence*.

#definition[
  To prove $exists x in D, P(x)$, it suffices to:
  1. Find (or construct) a specific value $x_0 in D$
  2. Verify that $P(x_0)$ is true
]

#example[
  *Theorem:* There exists an integer that can be expressed as the sum of two perfect squares in two different ways.

  *Proof:* Take $x_0 = 50$. Then $50 = 1^2 + 7^2 = 5^2 + 5^2$.

  Since 50 is an integer expressible as the sum of two perfect squares in two different ways, the statement is proved.
]

#example[
  *Theorem:* There exist irrational numbers $a$ and $b$ such that $a^b$ is rational.

  *Proof:* Consider $a = b = sqrt(2)$. We know $sqrt(2)$ is irrational.

  Let $c = (sqrt(2))^(sqrt(2))$.

  - *Case 1:* If $c$ is rational, then we have found irrational $a = b = sqrt(2)$ with $a^b$ rational.
  - *Case 2:* If $c$ is irrational, let $a = c = (sqrt(2))^(sqrt(2))$ and $b = sqrt(2)$. Then $a^b = ((sqrt(2))^(sqrt(2)))^(sqrt(2)) = (sqrt(2))^2 = 2$, which is rational.

  In either case, irrational numbers $a$ and $b$ exist such that $a^b$ is rational.
]

#remark[
  Not all existence proofs are constructive. A *non-constructive* proof of existence establishes that a solution must exist (e.g., by contradiction), without explicitly identifying one. The example above is non-constructive since we do not know which case holds.
]

#note[
  *Disproving an Existential Statement:* To disprove $exists x in D, P(x)$, you must show $forall x in D, not P(x)$; that is, that no element of $D$ satisfies $P$. This is typically harder than proving existence, as you must rule out all possible candidates.
]

== Counterexamples

A universal statement claims something holds for *all* elements of a domain. A single element for which the statement fails is called a *counterexample* and is sufficient to disprove the statement entirely.

#definition[
  A *counterexample* to the universal statement $forall x in D, P(x)$ is a specific value $x_0 in D$ for which $P(x_0)$ is false.
]

#important[
  To *prove* a universal statement, you must show it holds for all elements; no finite list of examples suffices.

  To *disprove* a universal statement, a single counterexample is enough.
]

=== Disproving Universal Statements

To disprove $forall x in D, P(x)$, find one $x_0 in D$ such that $P(x_0)$ is false. The negation of a universal statement is existential:
$ not (forall x in D, P(x)) equiv exists x in D, not P(x) $

#example[
  *Claim:* For all integers $n$, $n^2 > n$.

  *Disproof:* Let $n = 0$. Then $n^2 = 0$ and $n = 0$, so $n^2 = n$, not $n^2 > n$.

  Therefore, the claim is false. (Also false for $n = 1$ and all negative integers.)
]

#example[
  *Claim:* For all real numbers $x$, $sqrt(x^2) = x$.

  *Disproof:* Let $x = -3$. Then $sqrt(x^2) = sqrt(9) = 3$, but $x = -3 eq.not 3$.

  The correct statement is $sqrt(x^2) = |x|$ for all real $x$.
]

#example[
  *Claim:* For all integers $n >= 2$, $n^2 - n + 11$ is prime.

  *Disproof:* Let $n = 11$. Then $n^2 - n + 11 = 121 - 11 + 11 = 121 = 11^2$, which is not prime.
]

=== Constructing Counterexamples

Finding a counterexample requires understanding why a statement might fail. Useful strategies:

1. *Test boundary cases:* Try $n = 0$, $n = 1$, negative values, or extreme values
2. *Test special structures:* For statements about integers, try even vs. odd; for divisibility, try primes
3. *Work backwards:* Identify what would make the conclusion false, then check if the hypothesis can still hold

#example[
  *Claim:* For all integers $a$, $b$, $c$, if $a divides b c$, then $a divides b$ or $a divides c$.

  *Strategy:* We need $a | b c$ but $a divides.not b$ and $a divides.not c$. Try $a = 4$, $b = 2$, $c = 6$: then $b c = 12$ and $4 | 12$, but $4 divides.not 2$ and $4 divides.not 6$.

  *Counterexample:* $a = 4$, $b = 2$, $c = 6$.

  Then $a | b c$ (since $4 | 12$), but $a divides.not b$ (since $4 divides.not 2$) and $a divides.not c$ (since $4 divides.not 6$).

  Therefore, the claim is false. (However, it becomes true when $a$ is prime; this is a key property of prime numbers.)
]

#example[
  *Claim:* For all real numbers $x$ and $y$, $sqrt(x + y) = sqrt(x) + sqrt(y)$.

  *Counterexample:* Let $x = 4$ and $y = 9$. Then $sqrt(x + y) = sqrt(13)$, but $sqrt(x) + sqrt(y) = 2 + 3 = 5$. Since $sqrt(13) approx 3.6 eq.not 5$, the claim is false.
]

== Proof by Contradiction

A proof by contradiction is an indirect argument that is often a useful alternative to direct proof. Instead of proving a statement is true directly, we assume it is false and show this leads to a logical impossibility.

#definition[
  A *proof by contradiction* follows these steps:

  1. Assume that the statement to be proved is false
  2. Show that this assumption leads logically to a contradiction
  3. Conclude that the statement must be true (since it cannot be false)
]

Proof by contradiction is particularly useful when:
- Showing that no object exists with a certain property
- Showing that an object does not have a particular property
- Proving conditional statements that are difficult to prove directly

#example("No Greatest Integer")[
  *Lemma:* There is no greatest integer.

  *Proof:* Suppose, for the sake of contradiction, that the lemma is false. Then there exists a greatest integer $N$. That is, for all integers $n$, we have $N >= n$.

  Let $M = N + 1$. Since $N$ is an integer, $M$ is also an integer. But clearly $M > N$, so $M$ is an integer greater than $N$. This means $N$ is not the greatest integer, which is a contradiction.

  Therefore, there is no greatest integer.
]

#example("Even and Odd are Disjoint")[
  *Lemma:* For all integers $n$, $n$ is not simultaneously both even and odd.

  *Proof:* Suppose, for the sake of contradiction, that the lemma is false. Then there exists an integer $n$ that is both even and odd.

  Since $n$ is even, we have $n = 2k$ for some integer $k$ (by definition of even).

  Since $n$ is odd, we have $n = 2l + 1$ for some integer $l$ (by definition of odd).

  Therefore, $2k = 2l + 1$, which gives us $1 = 2(k - l)$, or equivalently, $k - l = 1/2$.

  But this is impossible, because $k$ and $l$ are integers, so $k - l$ must be an integer, not $1/2$. This is a contradiction.

  Therefore, an integer cannot be simultaneously even and odd.
]

=== Structure of a Proof by Contradiction

When proving a universal conditional statement of the form "for all $x in D$, if $P(x)$ then $Q(x)$" by contradiction:

1. *Assume the statement is false.* The negation is: "there exists $x in D$ such that $P(x)$ and $not Q(x)$"

2. *Show this leads to a contradiction.* Derive a logical impossibility from this assumption.

3. *Conclude the original statement is true.* Since the negation leads to a contradiction, the original statement must be true.

#important[
  The negation of $forall x in D, P(x) arrow.r Q(x)$ is $exists x in D, P(x) and not Q(x)$.This is because $not (P arrow.r Q) equiv P and not Q$.
]

#example("Using Contradiction for Conditional Statements")[
  *Lemma:* For all integers $n$, if $n^2$ is odd, then $n$ is odd.

  *Attempted Direct Proof:* Suppose $n$ is an integer and $n^2$ is odd. Then $n^2 = 2k + 1$ for some integer $k$, so $n = sqrt(2k + 1)$. But now what? It's unclear how to proceed.

  *Proof by Contradiction:* Suppose the lemma is false. Then there exists an integer $n$ such that $n^2$ is odd and $n$ is even.

  Since $n$ is even, we have $n = 2k$ for some integer $k$.

  Therefore, $n^2 = (2k)^2 = 4k^2 = 2(2k^2)$.

  Let $l = 2k^2$. Since $k$ is an integer, $l$ is also an integer. Thus $n^2 = 2l$, which means $n^2$ is even (by definition).

  But we assumed $n^2$ is odd. Therefore, $n^2$ is both odd and even, which is impossible by our previous lemma. This is a contradiction.

  Therefore, the original statement is true: if $n^2$ is odd, then $n$ is odd.
]

#remark[
  Notice how the contradiction proof was much more straightforward than trying to prove the statement directly. This is a common situation; the contrapositive or contradiction approach often provides clearer paths to the conclusion.
]

=== Proving Irrationality

Proving that a number is irrational; that it cannot be written as a ratio of two integers; is a classic application of proof by contradiction. The standard approach assumes the number is rational, writes it in lowest terms, and derives a contradiction.

#theorem[
  $sqrt(2)$ is irrational.
]

#proof[
  Suppose, for the sake of contradiction, that $sqrt(2)$ is rational. Then $sqrt(2) = a/b$ for some integers $a$ and $b$ with $b != 0$. We may assume the fraction is in lowest terms, so $a$ and $b$ share no common factors (in particular, they are not both even).

  Squaring both sides: $2 = a^2 / b^2$, so $a^2 = 2b^2$.

  This means $a^2$ is even. By a previously proven lemma (if $n^2$ is even, then $n$ is even), $a$ must be even. So $a = 2k$ for some integer $k$.

  Substituting: $(2k)^2 = 2b^2$, which gives $4k^2 = 2b^2$, so $b^2 = 2k^2$.

  This means $b^2$ is even, so $b$ is also even.

  But now both $a$ and $b$ are even, contradicting our assumption that $a/b$ is in lowest terms.

  Therefore, $sqrt(2)$ is irrational.
]

#remark[
  This proof can be adapted to show $sqrt(p)$ is irrational for any prime $p$.
]

#theorem[
  $log_2 3$ is irrational.
]

#proof[
  Suppose, for the sake of contradiction, that $log_2 3$ is rational. Then $log_2 3 = a/b$ for some integers $a$ and $b$ with $b > 0$.

  By definition of logarithm, $2^(a/b) = 3$, so $2^a = 3^b$.

  But $2^a$ is even for all $a >= 1$, while $3^b$ is odd for all $b >= 1$. An even number cannot equal an odd number; a contradiction.

  (The case $a <= 0$ is also impossible since $3^b >= 3 > 1 >= 2^0 >= 2^a$ for $b >= 1$, $a <= 0$.)

  Therefore, $log_2 3$ is irrational.
]

=== Other Applications

Proof by contradiction is widely applicable whenever a direct approach is unclear. A common pattern is to assume the opposite of what you want to show and derive something visibly impossible.

#theorem[
  There are infinitely many prime numbers.
]

#proof[
  Suppose, for the sake of contradiction, that there are only finitely many primes. List them all as $p_1, p_2, dots, p_n$.

  Let $N = p_1 p_2 dots.h.c p_n + 1$.

  When $N$ is divided by any $p_i$, the remainder is 1, so no $p_i$ divides $N$. Therefore $N$ has no prime factor in our list.

  But every integer greater than 1 has at least one prime factor. Since $N > 1$, $N$ must have a prime factor not in our list; a contradiction.

  Therefore, there are infinitely many primes.
]

#theorem[
  If $n^2$ is odd, then $n$ is odd (for any integer $n$).
]

#proof[
  Suppose, for the sake of contradiction, that $n^2$ is odd but $n$ is even. Then $n = 2k$ for some integer $k$, so $n^2 = 4k^2 = 2(2k^2)$, which is even. But $n^2$ was assumed odd; a contradiction. Therefore $n$ must be odd.
]

#remark[
  *Choosing Between Contradiction and Contraposition:*

  Both methods handle statements of the form "if $P$ then $Q$" indirectly. A useful heuristic:
  - Use *contraposition* when $not Q$ gives clean, concrete information to work with
  - Use *contradiction* when the negation of the entire statement (assuming both $P$ and $not Q$) leads more naturally to an impossibility
  - When in doubt, try both and see which leads to a cleaner proof
]

== Proof by Contraposition

A proof by contraposition is based on the logical equivalence between a conditional statement and its contrapositive. Since $p arrow.r q equiv not q arrow.r not p$, proving the contrapositive proves the original statement.

#definition[
  The method of *proof by contraposition* follows these steps:

  1. Express the statement in the form: "for all $x in D$, if $P(x)$ then $Q(x)$"
  2. Rewrite in contrapositive form: "for all $x in D$, if $not Q(x)$ then $not P(x)$"
  3. Prove the contrapositive by direct proof
]

#example("Square Even Implies Even")[
  *Lemma:* For all integers $n$, if $n^2$ is even, then $n$ is even.

  *Attempted Direct Proof:* Suppose $n$ is an integer where $n^2$ is even. Then $n^2 = 2k$ for some integer $k$, so $n = sqrt(2k)$. It's unclear how to show $n$ is even from here.

  *Proof by Contraposition:* The contrapositive is: "For all integers $n$, if $n$ is not even, then $n^2$ is not even."

  Equivalently: "For all integers $n$, if $n$ is odd, then $n^2$ is odd."

  We prove this directly. Suppose $n$ is an odd integer. Then $n = 2k + 1$ for some integer $k$ (by definition of odd).

  Therefore,
  $ n^2 = (2k + 1)^2 = 4k^2 + 4k + 1 = 2(2k^2 + 2k) + 1 $

  Since $k$ is an integer, $2k^2 + 2k$ is also an integer. Let $l = 2k^2 + 2k$. Then $n^2 = 2l + 1$, which means $n^2$ is odd (by definition).

  Since the contrapositive is true, the original statement is true.
]

=== Relation to the Contrapositive

The method of proof by contraposition works because of the logical equivalence:
$ p arrow.r q equiv not q arrow.r not p $

This means:
- If we prove the contrapositive $not q arrow.r not p$ is true, then the original statement $p arrow.r q$ is also true
- The proof of the contrapositive is typically a *direct proof*

#important[
  When forming the contrapositive:
  - Negate both the hypothesis and conclusion
  - Reverse their order
  - Be careful when negating compound statements (use De Morgan's laws)
]

#example("Same Parity Lemma")[
  *Lemma:* For all integers $n$ and $m$, if $n + m$ is even, then $n$ and $m$ have the same parity.

  (Recall: Two integers have the *same parity* if they are both even or both odd. They have *opposite parity* if one is even and the other is odd.)

  *Contrapositive:* For all integers $n$ and $m$, if $n$ and $m$ have opposite parity, then $n + m$ is odd.

  *Proof:* Suppose $n$ and $m$ are integers with opposite parity. Without loss of generality, suppose $n$ is even and $m$ is odd.

  Then $n = 2k$ for some integer $k$, and $m = 2l + 1$ for some integer $l$.

  Therefore,
  $ n + m = 2k + (2l + 1) = 2(k + l) + 1 $

  Since $k$ and $l$ are integers, $k + l$ is an integer. Thus $n + m$ is odd (by definition).

  Since the contrapositive is true, the original statement is true.
]

#example("Product Greater Than 25")[
  *Lemma:* If the product of two positive real numbers is greater than 25, then at least one of the numbers is greater than 5.

  Symbolically: For all $x, y in RR^+$, if $x y > 25$, then $x > 5$ or $y > 5$.

  *Contrapositive:* For all $x, y in RR^+$, if $x <= 5$ and $y <= 5$, then $x y <= 25$.

  Note: $not (x > 5 or y > 5) equiv (x <= 5 and y <= 5)$ by De Morgan's law.

  *Proof:* Suppose $x$ and $y$ are positive real numbers with $x <= 5$ and $y <= 5$.

  Since $x <= 5$, multiplying both sides by $y > 0$ gives $x y <= 5y$.

  Since $y <= 5$, multiplying both sides by $5 > 0$ gives $5y <= 25$.

  Therefore, $x y <= 5y <= 25$, which means $x y <= 25$.

  Since the contrapositive is true, the original statement is true.
]

=== When to Use Contraposition

Proof by contraposition is particularly useful when:

1. *The conclusion is difficult to work with directly* - The conclusion might be a negation or disjunction that's hard to prove directly, but easier to negate

2. *The negated hypothesis gives more information* - The negation of the hypothesis might provide a concrete property to work with (e.g., "not even" becomes "odd")

3. *You get stuck with a direct proof* - If a direct proof attempt leads nowhere, try contraposition

#remark[
  *Comparing Proof Methods:*

  - *Direct Proof:* Assume $P(x)$, deduce $Q(x)$
  - *Contraposition:* Assume $not Q(x)$, deduce $not P(x)$ (still a direct proof, but of the contrapositive)
  - *Contradiction:* Assume $P(x) and not Q(x)$, deduce a contradiction

  All three methods are valid, but one may be easier than the others depending on the statement.
]

#important[
  The contrapositive is logically equivalent to the original statement, so proving the contrapositive *is* proving the original statement. This is different from the converse or inverse, which are equiv.notalent to the original.
]
