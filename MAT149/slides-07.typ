#import "preamble.typ": *
#show: mat149-slides.with([Unit 7: The Definition of the Integral])

// Ported from the MAT137 class slides, unit 7 (2022-2023-MAT137/unit-7/137-CA-07.tex).
// Covers videos 7.3-7.11 and 8.1-8.2: sigma notation, suprema and infima,
// partitions and Darboux sums, properties of the integral, and integrals as
// limits of Riemann sums.

// ---------------------------------------------------------------------------
// Sums and sigmas
// ---------------------------------------------------------------------------

#lecture([Sums and Sigmas], videos: ("7.3", "7.4"))

#exercise(title: [Warm-up: Sums])[
  Compute

  + $display(sum_(i=2)^4 (2i+1))$
  + $display(sum_(i=2)^4 2i + 1)$
  + $display(sum_(j=2)^4 (2i + 1))$
]

#exercise(title: [Write These Sums with $Sigma$ Notation], num_prefix: auto)[
  + $1^5 + 2^5 + 3^5 + 4^5 + dots.c + 100^5$
  + $display(2/4^2 + 2/5^2 + 2/6^2 + 2/7^2 + dots.c + 2/N^2)$
  + $cos 0 - cos 1 + cos 2 - cos 3 + dots.c plus.minus cos(N+1)$
  + $display(1/0! + 1/2! + 1/4! + 1/6! + dots.c + 1/(2N)!)$
  + $display(1/1! - 1/3! + 1/5! - 1/7! + dots.c + 1/81!)$
  + $display((2x^3)/4! + (3x^4)/5! + (4x^5)/6! + dots.c + (999x^1000)/1001!)$
]

#exercise(title: [Telescopic Sum], num_prefix: auto)[
  + Calculate the exact value of
    $
      sum_(i=1)^137 [1/i - 1/(i+1)]
    $
    _Hint:_ Write down the first few terms.
  + Calculate the exact value of
    $
      sum_(i=1)^(10,000) 1/(i(i+1))
    $
]

#exercise(title: [Double Sums], num_prefix: auto)[
  Compute:

  + $display(sum_(i=1)^N sum_(k=1)^N 1)$
  + $display(sum_(i=1)^N sum_(k=1)^i 1)$
  + $display(sum_(i=1)^N sum_(k=1)^i i)$
  + $display(sum_(i=1)^N sum_(k=1)^i k)$
  + $display(sum_(i=1)^N sum_(k=1)^i (i k))$

  #text(size: .75em)[
    Useful formulas:
    $
      sum_(j=1)^N j & = (N(N+1))/2 \
      sum_(j=1)^N j^2 & = (N(N+1)(2N+1))/6 \
      sum_(j=1)^N j^3 & = (N^2 (N+1)^2)/4
    $
  ]
]

// ---------------------------------------------------------------------------
// Suprema and infima
// ---------------------------------------------------------------------------

#lecture([Suprema and Infima], videos: ("7.5", "7.6"))

#exercise(title: [Warm-up: Suprema and Infima])[
  Find the supremum, infimum, maximum, and minimum of the following sets (if they exist):

  + $A = [-1, 5)$
  + $B = (-oo, 6] union (8, 9)$
  + $C = {2, 3, 4}$
  + $D = {1/n : n in ZZ, n > 0}$
  + $E = {(-1)^n / n : n in ZZ, n > 0}$
  + $F = {2^n : n in ZZ}$
]

#exercise(title: [Suprema from a Graph], num_prefix: auto)[
  Calculate, for the function $g$ on the interval $[0.5, 1.5]$:

  + supremum
  + infimum
  + maximum
  + minimum

  #align(center, image("images/G20.svg", height: 5.5cm))
]

#exercise(title: [Empty Set], num_prefix: auto)[
  + Does $emptyset$ have an upper bound?
  + Does $emptyset$ have a supremum?
  + Does $emptyset$ have a maximum?
  + Is $emptyset$ bounded above?
]

#exercise(title: [Equivalent Definitions of Supremum], num_prefix: auto)[
  *Assume $S$ is an upper bound of the set $A$.* Which of the following is equivalent to "$S$ is
  the supremum of $A$"?

  #choices(
    [If $R$ is an upper bound of $A$, then $S <= R$.],
    [$forall R >= S$, $R$ is an upper bound of $A$.],
    [$forall R <= S$, $R$ is not an upper bound of $A$.],
    [$forall R < S$, $R$ is not an upper bound of $A$.],
    [$forall R < S$, $exists x in A$ such that $R < x$.],
    [$forall R < S$, $exists x in A$ such that $R <= x$.],
    [$forall R < S$, $exists x in A$ such that $R < x <= S$.],
    [$forall R < S$, $exists x in A$ such that $R < x < S$.],
    [$forall epsilon > 0$, $exists x in A$ such that $S - epsilon < x$.],
    [$forall epsilon > 0$, $exists x in A$ such that $S - epsilon < x <= S$.],
  )
]

