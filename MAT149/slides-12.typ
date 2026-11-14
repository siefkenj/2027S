#import "preamble.typ": *
#show: mat149-slides.with([Unit 12: Improper Integrals])

// Ported from the MAT137 class slides, unit 12 (2022-2023-MAT137/unit-12/137-CA-12.tex).
// Covers videos 12.7-12.10 and 13.2-13.4: the definition of improper
// integrals, the basic comparison test, and the limit comparison test.

#let red(it) = text(fill: rgb("#c0392b"), it)
#let blue(it) = text(fill: rgb("#1f5fbf"), it)

// The three "True or False --- Comparisons" slides differ only in their
// hypothesis.
#let comparisons(title, hypothesis) = exercise(title: title, num_prefix: auto, two-column: false)[
  Let $a in RR$. Let $f$ and $g$ be continuous functions on $[a, oo)$. Assume that
  #boxed(hypothesis). Which statements are correct?

  #let F = blue($integral_a^oo f(x) dif x$)
  #let G = red($integral_a^oo g(x) dif x$)
  #choices(
    [IF $display(#F)$ is convergent, THEN $display(#G)$ is convergent.],
    [IF $display(#F = oo)$, THEN $display(#G = oo)$.],
    [IF $display(#G)$ is convergent, THEN $display(#F)$ is convergent.],
    [IF $display(#G = oo)$, THEN $display(#F = oo)$.],
  )
]

// ---------------------------------------------------------------------------
// Improper integrals
// ---------------------------------------------------------------------------

#lecture([Improper Integrals], videos: ("12.7", "12.8"))

#exercise(title: [Recall the Definitions], num_prefix: auto)[
  + *Type-1 improper integrals.* Let $f$ be a bounded, continuous function on $[c, oo)$. How do we
    define the improper integral
    $
      integral_c^oo f(x) dif x ?
    $
  + *Type-2 improper integrals.* Let $f$ be a continuous function on $(a, b]$, possibly with
    $x = a$ as a vertical asymptote. How do we define the improper integral
    $
      integral_a^b f(x) dif x ?
    $
]

#exercise(title: [Computation], num_prefix: auto)[
  Calculate, using the definition of improper integral
  $
    integral_1^oo 1/(x^2 + x) dif x
  $

  _Hint:_ $display(1/(x^2 + x) = ((x + 1) - (x))/(x(x + 1)))$
]

#exercise(title: [Computation?], num_prefix: auto, two-column: false, size: .85em)[
  Consider the following argument.

  #bogus_proof[
    We know
    $
      1/(x^2 + x) = ((x + 1) - (x))/(x(x + 1)) = 1/x - 1/(x + 1)
    $
    So
    $
      integral_1^oo 1/(x^2 + x) dif x = integral_1^oo 1/x dif x - integral_1^oo 1/(x + 1) dif x
    $
    Since $display(integral_1^oo 1/x dif x = integral_1^oo 1/(x + 1) dif x = oo)$, we see
    $display(integral_1^oo 1/(x^2 + x) dif x = oo - oo)$, and so it doesn't exist.
  ]
]

#exercise(title: [The Most Important Improper Integrals], num_prefix: auto)[
  Use the definition of improper integral to determine for which values of $p in RR$ each of the
  following improper integrals converges.

  + $display(integral_1^oo 1/x^p dif x)$
  + $display(integral_0^1 1/x^p dif x)$
  + $display(integral_0^oo 1/x^p dif x)$
]

#exercise(title: [Positive Functions], num_prefix: auto, two-column: false)[
  - Let $f$ be continuous on $[a, oo)$. Let $display(A = integral_a^oo f(x) dif x)$. Then $A$ may be
    $
      cases(
        "convergent (a number)",
        "divergent" cases("to" oo, "to" -oo, "\"oscillating\""),
      )
    $
  - Assume $forall x >= a, f(x) >= 0$.

    #boxed[Which of the four options are still possible?]
  - Assume $exists M >= a "s.t." forall x >= M, f(x) >= 0$.

    #boxed[Which of the four options are still possible?]
]

// ---------------------------------------------------------------------------
// The basic comparison test
// ---------------------------------------------------------------------------

#lecture([The Basic Comparison Test], videos: ("12.9", "12.10"))

#exercise(title: [Quick Review])[
  For which values of $p in RR$ is each of the following improper integrals convergent?

  + $display(integral_1^oo 1/x^p dif x)$
  + $display(integral_0^1 1/x^p dif x)$
  + $display(integral_0^oo 1/x^p dif x)$
]

