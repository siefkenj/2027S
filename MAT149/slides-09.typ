#import "preamble.typ": *
#show: mat149-slides.with([Unit 9: Integration Methods])

// Ported from the MAT137 class slides, unit 9 (2022-2023-MAT137/unit-9/137-CA-09.tex).
// Covers videos 9.4-9.12 and 10.1: substitution, integration by parts,
// trigonometric integrals, and rational functions.
//
// Differences from the LaTeX source:
// - "The Error Function" appeared twice (in the integration-by-parts and the
//   trig-integrals lectures); only the first copy is kept.
// - "Integrals from a Graph" stepped through three overlays (G22, G22a,
//   G22b). The slides have no overlays, so the two shaded graphs are on a
//   continuation slide.
// - In "Definite Integral via Substitution" the middle line read
//   `1/9 (x^3+1)^(2/3)`, an accidental second error next to the intended one
//   (keeping the x-limits after substituting). It now reads
//   `2/9 (x^3+1)^(3/2)`, which is what the next line uses.

// ---------------------------------------------------------------------------
// Substitution
// ---------------------------------------------------------------------------

#lecture([Integration by Substitution], videos: ("9.4", "9.5", "9.6"))

#exercise(title: [Computation Practice: Integration by Substitution], num_prefix: auto)[
  Use substitutions to compute:

  + $display(integral (sin sqrt(x))/sqrt(x) dif x)$
  + $display(integral e^x cos(e^x) dif x)$
  + $display(integral cot x dif x)$
  + $display(integral x^2 sqrt(x + 1) dif x)$
  + $display(integral e^(2x)/sqrt(e^x + 1) dif x)$
  + $display(integral (ln ln x)^2/(x ln x) dif x)$
  + $display(integral x e^(-x^2) dif x)$
  + $display(integral e^(-x^2) dif x)$
]

#exercise(title: [Definite Integral via Substitution], num_prefix: auto, two-column: false)[
  This final answer is right, but the write-up is WRONG. Why?

  Calculate $display(I = integral_0^2 sqrt(x^3 + 1) x^2 dif x)$

  #bogus_proof[
    _Wrong answer._ Substitution: $u = x^3 + 1$, $dif u = 3x^2 dif x$.
    $
      I & = 1/3 integral_0^2 sqrt(x^3 + 1) (3x^2 dif x) && = 1/3 integral_0^2 u^(1 \/ 2) dif u \
        & = 1/3 dot 2/3 restrict(u^(3 \/ 2), 0, 2) && = restrict(2/9 (x^3 + 1)^(3 \/ 2), 0, 2) \
        & = 2/9 (2^3 + 1)^(3 \/ 2) - 2/9 (0 + 1)^(3 \/ 2) && = 52/9
    $
  ]
]

#exercise(title: [Integral of Products of $sin$ and $cos$], num_prefix: auto, two-column: false)[
  We want to compute
  $
    I = integral sin^3 x cos^2 x dif x
  $

  + Attempt the substitution $u = sin x$.
  + Attempt the substitution $u = cos x$.
  + One worked better than the other. Which one? Why? Finish the problem.
  + Assume we want to compute
    $
      integral sin^n x cos^m x dif x
    $
    When will the substitution $u = sin x$ be helpful? When will the substitution $u = cos x$ be
    helpful?
]

// ---------------------------------------------------------------------------
// Integration by parts
// ---------------------------------------------------------------------------

#lecture([Integration by Parts], videos: ("9.7", "9.8", "9.9"))

#exercise(title: [Computation Practice: Integration by Parts], num_prefix: auto)[
  Use integration by parts (possibly in combination with other methods) to compute:

  + $display(integral x e^(-2x) dif x)$
  + $display(integral x^2 sin x dif x)$
  + $display(integral ln x dif x)$
  + $display(integral sin sqrt(x) dif x)$
  + $display(integral x arctan x dif x)$
  + $display(integral x^2 arcsin x dif x)$
  + $display(integral e^(cos x) sin^3 x dif x)$
  + $display(integral e^(a x) sin(b x) dif x)$
]