// ---------------------------------------------------------------------------
// The definition of the integral
// ---------------------------------------------------------------------------

#lecture([The Definition of the Integral], videos: ("7.7", "7.8", "7.11"))

#exercise(title: [Equivalent or Not], num_prefix: auto)[
  Let $A subset RR$ and let $s in RR$.

  #choices(
    [$exists x in A$ such that $2 < x$],
    [$exists x in A$ such that $2 <= x$],
  )

  + Does *(A)* imply *(B)*?
  + Does *(B)* imply *(A)*?

  #choices(
    start: 3,
    [$forall r < s, exists x in A$ such that $r < x$.],
    [$forall r < s, exists x in A$ such that $r <= x$.],
  )

  3. Does *(C)* imply *(D)*?
  + Does *(D)* imply *(C)*?
]

#exercise(title: [Warm-up: Partitions])[
  Which ones are partitions of $[0, 2]$?

  #choices(
    columns: 2,
    $[0, 2]$,
    ${0.5, 1, 1.5}$,
    ${0, 2}$,
    ${1, 2}$,
    ${0, e, 2}$,
    ${0, 1.5, 1.6, 1.7, 1.8, 1.9, 2}$,
    ${n/(n+1) : n in NN} union {2}$,
  )
]

#exercise(title: [Warm-up: Lower and Upper Sums])[
  Let $f(x) = sin x$.

  Consider the partition $P = {0, 1, 3}$ of the interval $[0, 3]$.

  Calculate $L_P (f)$ and $U_P (f)$.
]

#exercise(title: [Equations for Lower and Upper Sums], num_prefix: auto)[
  Let $f$ be a *decreasing*, bounded function on $[a, b]$. Let $P = {x_0, x_1, ..., x_N}$ be a
  partition of $[a, b]$.

  Which ones are a valid equation for $L_P (f)$? For $U_P (f)$?

  #choices(
    columns: 3,
    $display(sum_(i=0)^N f(x_i) Delta x_i)$,
    $display(sum_(i=1)^N f(x_i) Delta x_i)$,
    $display(sum_(i=0)^(N-1) f(x_i) Delta x_i)$,
    $display(sum_(i=1)^N f(x_(i+1)) Delta x_i)$,
    $display(sum_(i=1)^N f(x_(i-1)) Delta x_i)$,
    $display(sum_(i=0)^(N-1) f(x_i) Delta x_(i+1))$,
  )

  Recall: $Delta x_i = x_i - x_(i-1)$.
]

#exercise(title: [Joining Partitions], num_prefix: auto)[
  Assume
  $
    L_P (f) & = 2, quad & U_P (f) & = 6 \
    L_Q (f) & = 3, quad & U_Q (f) & = 8
  $

  + Is $P subset Q$?
  + Is $Q subset P$?
  + What can you say about $L_(P union Q) (f)$ and $U_(P union Q) (f)$?
]

#exercise(title: [A Tricky Question], num_prefix: auto)[
  Let $f$ be a bounded function on $[a, b]$. Which statement is true?

  #choices(
    [There exists a partition $P$ of $[a, b]$ such that
      $#lowint($a$, $b$) = L_P (f)$ and $#upint($a$, $b$) = U_P (f)$.],
    [There exist partitions $P$ and $Q$ of $[a, b]$ such that
      $#lowint($a$, $b$) = L_P (f)$ and $#upint($a$, $b$) = U_Q (f)$.],
    [There exists a partition $P$ of $[a, b]$ such that $#lowint($a$, $b$) = L_P (f)$.],
  )

  #v(.5em)
  #align(center, darboux-line())
]

// ---------------------------------------------------------------------------
// Examples and properties of the integral
// ---------------------------------------------------------------------------

#lecture([Examples and Properties of the Integral], videos: ("7.9", "7.10"))

#exercise(title: [Properties of the Integral], num_prefix: auto, size: .85em)[
  Assume we know the following
  $
    integral_0^2 f(x) dif x = 3, quad integral_0^4 f(x) dif x = 9, quad
    integral_0^4 g(x) dif x = 2.
  $
  Compute:

  + $display(integral_0^2 f(t) dif t)$
  + $display(integral_0^2 f(x) dif x)$
  + $display(integral_0^2 f(t) dif x)$
  + $display(integral_2^0 f(x) dif x)$
  + $display(integral_2^4 f(x) dif x)$
  + $display(integral_(-2)^0 f(x) dif x)$
  + $display(integral_0^4 [f(x) - 2g(x)] dif x)$
]

