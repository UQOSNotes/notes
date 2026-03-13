#import "/lib.typ": *

= Logic

Logic is the foundation of mathematical reasoning. It provides a formal framework for analysing arguments, determining whether statements are true or false, and constructing valid proofs. In this chapter, we study propositional logic, which deals with statements that can be either true or false, and the logical connectives that allow us to build more complex statements from simpler ones.

Understanding logic is essential for:
- Writing and reading mathematical proofs
- Analyzing the correctness of arguments
- Designing algorithms and computer programs
- Reasoning precisely in any mathematical context

We begin by studying the basic building blocks of logic: statements and logical connectives.

== Logical Form

The *logical form* of a statement refers to its structure in terms of logical connectives and statement variables, independent of the specific content. Identifying the logical form allows us to analyse arguments abstractly and determine their validity based on structure alone.

#definition[
  A *statement* (or *proposition*) is a declarative sentence that is either true or false, but not both.
]

#example[
  The following are statements:
  - "2 + 3 = 5" (true)
  - "Sydney is the capital of Australia" (false)
  - "All prime numbers are odd" (false)
  - "If $x > 0$, then $x^2 > 0$" (true for real numbers)

  The following are *not* statements:
  - "Is it raining?" (question, not declarative)
  - "Close the door!" (command, not declarative)
  - "$x + 1 = 2$" (truth depends on value of $x$; neither always true nor always false)
  - "This statement is false" (paradox, cannot be assigned a truth value)
]

#definition[
  A *statement variable* (or *propositional variable*) is a letter such as $p$, $q$, or $r$ that represents an arbitrary statement.

  A *statement form* (or *propositional form*) is an expression involving statement variables and logical connectives that becomes a statement when specific statements are substituted for the variables.
]

#important[
  The truth value of a statement form depends on the truth values assigned to its statement variables. Our goal is to understand how the logical connectives combine these truth values.
]

=== Statements and Logical Connectives

Logical connectives allow us to combine simple statements to form more complex statements. The truth value of a compound statement is completely determined by the truth values of its components and the connectives used.

*Basic Logical Connectives:*

#definition("Negation")[
  The *negation* of a statement $p$, denoted $not p$ and read "not $p$", is the statement that is true when $p$ is false, and false when $p$ is true.

  #table(
    columns: 2,
    align: center,
    [$p$], [$not p$],
    [T], [F],
    [F], [T],
  )
]

#example[
  - $p$: "It is raining"
  - $not p$: "It is not raining"
]

#definition("Conjunction")[
  The *conjunction* of statements $p$ and $q$, denoted $p and q$ and read "$p$ and $q$", is true when both $p$ and $q$ are true, and false otherwise.

  #table(
    columns: 3,
    align: center,
    [$p$], [$q$], [$p and q$],
    [T], [T], [T],
    [T], [F], [F],
    [F], [T], [F],
    [F], [F], [F],
  )
]

#example[
  - $p$: "I have a laptop"
  - $q$: "I have an internet connection"
  - $p and q$: "I have a laptop and I have an internet connection"
]

#definition("Disjunction")[
  The *disjunction* of statements $p$ and $q$, denoted $p or q$ and read "$p$ or $q$", is true when at least one of $p$ or $q$ is true, and false when both are false.

  #table(
    columns: 3,
    align: center,
    [$p$], [$q$], [$p or q$],
    [T], [T], [T],
    [T], [F], [T],
    [F], [T], [T],
    [F], [F], [F],
  )
]

#important[
  In logic, "or" is *inclusive*; it includes the case where both statements are true. This differs from everyday usage where "or" sometimes means "one or the other but not both" (exclusive or).
]

#example[
  - $p$: "The dessert comes with ice cream"
  - $q$: "The dessert comes with fruit"
  - $p or q$: "The dessert comes with ice cream or fruit (or both)"
]