#exercise(title: [A Simple BCT Application], num_prefix: auto)[
  We want to determine whether $display(integral_1^oo 1/(x + e^x) dif x)$ is convergent or
  divergent.

  We can try at least two comparisons:

  + Compare $display(1/x)$ and $display(1/(x + e^x))$.
  + Compare $display(1/e^x)$ and $display(1/(x + e^x))$.

  Try both. What can you conclude from each one of them?
]

#comparisons(
  [True or False --- Comparisons],
  $forall x >= a, quad 0 <= #blue($f(x)$) <= #red($g(x)$)$,
)

#comparisons(
  [True or False --- Comparisons II],
  $forall x >= a, quad #blue($f(x)$) <= #red($g(x)$)$,
)

#comparisons(
  [True or False --- Comparisons III],
  $exists M >= a "s.t." forall x >= M, quad 0 <= #blue($f(x)$) <= #red($g(x)$)$,
)

#exercise(title: [BCT Calculations], num_prefix: auto)[
  Use BCT to determine whether each of the following is convergent or divergent

  + $display(integral_1^oo (1 + cos^2 x)/x^(2 \/ 3) dif x)$
  + $display(integral_1^oo (1 + cos^2 x)/x^(4 \/ 3) dif x)$
  + $display(integral_0^oo (arctan x^2)/(1 + e^x) dif x)$
  + $display(integral_0^oo e^(-x^2) dif x)$
  + $display(integral_2^oo (ln x)^10/x^2 dif x)$
]

// ---------------------------------------------------------------------------
// The limit comparison test
// ---------------------------------------------------------------------------

#lecture([The Limit Comparison Test], videos: ("13.2", "13.3", "13.4"))

#exercise(title: [Rapid Questions: Convergent or Divergent?], num_prefix: auto)[
  + $display(integral_1^oo 1/x^2 dif x)$
  + $display(integral_1^oo 1/sqrt(x) dif x)$
  + $display(integral_1^oo 1/x dif x)$
  + $display(integral_0^1 1/x^2 dif x)$
  + $display(integral_0^1 1/sqrt(x) dif x)$
  + $display(integral_0^1 1/x dif x)$
  + $display(integral_1^oo 3/x^2 dif x)$
  + $display(integral_1^oo 1/(x^2 + 3) dif x)$
  + $display(integral_1^oo (1/x^2 + 3) dif x)$
]

#exercise(title: [A "Simple" Integral], num_prefix: auto)[
  What is $display(integral_(-1)^1 1/x dif x)$?

  #choices(
    [$display(integral_(-1)^1 1/x dif x = restrict((ln abs(x)), -1, 1) = ln abs(1) - ln abs(-1) = 0)$],
    [$display(integral_(-1)^1 1/x dif x = 0)$ because $display(f(x) = 1/x)$ is an odd function.],
    [$display(integral_(-1)^1 1/x dif x)$ is divergent.],
  )
]

#exercise(title: [Slow Questions: Convergent or Divergent?], num_prefix: auto)[
  + $display(integral_1^oo (x^3 + 2x + 7)/(x^5 + 11x^4 + 1) dif x)$
  + $display(integral_1^oo 1/sqrt(x^2 + x + 1) dif x)$
  + $display(integral_0^1 (3 cos x)/(x + sqrt(x)) dif x)$
  + $display(integral_0^1 sqrt(cot x) dif x)$
  + $display(integral_0^1 (sin x)/x^(3 \/ 2) dif x)$
  + $display(integral_0^oo e^(-x^2) dif x)$
  + $display(integral_2^oo (ln x)^10/x^2 dif x)$
]

#exercise(title: [What Is Wrong with This Computation?], num_prefix: auto)[
  #bogus_proof[
    $
      integral_(-1)^1 1/x dif x
      & = lim_(epsilon -> 0^+) [integral_(-1)^(-epsilon) 1/x dif x + integral_epsilon^1 1/x dif x] \
      & = lim_(epsilon -> 0^+) [restrict(ln abs(x), -1, -epsilon) + restrict(ln abs(x), epsilon, 1)] \
      & = lim_(epsilon -> 0^+) [ln abs(-epsilon) - ln abs(epsilon)] \
      & = lim_(epsilon -> 0^+) [0] = 0
    $
  ]
]
