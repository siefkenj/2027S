#import "preamble.typ": *
#show: mat149-slides.with([Unit 8: The Fundamental Theorem of Calculus])

// Ported from the MAT137 class slides, unit 8 (2022-2023-MAT137/unit-8/137-CA-08.tex).
// Covers videos 8.3-8.7: antiderivatives, functions defined by integrals,
// and both parts of the Fundamental Theorem of Calculus.

// ---------------------------------------------------------------------------
// Antiderivatives and indefinite integrals
// ---------------------------------------------------------------------------

#lecture([Antiderivatives and Indefinite Integrals], videos: ("8.3", "8.4"))

#exercise(title: [The Most Misunderstood Antiderivative], num_prefix: auto)[
  + Find the _domain_ and the derivative of $F_1(x) = ln x$.
  + Find the _domain_ and the derivative of $F_2(x) = ln(-x)$.
  + Find the _domain_ and the derivative of $F_3(x) = ln abs(x)$.

    _Suggestion:_ Break the domain into two pieces.
  + Based on your answers, what is $display(integral 1/x dif x)$?
  + Find the _domain_ and the derivative of $F_4(x) = ln abs(2x)$.

    Why doesn't this contradict your answer to the previous part?
]

// `one-column` slides ignore `size:`, so the text is scaled here directly.
#exercise(title: [Towards FTC], num_prefix: auto, one-column: true)[
  #set text(size: .9em)
  #set enum(spacing: .3em)
  #grid(
    columns: (1.4fr, 1fr),
    column-gutter: 1em,
    align: horizon,
    image("images/G21.svg", height: 4.6cm),
    [
      Compute:

      + $display(integral_0^1 f(t) dif t)$
      + $display(integral_0^2 f(t) dif t)$
      + $display(integral_0^3 f(t) dif t)$
      + $display(integral_0^4 f(t) dif t)$
      + $display(integral_0^5 f(t) dif t)$
    ],
  )
]

#exercise(title: [Towards FTC (continued)], num_prefix: auto)[
  #align(center, image("images/G21.svg", height: 4.2cm))

  Call $display(F(x) = integral_0^x f(t) dif t)$. This is a new function.

  + Sketch the graph of $y = F(x)$.
  + Using the graph you just sketched, sketch the graph of $y = F'(x)$.
]

#exercise(title: [Compute These Antiderivatives by Guess 'n Check], num_prefix: auto, size: .85em)[
  + $display(integral x^5 dif x)$
  + $display(integral (3x^8 - 18x^5 + 1) dif x)$
  + $display(integral root(3, x) dif x)$
  + $display(integral 1/x^9 dif x)$
  + $display(integral sqrt(x) (x^2 + 5) dif x)$
  + $display(integral 1/e^(2x) dif x)$
  + $display(integral sin(3x) dif x)$
  + $display(integral cos(3x + 2) dif x)$
  + $display(integral sec^2 x dif x)$
  + $display(integral sec x tan x dif x)$
  + $display(integral 1/x dif x)$
  + $display(integral 1/(x+3) dif x)$
]

// ---------------------------------------------------------------------------
// FTC part 1
// ---------------------------------------------------------------------------

#lecture([FTC Part 1], videos: ("8.5", "8.6", "8.7"))

#exercise(title: [Functions Defined by Integrals], num_prefix: auto)[
  Which ones of these are valid ways to define functions?

  #choices(
    columns: 2,
    $display(F(x) = integral_0^x t/(1 + t^8) dif t)$,
    $display(F(x) = integral_0^x x/(1 + x^8) dif x)$,
    $display(F(x) = integral_0^x x/(1 + t^8) dif t)$,
    $display(F(x) = integral_0^(x^2) t/(1 + t^8) dif t)$,
    $display(F(x) = integral_(sin x)^(e^x) t/(1 + t^8) dif t)$,
    $display(F(x) = integral_0^3 t/(1 + x^2 + t^8) dif t)$,
    $display(F(x) = x integral_(sin x)^(e^x) t/(1 + x^2 + t^8) dif t)$,
    $display(F(x) = t integral_(sin x)^(e^x) t/(1 + x^2 + t^8) dif t)$,
  )
]