#note[
  The *exclusive or* of $p$ and $q$, sometimes denoted $p xor q$, is true when exactly one of $p$ or $q$ is true, but not both. In propositional logic, this can be expressed as $(p or q) and not (p and q)$.
]

=== Truth Tables

A truth table is a systematic way to determine the truth value of a compound statement for all possible combinations of truth values of its component statements.

#definition[
  A *truth table* for a statement form displays:
  - All possible combinations of truth values for the statement variables
  - The resulting truth value of the compound statement for each combination
]

*Constructing Truth Tables:*

1. *Determine the number of rows:* For $n$ statement variables, you need $2^n$ rows to represent all possible truth value combinations

2. *List all combinations:* Systematically list all T/F combinations for the variables

3. *Evaluate subexpressions:* Work from the inside out, evaluating logical connectives according to their definitions

4. *Compute the final column:* The last column shows the truth value of the entire statement form

#example[
  Construct a truth table for $(p and q) or not p$.

  #table(
    columns: 5,
    align: center,
    [$p$], [$q$], [$p and q$], [$not p$], [$(p and q) or not p$],
    [T], [T], [T], [F], [T],
    [T], [F], [F], [F], [F],
    [F], [T], [F], [T], [T],
    [F], [F], [F], [T], [T],
  )

  Since we have 2 variables ($p$ and $q$), we need $2^2 = 4$ rows.

  Steps:
  1. List all T/F combinations for $p$ and $q$
  2. Compute $p and q$ using the conjunction definition
  3. Compute $not p$ using the negation definition
  4. Compute $(p and q) or not p$ using the disjunction definition
]

#example[
  Construct a truth table for $not (p or q)$ and compare it to $not p and not q$.

  #table(
    columns: 6,
    align: center,
    [$p$], [$q$], [$p or q$], [$not (p or q)$], [$not p$], [$not q$], [$not p and not q$],
    [T], [T], [T], [F], [F], [F], [F],
    [T], [F], [T], [F], [F], [T], [F],
    [F], [T], [T], [F], [T], [F], [F],
    [F], [F], [F], [T], [T], [T], [T],
  )

  Notice that columns 4 and 7 are identical. This shows that $not (p or q) equiv not p and not q$, which is one of De Morgan's laws.
]

#important[
  *Number of Rows in Truth Tables:*
  - 1 variable: $2^1 = 2$ rows
  - 2 variables: $2^2 = 4$ rows
  - 3 variables: $2^3 = 8$ rows
  - $n$ variables: $2^n$ rows

  Truth tables grow exponentially, so for complex statements with many variables, using logical equivalence laws (covered later) is often more efficient.
]

#remark[
  When filling in truth value combinations, it's helpful to use a systematic pattern:
  - For the first variable: alternate in blocks of $2^(n-1)$ (half T's, half F's)
  - For the second variable: alternate in blocks of $2^(n-2)$
  - And so on, until the last variable alternates: T, F, T, F, ...

  This guarantees all combinations are covered exactly once.
]

=== Compound Statements

A compound statement is built from simpler statements using logical connectives. Understanding how to parse and evaluate compound statements is essential for working with complex logical expressions.

#definition[
  A *compound statement* is a statement formed by combining one or more statements using logical connectives (negation, conjunction, disjunction, conditional, biconditional).
]

*Order of Operations (Precedence):*

When evaluating compound statements, we follow this order of precedence (from highest to lowest):

1. *Negation* ($not$) - evaluated first
2. *Conjunction* ($and$) and *Disjunction* ($or$) - evaluated second (equal precedence, evaluate left to right)
3. *Conditional* ($arrow.r$) and *Biconditional* ($arrow.l.r$) - evaluated last (equal precedence)

#important[
  When in doubt, use parentheses to clarify the intended meaning. Parentheses override the default precedence.
]

#example[
  Parse the following statement forms:

  - $not p and q$ means $(not p) and q$, not $not (p and q)$
  - $p and q or r$ means $(p and q) or r$ (conjunction before disjunction by left-to-right evaluation)
  - $p or q arrow.r r$ means $(p or q) arrow.r r$ (connectives before conditional)
  - $p arrow.r q and r$ means $p arrow.r (q and r)$ (conjunction before conditional)
]