#exercise(title: [Integrals from a Graph], num_prefix: auto, one-column: true)[
  #grid(
    columns: (1.4fr, 1fr),
    column-gutter: 1em,
    align: horizon,
    image("images/G22.svg", height: 5.4cm),
    [
      Estimate:

      + $display(integral_0^1 f(x) dif x)$
      + $display(integral_0^1 f'(x) dif x)$
      + $display(integral_0^3 x f'(x) dif x)$
      + $display(integral_0^1 f(3x) dif x)$
    ],
  )
]

#exercise(title: [Integrals from a Graph (continued)], one-column: true)[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,
    image("images/G22a.svg", height: 5.4cm), image("images/G22b.svg", height: 5.4cm),
  )
]

#exercise(title: [The Error Function], num_prefix: auto)[
  The following function is tabulated.
  $
    E(x) = integral_0^x e^(-t^2) dif t.
  $
  Write the following quantities in terms of $E$:

  + $display(integral_1^2 e^(-t^2) dif t)$
  + $display(integral_0^x t^2 e^(-t^2) dif t)$
  + $display(integral_0^x e^(-2t^2) dif t)$
  + $display(integral_0^1 e^(-t^2 + 6t) dif t)$
  + $display(integral_(x_1)^(x_2) e^(-(t - mu)^2 \/ sigma^2) dif t)$
  + $display(integral_1^2 e^(-t)/sqrt(t) dif t)$
]

// ---------------------------------------------------------------------------
// Trigonometric integrals
// ---------------------------------------------------------------------------

#lecture([Integration of Products of Trig. Functions], videos: ("9.10", "9.11", "9.12"))

#exercise(title: [Practice: Integrals with Trigonometric Functions], num_prefix: auto)[
  Compute the following antiderivatives. (Once you get them to a form from where you see a path to
  finish them, even if long, you may stop.)

  + $display(integral sin^10 x cos x dif x)$
  + $display(integral sin^10 x cos^7 x dif x)$
  + $display(integral e^(cos x) cos x sin^3 x dif x)$
  + $display(integral cos^2 x dif x)$
  + $display(integral cos^4 x dif x)$
  + $display(integral csc x dif x)$

  #aside([Useful trig identities])[
    $
      sin^2 x + cos^2 x & = 1, quad & sin^2 x & = (1 - cos(2x))/2 \
          tan^2 x + 1 & = sec^2 x, quad & cos^2 x & = (1 + cos(2x))/2
    $
  ]
]

#exercise(title: [Integral of Products of Secant and Tangent], num_prefix: auto)[
  To integrate
  $
    integral sec^n x tan^m x dif x
  $

  - If #blank, then use the substitution $u = tan x$.
  - If #blank, then use the substitution $u = sec x$.

  _Hint:_ You will need
  - $display(dif / (dif x) [tan x] = ...)$ and $display(dif / (dif x) [sec x] = ...)$
  - The trig identity involving $sec$ and $tan$
]

// ---------------------------------------------------------------------------
// Rational functions
// ---------------------------------------------------------------------------

#lecture([Integration of Rational Functions], videos: ("10.1",))

#exercise(title: [Rational Integrals], num_prefix: auto)[
  + Calculate $display(integral 1/(x + a) dif x)$
  + Reduce to common denominator $display(2/x - 3/(x + 3))$
  + Calculate $display(integral (-x + 6)/(x^2 + 3x) dif x)$
  + Calculate $display(integral 1/(x^2 + 3x) dif x)$
  + Calculate $display(integral 1/(x^3 - x) dif x)$
]

#exercise(title: [Repeated Factors], num_prefix: auto)[
  + Calculate $display(integral 1/(x + 1)^n dif x)$ for $n > 1$
  + Calculate $display(integral ((x + 1) - 1)/(x + 1)^2 dif x)$
  + Calculate $display(integral (2x + 6)/(x + 1)^2 dif x)$
  + Calculate $display(integral x^2/(x + 1)^3 dif x)$
]

#exercise(title: [The Integral of Secant], num_prefix: auto)[
  Compute
  $
    integral sec x dif x
  $
  using the substitution $u = sin x$.
]