#exercise(title: [Example: A Non-Continuous Function], num_prefix: auto)[
  Consider the function $f(x) = cases(0 & x = 0, 5 & 0 < x <= 1)$, defined on $[0, 1]$.

  + Let $P = {0, 0.2, 0.5, 0.9, 1}$. Calculate $L_P (f)$ and $U_P (f)$ for this partition.
  + Fix an arbitrary partition $P = {x_0, x_1, ..., x_N}$ of $[0, 1]$.

    What is $U_P (f)$? What is $L_P (f)$? (Draw a picture!)
  + Find a partition $P$ with exactly 3 points (2 subintervals) such that $L_P (f) = 4.99$.
  + What is the upper integral, $#upint(0, 1)$?
  + What is the lower integral, $#lowint(0, 1)$?
  + Is $f$ integrable on $[0, 1]$?
]

#exercise(title: [An Alternative Definition], num_prefix: auto)[
  Let $f$ be a bounded function on the interval $[a, b]$. Let $M in RR$. Some of these four
  statements imply others. What implies what?

  #choices(
    [$forall$ partition $P$ of $[a, b]$, $L_P (f) <= M$],
    [$forall epsilon > 0$, $exists$ partition $P$ of $[a, b]$ s.t. $M - epsilon < L_P (f)$],
    [$M <= #lowint($a$, $b$)$],
    [$#lowint($a$, $b$) <= M$],
  )

  Based on this exercise, we could have defined $#lowint($a$, $b$)$ as "the only number $M in RR$
  satisfying these two properties: ..."

  Use the same idea to write an alternative definition of $#upint($a$, $b$)$.
]

// ---------------------------------------------------------------------------
// Integrals as limits
// ---------------------------------------------------------------------------

#lecture([Integrals as Limits], videos: ("8.1", "8.2"))

#exercise(title: [The Norm of a Partition], num_prefix: auto)[
  + Construct a partition $P$ of $[0, 1]$ such that $norm(P) = pi / 10$.
  + Construct a sequence of partitions of $[0, 1]$
    $
      P_1, P_2, P_3, ...
    $
    _as simple as possible_, such that $display(lim_(n -> oo) norm(P_n) = 0)$.
  + Construct a _different_ sequence of partitions of $[0, 1]$
    $
      Q_1, Q_2, Q_3, ...
    $
    such that $display(lim_(n -> oo) norm(Q_n) = 0)$.
]

#exercise(title: [Compute $integral_1^2 x^2 dif x$<title-math> Using Riemann Sums], num_prefix: auto)[
  Let $f(x) = x^2$ on $[1, 2]$. Let $P_n$ be the partition that breaks $[1, 2]$ into $n$
  subintervals of equal length.

  + Write an explicit formula for $P_n$.
  + What is $Delta x_i$?
  + Write the Riemann sum $S^*_(P_n) (f)$ with sigma notation (choose $x^*_i$ as the right
    endpoint).
  + Add the sum.
  + Compute $display(lim_(n -> oo) S^*_(P_n) (f))$.
  + Repeat the last 3 questions when we choose $x^*_i$ as the left endpoint.

  #text(size: .75em)[
    _Helpful identities:_
    $display(sum_(i=1)^N i = (N(N+1))/2)$, quad
    $display(sum_(i=1)^N i^2 = (N(N+1)(2N+1))/6)$
  ]
]

#exercise(title: [Example 3: A Very Non-Continuous Function], num_prefix: auto)[
  Consider the function $f$ defined on $[0, 1]$:
  $
    f(x) = cases(
      1 \/ 2 & "if" 0 <= x <= 1 \/ 2,
      1 & "if" 1 \/ 2 < x <= 1 "and" x in QQ,
      0 & "if" 1 \/ 2 < x <= 1 "and" x in.not QQ,
    )
  $

  + Draw a picture!
  + Let $P = {0, 0.2, 0.4, 0.6, 0.8, 1}$. Calculate $L_P (f)$ and $U_P (f)$.
  + Construct a partition $P$ such that $L_P (f) = 1/4$ and $U_P (f) = 3/4$.
  + What is the upper integral, $#upint(0, 1)$?
  + What is the lower integral, $#lowint(0, 1)$?
  + Is $f$ integrable on $[0, 1]$?
]

#exercise(title: [Fix These FALSE Statements], num_prefix: auto, two-column: false)[
  + Let $f$ and $g$ be bounded functions on $[a, b]$. Then
    $
      sup_([a, b]) (f + g) = sup_([a, b]) f + sup_([a, b]) g
    $
  + Let $a < b < c$. Let $f$ be a bounded function on $[a, c]$. Then
    $
      sup_([a, c]) f = sup_([a, b]) f + sup_([b, c]) f
    $
  + Let $f$ be a bounded function on $[a, b]$. Let $c in RR$. Then
    $
      sup_([a, b]) (c f) = c (sup_([a, b]) f)
    $

  #text(size: .75em)[Here $sup_([a, b]) f$ means the supremum of $f$ on $[a, b]$.]
]