#example("Translating English to Logic")[
  Translate the following English sentences into symbolic logic.

  Let:
  - $p$: "It is raining"
  - $q$: "The ground is wet"
  - $r$: "I have an umbrella"

  1. "It is raining and the ground is wet" → $p and q$

  2. "It is not raining but the ground is wet" → $not p and q$

  3. "If it is raining, then the ground is wet" → $p arrow.r q$

  4. "It is raining, or the ground is wet and I have an umbrella" → $p or (q and r)$

  5. "If it is not raining, then I do not have an umbrella" → $not p arrow.r not r$
]

#example("Evaluating Compound Statements")[
  Evaluate the truth value of $not p or (q and r)$ when $p$ is true, $q$ is false, and $r$ is true.

  Step by step:
  1. $not p = not T = F$
  2. $q and r = F and T = F$
  3. $not p or (q and r) = F or F = F$

  Therefore, the statement is false under this assignment.
]

#note[
  *Common English Phrases and Their Logical Forms:*

  - "both $p$ and $q$" → $p and q$
  - "neither $p$ nor $q$" → $not p and not q$ or equivalently $not (p or q)$
  - "either $p$ or $q$" → $p or q$
  - "$p$ but $q$" → $p and q$ (emphasis on contrast)
  - "$p$ unless $q$" → $not q arrow.r p$ or equivalently $p or q$
  - "$p$ only if $q$" → $p arrow.r q$
  - "$p$ if $q$" → $q arrow.r p$
]

#remark[
  Translating between English and logical notation requires careful attention to context and meaning. Natural language can be ambiguous, while logical notation is precise. When translating, always verify that the logical form captures the intended meaning of the original statement.
]

== Logical Equivalence

Two statement forms $P$ and $Q$ are *logically equivalent*, denoted $P equiv Q$, if they have identical truth values for every possible combination of truth values of their statement variables.

#example[
  Show that $not not p equiv p$ using a truth table.

  #table(
    columns: 3,
    align: center,
    [$p$], [$not p$], [$not not p$],
    [T], [F], [T],
    [F], [T], [F],
  )

  Since $p$ and $not not p$ have identical truth values for every row, we conclude $not not p equiv p$.
]

#important[
  To show two statement forms are *not* logically equivalent, it suffices to find just one row in the truth table where their truth values differ.
]

=== Tautologies and Contradictions

#definition[
  A *tautology* is a statement form that always takes truth value "true" for all possible truth values of its variables.
]

#example[
  The statement form $p or not p$ is a tautology.

  #table(
    columns: 3,
    align: center,
    [$p$], [$not p$], [$p or not p$],
    [T], [F], [T],
    [F], [T], [T],
  )

  Since $p or not p$ is true in every row, it is a tautology.
]

#definition[
  A *contradiction* is a statement form that always takes truth value "false" for all possible truth values of its variables.
]

#example[
  The statement form $p and not p$ is a contradiction.

  #table(
    columns: 3,
    align: center,
    [$p$], [$not p$], [$p and not p$],
    [T], [F], [F],
    [F], [T], [F],
  )

  Since $p and not p$ is false in every row, it is a contradiction.
]

=== Laws of Logic

The following logical equivalences are fundamental and should be memorised:

#table(
  columns: (auto, auto),
  align: (left, left),
  [*Law*], [*Equivalence*],

  // De Morgan's Laws
  [De Morgan's Laws],
  $not (p and q) equiv not p or not q$,

  [],
  $not (p or q) equiv not p and not q$,

  // Commutative Laws
  [Commutative Laws],
  $p and q equiv q and p$,

  [],
  $p or q equiv q or p$,

  // Associative Laws
  [Associative Laws],
  $(p and q) and r equiv p and (q and r)$,

  [],
  $(p or q) or r equiv p or (q or r)$,

  // Distributive Laws
  [Distributive Laws],
  $p and (q or r) equiv (p and q) or (p and r)$,

  [],
  $p or (q and r) equiv (p or q) and (p or r)$,

  // Identity Laws
  [Identity Laws],
  $p and "true" equiv p$,

  [],
  $p or "false" equiv p$,

  // Domination Laws
  [Domination Laws],
  $p and "false" equiv "false"$,

  [],
  $p or "true" equiv "true"$,

  // Negation Laws
  [Negation Laws],
  $p or not p equiv "true"$,

  [],
  $p and not p equiv "false"$,

  // Double Negative Law
  [Double Negative Law],
  $not not p equiv p$,

  // Idempotent Laws
  [Idempotent Laws],
  $p and p equiv p$,

  [],
  $p or p equiv p$,
)

#remark[
  When working with three variables, truth tables require $2^3 = 8$ rows. More generally, $n$ variables require $2^n$ rows, which can become very large. Using logical equivalence laws to simplify expressions is often more efficient than constructing large truth tables.
]

=== Simplifying Logical Expressions

We can use the laws of logical equivalence to simplify complex statement forms without constructing truth tables.

#example[
  Show that $(p and (not q or q)) and q equiv p and q$ using logical equivalence laws.

  #align(left)[
    $
      (p and (not q or q)) and q & equiv (p and (q or not q)) and q && "(commutative law)" \
                                 & equiv (p and "true") and q       && "(negation law)" \
                                 & equiv p and q                    && "(identity law)"
    $
  ]

  By applying the commutative law, negation law, and identity law in sequence, we have shown that the original expression is logically equivalent to $p and q$.
]

#remark[
  This method is particularly useful when dealing with many variables, as the truth table approach would require $2^n$ rows for $n$ variables. For example, with 5 variables, a truth table would need 32 rows, making algebraic simplification much more practical.
]

== Conditional Statements

#definition[
  Let $p$ and $q$ be statement variables. The *conditional statement* from $p$ to $q$, denoted $p arrow.r q$ and read as "$p$ implies $q$" or "if $p$ then $q$", is defined by the truth table:

  #table(
    columns: 3,
    align: center,
    [$p$], [$q$], [$p arrow.r q$],
    [T], [T], [T],
    [T], [F], [F],
    [F], [T], [T],
    [F], [F], [T],
  )

  Note that $p arrow.r q$ is false *only when* $p$ is true and $q$ is false. In the conditional $p arrow.r q$:
  - $p$ is called the *hypothesis* (or antecedent)
  - $q$ is called the *conclusion* (or consequent)
]

#example[
  Consider the promise: "If you do your homework, then you get a chocolate."

  In which scenario is this promise false?
  - *Scenario A:* You do not do your homework, and you get a chocolate. (Promise kept)
  - *Scenario B:* You do your homework, and you get a chocolate. (Promise kept)
  - *Scenario C:* You do your homework, and you do not get a chocolate. (*Promise broken*)
  - *Scenario D:* You do not do your homework, and you do not get a chocolate. (Promise kept)

  Only in Scenario C, where the hypothesis is true and conclusion is false, is the promise broken.
]

#theorem[
  The conditional statement can be expressed using other logical connectives:
  $ p arrow.r q equiv not p or q $
]

#proof[
  We verify this using a truth table:

  #table(
    columns: 4,
    align: center,
    [$p$], [$q$], [$not p or q$], [$p arrow.r q$],
    [T], [T], [T], [T],
    [T], [F], [F], [F],
    [F], [T], [T], [T],
    [F], [F], [T], [T],
  )

  Since the columns for $not p or q$ and $p arrow.r q$ are identical, they are logically equivalent.
]

#example[
  The statement "If you do your homework, then you get a chocolate" can be equivalently stated as "Either you do not do your homework, or you get a chocolate."
]

*Negating a Conditional:*

