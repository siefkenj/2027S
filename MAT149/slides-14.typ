#import "preamble.typ": *
#show: mat149-slides.with([Unit 14: Power Series and Taylor Series])

// Ported from the MAT137 class slides, unit 14 (2022-2023-MAT137/unit-14/137-CA-14.tex).
// Covers videos 14.3-14.14: power series, Taylor polynomials, Taylor series,
// analytic functions, and applications.
//
// Differences from the LaTeX source:
// - The "arcsin" problem appeared twice (in the Taylor-series and the
//   constructing-new-Taylor-series lectures); only the first copy is kept.
// - The "Applications 2" lecture slide listed no videos, so it shows none.

#let red(it) = text(fill: rgb("#c0392b"), it)
#let blue(it) = text(fill: rgb("#1f5fbf"), it)
#let purple(it) = text(fill: rgb("#7d3c98"), it)
#let green(it) = text(fill: rgb("#1e8449"), it)

#let competition-polys = $
  C(x) & = -293/8 + 29x + 13/4 x^2 - 3x^3 + 3/8 x^4 \
  D(x) & = 29 + 8(x - 3) - 7/2 (x - 3)^2 + 9/6 (x - 3)^3 + 9/24 (x - 3)^4
$

// ---------------------------------------------------------------------------
// Power series
// ---------------------------------------------------------------------------

#lecture([Power Series], videos: ("14.3", "14.4"))

#exercise(title: [Interval of Convergence], num_prefix: auto)[
  Find the interval of convergence of each power series:

  + $display(sum_(n=0)^oo x^n/n!)$
  + $display(sum_(n=1)^oo (x - 5)^n/(n^2 2^(2n+1)))$
  + $display(sum_(n=1)^oo n^n/42^n x^n)$
  + (Hard!) $display(sum_(n=0)^oo (3n)!/(n!(2n)!) x^n)$
]

#exercise(title: [Writing Functions as Power Series], num_prefix: auto)[
  You know that $display(1/(1 - x) = sum_(n=0)^oo x^n)$ for $abs(x) < 1$.

  Manipulate it to write the following functions as power series centered at 0:

  + $display(g(x) = 1/(1 + x))$
  + $display(A(x) = 1/(2 - x))$

    _Hint:_ Factor $1 \/ 2$.
  + $display(h(x) = 1/(1 - x^2))$
  + $F(x) = ln(1 + x)$

    _Hint:_ Compute $F'$.
]

// ---------------------------------------------------------------------------
// Taylor polynomials
// ---------------------------------------------------------------------------

#lecture([Taylor Polynomials], videos: ("14.5", "14.6"))

#exercise(title: [Warm-up])[
  Write down the (various equivalent) definitions of Taylor polynomial you have learned so far.
]

#exercise(title: [Taylor Polynomial of a Polynomial], num_prefix: auto)[
  Let $f(x) = x^3$. Let $P_n$ be the $n$-th Taylor polynomial for $f$ at $0$.

  + Find $P_3$. Verify it satisfies the 1st and 2nd definition.
  + Find $P_2$.
]

#exercise(title: [More Taylor Polynomial of a Polynomial], num_prefix: auto)[
  Let $f(x) = x^3$. Let $Q_n$ be the $n$-th Taylor polynomial *for $f$ at $1$*.

  + Find $Q_3$.
  + Find $Q_2$.
]

#exercise(title: [A Polynomial Given Its Derivatives], num_prefix: auto)[
  + Consider the polynomial $P(x) = c_0 + c_1 x + c_2 x^2 + c_3 x^3$. Find values of the
    coefficients that satisfy
    $
      P(0) = 1, quad P'(0) = 5, quad P''(0) = 3, quad P'''(0) = -7
    $
  + Find _all_ polynomials $P$ (of any degree) that satisfy
    $
      P(0) = 1, quad P'(0) = 5, quad P''(0) = 3, quad P'''(0) = -7
    $
  + Find a polynomial $P$ of smallest possible degree that satisfies
    $
      P(0) = A, quad P'(0) = B, quad P''(0) = C, quad P'''(0) = D
    $
]

#exercise(title: [A Polynomial Given Its Derivatives 2], num_prefix: auto)[
  + Let $f$ be a $C^4$ function at $0$. Construct a polynomial $P$ that satisfies
    $
                P(0) & = f(0) \
               P'(0) & = f'(0) \
              P''(0) & = f''(0) \
      P^((3))(0) & = f^((3))(0) \
      P^((4))(0) & = f^((4))(0)
    $
]

