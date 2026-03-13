#import "/lib.typ": *

= Mathematical Induction

#lorem(30)

#theorem("Principle of Mathematical Induction")[
  Let $P(n)$ be a statement for each $n in NN$. If
  + (*Base case*) $P(1)$ is true, and
  + (*Inductive step*) for all $k >= 1$: $P(k)$ true $=>$ $P(k+1)$ true,
  then $P(n)$ is true for all $n in NN$.
]

#remark[
  The base case may start at any integer $n_0$, in which case the conclusion
  is that $P(n)$ holds for all $n >= n_0$. Strong induction assumes $P(1),
  dots, P(k)$ all hold to prove $P(k+1)$.
]

#example("Gauss Sum")[
  *Claim:* For all $n >= 1$, $display(sum_(k=1)^n k = n(n+1)/2)$.

  *Proof by induction.* \
  *Base case ($n=1$):* $sum_(k=1)^1 k = 1 = 1 dot 2 / 2$. #sym.checkmark \
  *Inductive step:* Assume $sum_(k=1)^n k = n(n+1)/2$. Then
  $
    sum_(k=1)^(n+1) k
    = underbrace(sum_(k=1)^n k, = n(n+1)/2) + (n+1)
    = (n(n+1))/2 + (2(n+1))/2
    = ((n+1)(n+2))/2.
  $
  This is the formula with $n$ replaced by $n+1$. #sym.checkmark
]

#lorem(15)

#exercise("Geometric Sum")[
  Prove by induction that for all $n >= 1$ and $r eq.not 1$:
  $
    sum_(k=0)^n r^k = (r^(n+1) - 1) / (r - 1).
  $
]

#solution[
  *Base case ($n=0$):* LHS $= r^0 = 1$. RHS $= (r-1)/(r-1) = 1$. #sym.checkmark

  *Inductive step:* Assume the formula holds for $n$. Then
  $
    sum_(k=0)^(n+1) r^k
    = (r^(n+1) - 1)/(r - 1) + r^(n+1)
    = (r^(n+1) - 1 + r^(n+1)(r-1)) / (r-1)
    = (r^(n+2) - 1) / (r - 1). #sym.checkmark
  $
]

#exercise[
  Prove that $n! > 2^n$ for all $n >= 4$.
]

#exercise("Tiling")[
  #lorem(30)
]