#theorem[
  The negation of a conditional statement is:
  $ not (p arrow.r q) equiv p and not q $
]

#proof[
  $
    not (p arrow.r q) & equiv not (not p or q)    && "(conditional equivalence)" \
                      & equiv not not p and not q && "(De Morgan's law)" \
                      & equiv p and not q         && "(double negative law)"
  $
]

#example[
  The negation of "If today is Monday, then tomorrow is my birthday" is "Today is Monday, but tomorrow is not my birthday."

  (Note: In English, "but" is often used instead of "and" when expressing a surprising or contradictory conjunction.)
]

=== Conditional and Biconditional

#definition[
  Let $p$ and $q$ be statement variables. The *biconditional statement* of $p$ and $q$, denoted $p arrow.l.r q$ and read as "$p$ if and only if $q$" (abbreviated "iff"), is defined by the truth table:

  #table(
    columns: 3,
    align: center,
    [$p$], [$q$], [$p arrow.l.r q$],
    [T], [T], [T],
    [T], [F], [F],
    [F], [T], [F],
    [F], [F], [T],
  )

  Note that $p arrow.l.r q$ is true when $p$ and $q$ have the *same truth value*, and false otherwise.
]

#theorem[
  The biconditional can be expressed as a conjunction of two conditionals:
  $ p arrow.l.r q equiv (p arrow.r q) and (q arrow.r p) $
]

#note[
  The biconditional $p arrow.l.r q$ can be read as:
  - "$p$ if and only if $q$"
  - "$p$ is equivalent to $q$"
  - "$p$ iff $q$"
]

=== Converse, Inverse, and Contrapositive

Given a conditional statement $p arrow.r q$, we can form three related statements:

#definition[
  - The *converse* of $p arrow.r q$ is $q arrow.r p$
  - The *inverse* of $p arrow.r q$ is $not p arrow.r not q$
  - The *contrapositive* of $p arrow.r q$ is $not q arrow.r not p$
]

#theorem[
  A conditional statement and its contrapositive are logically equivalent:
  $ p arrow.r q equiv not q arrow.r not p $
]

#proof[
  We verify this using a truth table:

  #table(
    columns: 5,
    align: center,
    [$p$], [$q$], [$not p$], [$not q$], [$p arrow.r q$],
    [$not q arrow.r not p$], [T], [T], [F], [F],
    [T], [T], [T], [F], [F],
    [T], [F], [F], [F], [T],
    [T], [F], [T], [T], [F],
    [F], [T], [T], [T], [T],
  )

  Since the columns for $p arrow.r q$ and $not q arrow.r not p$ are identical, they are logically equivalent.
]

#example[
  Consider: "If you do your homework, then you get a chocolate."

  The contrapositive is: "If you did not get a chocolate, then you did not do your homework."

  These two statements are logically equivalent.
]

#example[
  The contrapositive of "If Sara passes the final exam, then Sara passes the course" is "If Sara does not pass the course, then Sara does not pass the final exam."
]

#important[
  A conditional and its contrapositive are *always* logically equivalent. However, a conditional is *not* necessarily equivalent to its converse or inverse.
]

=== Necessary and Sufficient Conditions

The conditional and biconditional can be expressed using the terminology of necessary and sufficient conditions.

*Expressing $p arrow.r q$:*

The following are equivalent ways of stating $p arrow.r q$:
- "If $p$ then $q$"
- "$p$ implies $q$"
- "$p$ is a sufficient condition for $q$"
- "$q$ is a necessary condition for $p$"

#example[
  "If it is raining, then the ground is wet" can also be stated as:
  - "Rain is a sufficient condition for the ground being wet"
  - "The ground being wet is a necessary condition for rain"
]

*Expressing $p arrow.l.r q$:*

The following are equivalent ways of stating $p arrow.l.r q$:
- "$p$ if and only if $q$"
- "$p$ iff $q$"
- "$p$ is a necessary and sufficient condition for $q$"
- "$q$ is a necessary and sufficient condition for $p$"