// ---------------------------------------------------------------------------
// Taylor series
// ---------------------------------------------------------------------------

#lecture([Taylor Series], videos: ("14.7", "14.8"))

#slide(title: [Competition!])[
  - Do you prefer cats or dogs? You MUST choose one. Now you are in the $C$-team or the $D$-team.
  - Copy only one polynomial ($C$ or $D$):
    #competition-polys
  - I will ask you questions. Answer only about your polynomial ($C$ or $D$). *No calculators!*
]

#exercise(title: [Competition!], num_prefix: auto, two-column: false, size: .85em)[
  #competition-polys

  #grid(
    columns: (1fr, 1fr),
    [
      $C$-team compute...
      - $C(3)$
      - $C'(3)$
      - $C''(3)$
      - $C'''(3)$
      - $C^((4))(3)$
    ],
    [
      $D$-team compute...
      - $D(3)$
      - $D'(3)$
      - $D''(3)$
      - $D'''(3)$
      - $D^((4))(3)$
    ],
  )

  Simplify your answers (write them as rational numbers).
]

#exercise(title: [I Spy a Polynomial with My Little Eye], num_prefix: auto)[
  I'm thinking of a cubic polynomial $P$. It satisfies
  $
    P(1) = 8, quad P'(1) = -pi, quad P''(1) = 4, quad P'''(1) = sqrt(7)
  $
  What is $P(x)$?
]

#exercise(title: [$arcsin$], num_prefix: auto)[
  Let $display(f(x) = 1/sqrt(1 + x))$.

  + Find a formula for its derivatives $f^((n))(x)$.
  + Write its Maclaurin series at $0$. Call it $S(x)$.
  + What is the radius of convergence of series $S(x)$?

    #text(size: .85em)[_Note:_ Use without proof that $f(x) = S(x)$ inside the interval of
      convergence.]
  + Use this result to write $h(x) = arcsin x$ as a power series centered at $0$.

    #text(size: .85em)[_Hint:_ Compute $h'(x)$.]
  + What is $h^((7))(0)$?
]

// ---------------------------------------------------------------------------
// Analytic functions
// ---------------------------------------------------------------------------

#lecture([Analytic Functions], videos: ("14.9", "14.10"))

#exercise(title: [Warm-up])[
  + Write down the Maclaurin series for $f(x) = sin x$. (Just recall it.)
  + Compute the interval of convergence of this power series.
  + Write down the statement of Lagrange's Remainder Theorem. (Just recall it. Look it up if
    needed.)
]

#exercise(title: [$sin$ Is Analytic], num_prefix: auto, two-column: false)[
  Let $f(x) = sin x$. You know its Maclaurin series is
  $
    S(x) = sum_(n=0)^oo (-1)^n x^(2n+1)/(2n + 1)! = x - x^3/3! + x^5/5! - x^7/7! + dots.c
  $
  As you know, to prove that $sin x = S(x)$ we need to show that
  $
    forall x in RR, quad lim_(n -> oo) R_n (x) = 0
  $
  Use Lagrange's Remainder Theorem to prove it!

  #line(length: 100%, stroke: .5pt)

  _Reminder:_ Lagrange's Remainder Theorem says that given $f$, $a$, $x$, and $n$ with certain
  conditions,
  $
    exists xi "between" a "and" x "s.t." quad R_n (x) = (f^((n+1))(xi))/(n + 1)! (x - a)^(n+1)
  $
]

#exercise(title: [Generalize Your Proof], num_prefix: auto)[
  #aside([Theorem])[
    Let $I$ be an open interval. Let $a in I$. Let $f$ be a $C^oo$ function on $I$. Let $S(x)$ be
    the Taylor series for $f$ centered at $a$.
    - IF #boxed[???]
    - THEN $forall x in I, f(x) = S(x)$
  ]

  Which condition can you write instead of "#boxed[???]" to make the theorem true?

  If you are thinking "the derivatives must be bounded", then you are on the right track, but you
  need to be much more precise. Which derivatives? On which domain? There are a lot of variables
  here; can the bounds depend on any variable?
]