#exercise(title: [True or False?], num_prefix: auto)[
  + If $f$ is continuous on the interval $[a, b]$, then
    $
      dif / (dif x) (integral_a^b f(t) dif t) = f(x).
    $
  + If $f$ is differentiable, then
    $
      dif / (dif x) (integral_a^x f(t) dif t) = integral_a^x f'(t) dif t.
    $
]

#exercise(title: [Examples of FTC-1], num_prefix: auto)[
  Compute the derivative of the following functions

  + $display(F_1(x) = integral_0^1 e^(-t^2) dif t)$
  + $display(F_2(x) = integral_0^x e^(-sin t) dif t)$
  + $display(F_3(x) = integral_1^(x^2) (sin t)/t^2 dif t)$
  + $display(F_4(x) = integral_x^7 sin^3 (sqrt(t)) dif t)$
  + $display(F_5(x) = integral_(2x)^(x^2) 1/(1 + t^3) dif t)$
]

#exercise(title: [Creative Guess and Check 1], num_prefix: auto)[
  + $display(dif / (dif x) [x sin x] =)$
  + $display(dif / (dif x) [cos x] =)$

  Use the previous answers to compute

  3. $display(integral x cos x dif x =)$
]

#exercise(title: [Creative Guess and Check 2], num_prefix: auto)[
  + $display(dif / (dif x) [x e^x] =)$
  + $???$

  Use the previous answers to compute

  3. $display(integral x e^x dif x =)$
]

#exercise(title: [Creative Guess and Check 3], num_prefix: auto)[
  + $display(dif / (dif x) [x^2 e^(-x)] =)$
  + $???$
  + $???$

  Use the previous answers to compute

  4. $display(integral x^2 e^(-x) dif x =)$
]

#exercise(title: [Creative Guess and Check 4], num_prefix: auto)[
  + $display(dif / (dif x) [x ln x] =)$
  + $???$

  Use the previous answers to compute

  3. $display(integral ln x dif x =)$
]

#exercise(title: [A Challenge for Guess-and-Check Ninjas], num_prefix: auto)[
  $
    integral x e^x cos x dif x = ???
  $
]

// ---------------------------------------------------------------------------
// FTC part 2
// ---------------------------------------------------------------------------

#lecture([FTC Part 2], videos: ("9.1", "9.2", "9.3"))

#exercise(title: [Compute These Definite Integrals], num_prefix: auto)[
  + $display(integral_1^2 x^3 dif x)$
  + $display(integral_0^1 [e^x + e^(-x) - cos(2x)] dif x)$
  + $display(integral_(1 \/ 2)^(1 \/ sqrt(2)) 4/sqrt(1 - x^2) dif x)$
  + $display(integral_(pi \/ 4)^(pi \/ 3) sec^2 x dif x)$
  + $display(integral_1^2 [dif / (dif x) ((sin^2 x)/(1 + arctan^2 x + e^(-x^2)))] dif x)$
]

#exercise(title: [Find the Error], num_prefix: auto)[
  $
    integral_(-1)^1 1/x^4 dif x = restrict((-1)/(3x^3), -1, 1) = (-2)/3
  $
  However, $x^4$ is always positive, so the integral should be positive.
]

#exercise(title: [Areas], num_prefix: auto)[
  Calculate the area of the bounded region...

  + ... between the $x$-axis and $y = 4x - x^2$.
  + ... between $y = cos x$, the $x$-axis, from $x = 0$ to $x = pi$.
  + ... between $y = x^2 + 3$ and $y = 3x + 1$.
  + ... between $y = 1$, the $y$-axis, and $y = ln(x + 1)$.
]

#exercise(title: [More True or False], num_prefix: auto, two-column: false)[
  Let $f$ and $g$ be differentiable functions with domain $RR$. Assume that $f'(x) = g(x)$ for all
  $x$. Which of the following statements must be true?

  #choices(
    [$display(f(x) = integral_0^x g(t) dif t)$.],
    [If $f(0) = 0$, then $display(f(x) = integral_0^x g(t) dif t)$.],
    [If $g(0) = 0$, then $display(f(x) = integral_0^x g(t) dif t)$.],
    [There exists $C in RR$ such that $display(f(x) = C + integral_0^x g(t) dif t)$.],
    [There exists $C in RR$ such that $display(f(x) = C + integral_1^x g(t) dif t)$.],
  )
]