#important[
  Understanding the language of necessary and sufficient conditions is essential for reading and writing mathematical proofs. When someone says "$p$ is sufficient for $q$," they mean $p arrow.r q$. When they say "$p$ is necessary for $q$," they mean $q arrow.r p$ (or equivalently, that $q$ cannot be true without $p$ being true).
]

*Order of Operations:*

When parsing logical expressions, the order of operations is:
1. Negation ($not$)
2. Conjunction ($and$) and Disjunction ($or$)
3. Conditional ($arrow.r$) and Biconditional ($arrow.l.r$)

#remark[
  When in doubt, use parentheses to clarify the intended meaning.
]

== Valid and Invalid Arguments

#definition[
  Given a collection of statements $P_1, P_2, ..., P_n$ called *premises* and another statement $Q$ called the *conclusion*, an *argument* is the assertion that the conjunction of the premises implies the conclusion.

  Symbolically:
  $
    P_1 \
    P_2 \
    dots.v \
    P_n \
    therefore Q
  $

  This means: $(P_1 and P_2 and dots.h and P_n) arrow.r Q$
]

#example[
  Consider the argument:
  - If it is raining, then there are clouds.
  - It is raining.
  - Therefore, there are clouds.

  This is a valid argument. The form is: $p arrow.r q, p therefore q$
]

#example[
  Consider the argument:
  - If it is raining, then there are clouds.
  - There are clouds.
  - Therefore, it is raining.

  This is an *invalid* argument. The form is: $p arrow.r q, q therefore p$

  We can see this is invalid by considering a situation where there are clouds but it is not raining. Both premises are true, but the conclusion is false.
]

#definition[
  An argument is *valid* if whenever all of the premises are true, the conclusion is also true.

  Equivalently, an argument is valid if $(P_1 and P_2 and dots.h and P_n) arrow.r Q$ is a tautology.
]

#definition[
  An argument is *invalid* if it is possible to have a situation where all of the premises are true but the conclusion is false.
]

=== Argument Forms

We can check whether an argument is valid or invalid using a truth table. An argument is valid if every row where all premises are true also has the conclusion true.

#theorem("Modus Ponens")[
  The argument form $p arrow.r q, p therefore q$ is valid.
]

#proof[
  We verify this using a truth table:

  #table(
    columns: 4,
    align: center,
    [$p$], [$q$], [$p arrow.r q$ (Premise 1)], [$p$ (Premise 2)],
    [$q$ (Conclusion)], [T], [T], [T],
    [T], [T], [T], [F],
    [F], [T], [F], [F],
    [T], [T], [F], [T],
    [F], [F], [T], [F],
    [F],
  )

  The only row where all premises are true is row 1. In that row, the conclusion is also true. Therefore, the argument is valid.
]

#important[
  When checking validity with a truth table, we only need to examine rows where *all* premises are true. Rows where one or more premises are false can be ignored.
]

#example[
  Show that the argument form $p arrow.r q, q therefore p$ is invalid.

  #table(
    columns: 4,
    align: center,
    [$p$], [$q$], [$p arrow.r q$ (Premise 1)], [$q$ (Premise 2)],
    [$p$ (Conclusion)], [T], [T], [T],
    [T], [T], [T], [F],
    [F], [F], [F], [F],
    [T], [T], [T], [F],
    [F], [F], [T], [F],
    [F],
  )

  Rows 1 and 3 have all premises true. In row 1, the conclusion is true. However, in row 3 (where $p$ is false and $q$ is true), both premises are true but the conclusion is false. Therefore, the argument is invalid.
]

=== Rules of Inference

Rules of inference are argument forms that are well-known to be valid. We can use these to determine the validity of more complicated arguments without constructing truth tables.

