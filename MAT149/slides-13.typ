#import "preamble.typ": *
#show: mat149-slides.with([Unit 13: Series])

// Ported from the MAT137 class slides, unit 13 (2022-2023-MAT137/unit-13/137-CA-13.tex).
// Covers videos 13.5-13.19 and 14.1-14.2: the definition of series,
// geometric series, the necessary condition, the integral and comparison
// tests, alternating series, absolute convergence, and the ratio test.
//
// Differences from the LaTeX source:
// - "Convergence Tests: Ninja Level" appeared twice (in the alternating-series
//   and the absolute-convergence lectures); only the first copy is kept.

#let red(it) = text(fill: rgb("#c0392b"), it)
#let blue(it) = text(fill: rgb("#1f5fbf"), it)
#let Sn = $lr({S_n})_(n=0)^oo$
#let series = $display(sum_(n=0)^oo a_n)$

// ---------------------------------------------------------------------------
// Definition of series
// ---------------------------------------------------------------------------

#lecture([Definition of Series], videos: ("13.5", "13.6", "13.7"))

#exercise(title: [Rapid Questions: Improper Integrals])[
  Convergent or divergent?

  + $display(integral_1^oo 1/x^2 dif x)$
  + $display(integral_1^oo 1/x dif x)$
  + $display(integral_1^oo 1/sqrt(x) dif x)$
  + $display(integral_1^oo (x + 1)/(x^3 + 2) dif x)$
  + $display(integral_1^oo sqrt(x^2 + 5)/(x^2 + 6) dif x)$
  + $display(integral_1^oo (x^2 + 3)/sqrt(x^5 + 2) dif x)$
]

#exercise(title: [A Telescopic Series], num_prefix: auto)[
  I want to calculate the value of the series $display(sum_(n=1)^oo 1/(n^2 + 2n))$.

  + Find a formula for the $k$-th partial sum $display(S_k = sum_(n=1)^k 1/(n^2 + 2n))$.

    _Hint:_ $display(1/(n^2 + 2n) = A/n + B/(n + 2))$
  + Using the definition of series, compute the value of
    $
      sum_(n=1)^oo 1/(n^2 + 2n)
    $
]

#exercise(title: [What Is Wrong with This Calculation? Fix It], num_prefix: auto)[
  *Claim:* $display(sum_(n=2)^oo ln n/(n + 1) = ln 2)$

  #bogus_proof[
    _"Proof."_
    $
      sum_(n=2)^oo ln n/(n + 1) & = sum_(n=2)^oo [ln n - ln(n + 1)] \
      & = sum_(n=2)^oo ln(n) - sum_(n=2)^oo ln(n + 1) \
      & = (ln 2 + ln 3 + ln 4 + dots.c) - (ln 3 + ln 4 + dots.c) \
      & = ln 2
    $
  ]
]

#exercise(title: [True or False --- The Tail of a Series], num_prefix: auto)[
  + IF the series #blue($display(sum_(n=0)^oo a_n)$) converges, THEN the series
    #red($display(sum_(n=7)^oo a_n)$) converges.
  + IF the series #red($display(sum_(n=7)^oo a_n)$) converges, THEN the series
    #blue($display(sum_(n=0)^oo a_n)$) converges.
  + IF the series #red($display(sum_(n=0)^oo a_n)$) converges, THEN the series
    #blue($display(sum_(n=7)^oo a_n)$) converges to a smaller number.
]

// ---------------------------------------------------------------------------
// Properties of series
// ---------------------------------------------------------------------------

#lecture([Properties of Series], videos: ("13.8", "13.9"))

#exercise(title: [Geometric Series], num_prefix: auto)[
  Calculate the value of the following series:

  + $display(1 + 1/3 + 1/9 + 1/27 + 1/81 + dots.c)$
  + $display(1/2 - 1/4 + 1/8 - 1/16 + 1/32 - dots.c)$
  + $display(3/2 - 9/4 + 27/8 - 81/16 + dots.c)$
  + $display(1 + 1/2^0.5 + 1/2 + 1/2^1.5 + 1/2^2 + 1/2^2.5 + dots.c)$
  + $display(sum_(n=1)^oo (-1)^n 3^n/2^(2n+1))$
  + $display(sum_(n=k)^oo x^n)$
]

#exercise(title: [Is $0.999999... = 1$?], num_prefix: auto)[
  + Write the number $0.9999999...$ as a series.

    _Hint:_ $427 = 400 + 20 + 7$.
  + Compute the first few partial sums.
  + Add up the series.

    _Hint:_ it is geometric.
]

#exercise(title: [Examples], num_prefix: auto)[
  + A series $display(sum_(n=0)^oo a_n)$ may be
    $
      cases(
        "convergent (a number)",
        "divergent" cases("to" oo, "to" -oo, "\"oscillating\""),
      )
    $
    Give one example of each of the four results.
  + Now assume $forall n in NN, a_n >= 0$. Which of the four outcomes is still possible?
]