#exercise(title: [Generalize Your Proof (continued)], num_prefix: auto, two-column: false)[
  Which one or ones of the following conditions can be written instead of "#boxed[???]" to make
  the theorem true?

  #choices(
    [#blue($forall n in NN$), $f^((n))$ is bounded on $I$],
    [#blue($forall n in NN$), #red($forall x in I$), $f^((n))$ is bounded on $J_(x,a)$],
    [#blue($forall n in NN$), #red($forall x in I$), #purple($exists A, B in RR$),
      #green($forall xi in J_(x,a)$), $A <= f^((n))(#green($xi$)) <= B$],
    [#red($forall x in I$), #purple($exists A, B in RR$), #blue($forall n in NN$),
      #green($forall xi in J_(x,a)$), $A <= f^((n))(#green($xi$)) <= B$],
    [#red($forall x in I$), #purple($exists M >= 0$), #blue($forall n in NN$),
      #green($forall xi in J_(x,a)$), $abs(f^((n))(#green($xi$))) <= M$],
    [#purple($exists A, B in RR$), #red($forall x in I$), #blue($forall n in NN$),
      #green($forall xi in J_(x,a)$), $A <= f^((n))(#green($xi$)) <= B$],
    [#purple($exists A, B in RR$), #red($forall x in I$), #blue($forall n in NN$),
      $A <= f^((n))(#red($x$)) <= B$],
  )

  _Notation:_ $J_(x,a)$ is the interval between $x$ and $a$.
]

// ---------------------------------------------------------------------------
// Constructing new Taylor series
// ---------------------------------------------------------------------------

#lecture([Constructing New Taylor Series], videos: ("14.12", "14.14"))

#exercise(title: [Taylor Series Gymnastics], num_prefix: auto)[
  Write the following functions as power series centered at $0$. Write them first with sigma
  notation, and then write out the first few terms. Indicate the domain where each expansion is
  valid.

  + $f(x) = e^(-x)$
  + $f(x) = x^2 cos x$
  + $display(f(x) = 1/(1 + x))$
  + $display(f(x) = 1/(1 - x^2))$
  + $display(f(x) = x/(3 + 2x))$
  + $f(x) = sin(2x^3)$
  + $display(f(x) = (e^x + e^(-x))/2)$
  + $display(f(x) = ln (1 + x)/(1 - x))$

  _Note:_ You do not need to take any derivatives. You can reduce them all to other Maclaurin
  series you know.
]

#exercise(title: [$arctan$], num_prefix: auto)[
  + Write the Maclaurin series for $G(x) = arctan x$.

    _Hint:_ Compute the first derivative. Then use the geometric series. Then integrate.
  + What is $G^((137))(0)$?
  + Use the previous results to compute
    $
      A = sum_(n=0)^oo (-1)^n/((2n + 1) 3^n)
    $
]

// ---------------------------------------------------------------------------
// Applications
// ---------------------------------------------------------------------------

#lecture([Applications], videos: ("14.11", "14.13"))

#exercise(title: [Integrals], num_prefix: auto)[
  I want to calculate
  $
    A = integral_0^1 t^10 sin t dif t.
  $
  There are two ways to do it. Choose your favourite one:

  + Use integration by parts 10 times.
  + Use power series.

  #line(length: 100%, stroke: .5pt)

  Estimate $A$ with an error smaller than $0.001$.
]

#exercise(title: [Add These Series], num_prefix: auto)[
  + $display(sum_(n=2)^oo (-2)^n/(2n + 1)!)$ #h(1fr) _Hint:_ Think of $sin$
  + $display(sum_(n=0)^oo (4n + 1) x^(4n+2))$ #h(1fr) _Hint:_ $display(dif / (dif x) [x^(4n+1)] = ???)$
  + $display(sum_(n=0)^oo 1/(2n)!)$ #h(1fr) _Hint:_ Write first few terms. Combine $e^1$ and
    $e^(-1)$.
  + $display(sum_(n=0)^oo ((-1)^n x^(2n))/((2n)! (n + 1)))$ #h(1fr) _Hint:_ Integrate
]

#lecture([Applications 2])

#exercise(title: [Limits], num_prefix: auto)[
  Use Maclaurin series to compute these limits:

  + $display(lim_(x -> 0) (sin x - x + x^3/6)/x^5)$
  + $display(lim_(x -> 0) (cos(2x) - e^(-2x^2))/x^4)$
  + $display(lim_(x -> 0) ([sin x - x]^3 x)/([cos x - 1]^4 [e^x - 1]^2))$
]

#exercise(title: [Estimations], num_prefix: auto)[
  I want to estimate these two numbers
  $
    A = sin 1, quad B = ln 0.9.
  $

  + Use Taylor series to write $A$ and $B$ as infinite sums.
  + If you want to estimate $A$ or $B$ with a small error using a partial sum, the fastest way is
    to use different theorems for $A$ and $B$. What are they?
  + Estimate $B$ with an error smaller than 0.001.
]

#lecture([Outroduction], body: [*Welcome to the end!*])