*Common Rules of Inference:*

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  inset: 12pt,
  [*Name*], [*Rule*], [*Description*],

  [Modus Ponens],
  align(center)[$p arrow.r q \ p \ therefore q$],
  [If $p$ implies $q$ and $p$ is true, then $q$ is true],

  [Modus Tollens],
  align(center)[$p arrow.r q \ not q \ therefore not p$],
  [If $p$ implies $q$ and $q$ is false, then $p$ is false],

  [Hypothetical Syllogism],
  align(center)[$p arrow.r q \ q arrow.r r \ therefore p arrow.r r$],
  [Chain implications together],

  [Disjunctive Syllogism],
  align(center)[$p or q \ not p \ therefore q$],
  [If one of two alternatives is false, the other is true],

  [Addition],
  align(center)[$p \ therefore p or q$],
  [A true statement remains true when OR'd with anything],

  [Simplification],
  align(center)[$p and q \ therefore p$],
  [From a conjunction, extract either conjunct],

  [Conjunction],
  align(center)[$p \ q \ therefore p and q$],
  [Two true statements can be combined],

  [Resolution],
  align(center)[$p or q \ not p or r \ therefore q or r$],
  [Eliminate common variable between disjunctions],
)

#example[
  Determine if the following argument is valid using rules of inference:

  $
    p arrow.r not r \
    r or not q \
    q \
    therefore not p
  $

  We start with the three premises:
  1. $p arrow.r not r$
  2. $r or not q$
  3. $q$

  From (2), by commutativity: $not q or r$

  Rewrite as conditional: $q arrow.r r$ ... (5)

  From (3) and (5), by modus ponens: $r$ ... (6)

  From (6), by double negative: $not not r$ ... (7)

  From (1) and (7), by modus tollens: $not p$

  Therefore, the argument is valid. We have shown that the premises imply the conclusion using only valid rules of inference.
]

#remark[
  This is how mathematical proofs work: we start with statements known to be true (axioms, previously proven theorems), then combine them using valid arguments to derive new true statements until we reach our desired conclusion.
]

=== Methods for Determining Validity

There are three main methods for determining whether an argument is valid or invalid:

1. *Truth Table Method:* Check if every row where all premises are true also has the conclusion true
2. *Rules of Inference:* Combine premises using known valid argument forms
3. *Searching for Counterexamples:* Try to find truth values that make all premises true but the conclusion false

*Method 3: Searching for Counterexamples*

This method is based on the observation that an argument is invalid if and only if there exists a situation where all premises are true but the conclusion is false.

#important[
  - If we can find truth values that make all premises true and the conclusion false, then the argument is *invalid*.
  - If it is impossible to find such truth values, then the argument is *valid*.
]

#example[
  Use the counterexample method to show that $p arrow.r q, q therefore p$ is invalid.

  We try to make all premises true and the conclusion false.

  - Since $p$ is the conclusion, set $p =$ false
  - Since $q$ is a premise, set $q =$ true
  - Check premise $p arrow.r q$: With $p =$ false and $q =$ true, we have $p arrow.r q =$ true ✓

  We found truth values ($p =$ false, $q =$ true) where all premises are true but the conclusion is false. Therefore, the argument is invalid.
]

#example[
  Use the counterexample method to show that the following argument is valid:

  $
    p arrow.r not r \
    r or not q \
    q \
    therefore not p
  $

  Suppose the argument is invalid. Then we can find truth values making all premises true and the conclusion false.

  - For the conclusion $not p$ to be false, we need $p =$ true
  - For premise $q$ to be true, we need $q =$ true
  - For premise $p arrow.r not r$ to be true (with $p =$ true), we need $not r =$ true, so $r =$ false
  - For premise $r or not q$ to be true (with $r =$ false and $q =$ true), we need $not q =$ true

  But $q =$ true means $not q =$ false, which contradicts our requirement.

  Since it is impossible to make all premises true and the conclusion false simultaneously, the argument is valid.
]

#remark[
  When an argument has many statement variables, the truth table method requires $2^n$ rows for $n$ variables, which can be time-consuming. The rules of inference method and counterexample method are often more efficient for complex arguments.
]

=== Fallacies