#exercise(title: [True or False --- Definition of Series], num_prefix: auto)[
  Let #series be a series. Let #Sn be its partial-sum sequence.

  + IF #blue[the series #series is convergent], THEN #red[the sequence #Sn is bounded].
  + IF #blue[the series #series is convergent], THEN #red[the sequence #Sn is eventually
      monotonic].
  + IF #red[the sequence #Sn is bounded and eventually monotonic], THEN #blue[the series #series
      is convergent].
]

#exercise(title: [True or False --- Definition of Series (continued)])[
  Let #series be a series. Let #Sn be its partial-sum sequence.

  4. IF #blue[$forall n > 0$, $a_n > 0$], THEN #red[the sequence #Sn is increasing].
  + IF #red[the sequence #Sn is increasing], THEN #blue[$forall n > 0$, $a_n > 0$].
  + IF #blue[$forall n > 0$, $a_n >= 0$], THEN #red[the sequence #Sn is non-decreasing].
  + IF #red[the sequence #Sn is non-decreasing], THEN #blue[$forall n > 0$, $a_n >= 0$].
]

#lecture([Properties of Series II], videos: ("13.10", "13.12"))

#exercise(title: [Rapid Questions: Geometric Series])[
  Convergent or divergent?

  + $display(sum_(n=0)^oo 1/2^n)$
  + $display(sum_(n=1)^oo (-1)^n/2^n)$
  + $display(sum_(n=1)^oo 1/2^(n \/ 2))$
  + $display(sum_(n=5)^oo 3^n/2^(2n+1))$
  + $display(sum_(n=3)^oo 3^n/(1000 dot 2^(n+2)))$
  + $display(sum_(n=0)^oo (-1)^n)$
]

#exercise(title: [True or False --- The Necessary Condition], num_prefix: auto)[
  + IF $display(lim_(n -> oo) a_n = 0)$, THEN $display(sum_n^oo a_n)$ is convergent.
  + IF $display(lim_(n -> oo) a_n != 0)$, THEN $display(sum_n^oo a_n)$ is divergent.
  + IF $display(sum_n^oo a_n)$ is convergent, THEN $display(lim_(n -> oo) a_n = 0)$.
  + IF $display(sum_n^oo a_n)$ is divergent, THEN $display(lim_(n -> oo) a_n != 0)$.
]

#exercise(title: [What Can You Conclude?], num_prefix: auto)[
  Assume $forall n in NN, a_n > 0$. Consider the series #series. Let #Sn be its sequence of partial
  sums.

  In each of the following cases, what can you conclude about the _series_? Is it convergent,
  divergent, or we do not know?

  + $forall n in NN, quad exists M in RR "s.t." quad S_n <= M$.
  + $exists M in RR "s.t." quad forall n in NN, quad S_n <= M$.
  + $exists M > 0 "s.t." quad forall n in NN, quad a_n <= M$.
  + $exists M > 0 "s.t." quad forall n in NN, quad a_n >= M$.
]

#exercise(title: [Functions as Series], num_prefix: auto)[
  You know that when $abs(x) < 1$:
  $
    f(x) = 1/(1 - x) = sum_(n=0)^oo x^n
  $
  Find similar ways to write the following functions as series:

  + $display(g(x) = 1/(1 + x))$
  + $display(h(x) = 1/(1 - x^2))$
  + $display(A(x) = 1/(2 - x))$
  + $G(x) = ln(1 + x)$

  _Hint:_ For the last one, compute $G'$.
]

// ---------------------------------------------------------------------------
// Integral test and comparison tests
// ---------------------------------------------------------------------------

#lecture([Integral Test and Comparison Tests], videos: ("13.13",))

#exercise(title: [For Which Values of $a in RR$ Are These Series Convergent?], num_prefix: auto)[
  + $display(sum_n^oo 1/a^n)$
  + $display(sum_n^oo 1/n^a)$
  + $display(sum_n^oo a^n)$
  + $display(sum_n^oo n^a)$
]

#exercise(title: [Quick Comparisons: Convergent or Divergent?], num_prefix: auto)[
  + $display(sum_n^oo (n + 1)/(n^2 + 1))$
  + $display(sum_n^oo (n^2 + 3n)/(n^4 + 5n + 1))$
  + $display(sum_n^oo (sqrt(n) + 1)/(n^2 + 1))$
  + $display(sum_n^oo (root(3, n^2 + 1) + 1)/(sqrt(n^3 + n) + n + 1))$
]

#exercise(title: [Slow Comparisons: Convergent or Divergent?], num_prefix: auto)[
  + $display(sum_n^oo (2^n - 40)/(3^n - 20))$
  + $display(sum_n^oo (ln n)^20/n^2)$
  + $display(sum_n^oo sin^2 1/n)$
  + $display(sum_n^oo 1/(n (ln n)^3))$
  + $display(sum_n^oo 1/(n ln n))$
  + $display(sum_n^oo e^(-n^2))$
]