A *fallacy* is an error in reasoning that results in an invalid argument. Recognising common fallacies helps us avoid making logical mistakes and identify flawed arguments.

*Common Logical Fallacies:*

#definition("Converse Error (Affirming the Conclusion)")[
  The fallacy of assuming that $p arrow.r q$ and $q$ together imply $p$.

  Form: $ p arrow.r q \ q \ therefore p $

  This is invalid because $q$ could be true for reasons other than $p$ being true.
]

#example[
  - If I am in Paris, then I am in France.
  - I am in France.
  - Therefore, I am in Paris. ✗

  This is invalid; I could be in Lyon, Marseille, or any other French city.
]

#definition("Inverse Error (Denying the Hypothesis)")[
  The fallacy of assuming that $p arrow.r q$ and $not p$ together imply $not q$.

  Form: $ p arrow.r q \ not p \ therefore not q $

  This is invalid because $q$ could be true even when $p$ is false.
]

#example[
  - If it is raining, then the ground is wet.
  - It is not raining.
  - Therefore, the ground is not wet. ✗

  This is invalid; the ground could be wet from a sprinkler, morning dew, etc.
]

#important[
  The converse error and inverse error are the two most common logical fallacies. They arise from confusing:
  - A conditional $p arrow.r q$ with its converse $q arrow.r p$
  - A conditional $p arrow.r q$ with its inverse $not p arrow.r not q$

  Remember: A conditional is equivalent to its *contrapositive*, not its converse or inverse.
]

#definition("Begging the Question (Circular Reasoning)")[
  The fallacy of using the conclusion (or a restatement of it) as one of the premises.

  This creates a circular argument where you assume what you're trying to prove.
]

#example[
  "The Bible is true because it is the word of God, and we know it is the word of God because the Bible says so."

  This assumes the conclusion (the Bible is true) in the premise.
]

#definition("False Disjunction (False Dichotomy)")[
  The fallacy of presenting two alternatives as the only possibilities when other alternatives exist.

  Form: $ p or q \ not p \ therefore q $

  This is valid *only if* $p or q$ truly represents all possibilities. If there are other options, the argument is fallacious.
]

#example[
  - Either you support the new policy, or you do not care about students.
  - You do not support the new policy.
  - Therefore, you do not care about students. ✗

  This is fallacious because there are other reasons to oppose the policy besides not caring about students.
]

#definition("Ad Hominem")[
  The fallacy of attacking the person making an argument rather than addressing the argument itself.

  This is a fallacy because the truth of a statement is independent of who states it.
]

#remark[
  While ad hominem attacks are fallacious in formal logic, questioning someone's credibility or expertise can be relevant in informal reasoning (e.g., judging the reliability of testimony).
]

*Summary Table of Invalid Argument Forms:*

#table(
  columns: (auto, auto, auto),
  align: (left, center, left),
  [*Fallacy*], [*Invalid Form*], [*Confusion*],

  [Converse Error],
  $p arrow.r q \ q \ therefore p$,
  [Confuses $p arrow.r q$ with $q arrow.r p$],

  [Inverse Error],
  $p arrow.r q \ not p \ therefore not q$,
  [Confuses $p arrow.r q$ with $not p arrow.r not q$],

  [Begging the Question],
  [Premises include conclusion],
  [Circular reasoning],

  [False Dichotomy],
  [$p or q$ (incomplete) \ $not p$ \ $therefore q$],
  [Assumes only two alternatives],
)

#important[
  To avoid fallacies:
  1. Verify that your argument form is valid (use truth tables or rules of inference)
  2. Ensure premises are actually true, not assumed
  3. Check that all alternatives have been considered
  4. Focus on the argument, not the person making it
]

== Quantified Statements

#lorem(30)

=== Universal and Existential Quantifiers

#lorem(25)

=== Negation of Quantified Statements

#lorem(25)

=== Statements with Multiple Quantifiers

#lorem(25)

=== Order of Quantifiers

#lorem(25)