// ---------------------------------------------------------------------------
// Alternating series
// ---------------------------------------------------------------------------

#lecture([Alternating Series], videos: ("13.15",))

#exercise(title: [Rapid Questions: Alternating Series Test])[
  Convergent or divergent?

  + $display(sum_(n=1)^oo 1/n^0.5)$
  + $display(sum_(n=1)^oo 1/n^3)$
  + $display(sum_(n=1)^oo 1/(sin n))$
  + $display(sum_(n=1)^oo (-1)^n/n^0.5)$
  + $display(sum_(n=1)^oo (-1)^n/n^3)$
  + $display(sum_(n=1)^oo (-1)^n/(sin n))$
]

#exercise(title: [Estimation], num_prefix: auto)[
  Estimate the sum
  $
    S = sum_(n=0)^oo (-1)^n/(2n + 1)!
  $
  with an error smaller than 0.001. Write your final answer as a rational number (i.e., as a
  quotient of two integers).
]

#exercise(title: [Convergence Tests: Ninja Level], num_prefix: auto)[
  We know
  - $forall n in NN$, $a_n > 0$.
  - the series $display(sum_n^oo a_n)$ is convergent

  Determine whether the following series are convergent, divergent, or we do not have enough
  information to decide:

  + $display(sum_n^oo sin a_n)$
  + $display(sum_n^oo cos a_n)$
  + $display(sum_n^oo sqrt(a_n))$
  + $display(sum_n^oo (a_n)^2)$
]

// ---------------------------------------------------------------------------
// Absolute and conditional convergence
// ---------------------------------------------------------------------------

#lecture([Absolute and Conditional Convergence], videos: ("13.18", "13.19"))

#exercise(title: [True or False --- Absolute Values], num_prefix: auto)[
  + IF #blue($lr({a_n})_(n=1)^oo$) is convergent, THEN #red($lr({abs(a_n)})_(n=1)^oo$) is
    convergent.
  + IF #red($lr({abs(a_n)})_(n=1)^oo$) is convergent, THEN #blue($lr({a_n})_(n=1)^oo$) is
    convergent.
  + IF #blue($display(sum_(n=1)^oo a_n)$) is convergent, THEN #red($display(sum_(n=1)^oo abs(a_n))$)
    is convergent.
  + IF #red($display(sum_(n=1)^oo abs(a_n))$) is convergent, THEN #blue($display(sum_(n=1)^oo a_n)$)
    is convergent.
]

#exercise(title: [Absolutely Convergent or Conditionally Convergent?], num_prefix: auto)[
  + $display(sum_(n=1)^oo (-1)^n/n^0.5)$
  + $display(sum_(n=1)^oo (-1)^n/n^1.5)$
  + $display(sum_(n=1)^oo (-1)^n/(sin n))$
]

// ---------------------------------------------------------------------------
// Ratio test
// ---------------------------------------------------------------------------

#lecture([Ratio Test], videos: ("14.1", "14.2"))

#exercise(title: [Quick Review: Convergent or Divergent?])[
  + $display(sum_n^oo (1.1)^n)$
  + $display(sum_n^oo (0.9)^n)$
  + $display(sum_n^oo 1/n^1.1)$
  + $display(sum_n^oo 1/n^0.9)$
  + $display(sum_n^oo (-1)^n/(ln n))$
  + $display(sum_n^oo (-1)^n/e^(1 \/ n))$
  + $display(sum_n^oo (n^3 + n^2 + 11)/(n^4 + 2n - 3))$
  + $display(sum_n^oo sqrt(n^5 + 2n + 16)/(n^4 - 11n + 7))$
]

#exercise(title: [Ratio Test: Convergent or Divergent?], num_prefix: auto)[
  Use Ratio Test to decide which series are convergent.

  + $display(sum_(n=1)^oo 3^n/n!)$
  + $display(sum_(n=1)^oo (2n)!/((n!)^2 3^(n+1)))$
  + $display(sum_(n=2)^oo n!/n^n)$
  + $display(sum_(n=2)^oo 1/(ln n))$
]

#exercise(title: [Challenge], num_prefix: auto)[
  We want to calculate the value of
  $
    A = sum_(n=0)^oo 1/2^n, quad B = sum_(n=1)^oo n/2^n, quad C = sum_(n=1)^oo n^2/2^n
  $
  Let $display(f(x) = 1/(1 - x))$.

  #line(length: 100%, stroke: .5pt)

  + Recall that $display(f(x) = sum_(n=0)^oo x^n)$ for $abs(x) < 1$. Use it to compute $A$.
  + Pretend you can take derivatives of series the way you take them of finite sums. Write $f'(x)$
    as a series.
  + Use it to compute $B$.
  + Do something similar to compute $C$.
]
