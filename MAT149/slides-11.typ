#import "preamble.typ": *
#show: mat149-slides.with([Unit 11: Sequences])

// Ported from the MAT137 class slides, unit 11 (2022-2023-MAT137/unit-11/137-CA-11.tex).
// Covers videos 11.3-11.8 and 12.1-12.5: limits of sequences, monotonicity
// and boundedness, theorems about sequences, and the Big Theorem.

#let an = $lr({a_n})_(n=0)^oo$
#let bn = $lr({b_n})_(n=0)^oo$
#let red(it) = text(fill: rgb("#c0392b"), it)
#let blue(it) = text(fill: rgb("#1f5fbf"), it)

// ---------------------------------------------------------------------------
// Sequences
// ---------------------------------------------------------------------------

#lecture([Sequences], videos: ("11.3", "11.4"))

#exercise(title: [Warm-up])[
  Write a formula for the general term of these sequences

  + $lr({a_n})_(n=0)^oo = {1, 4, 9, 16, 25, ...}$
  + $lr({b_n})_(n=1)^oo = {1, -2, 4, -8, 16, -32, ...}$
  + $display(lr({c_n})_(n=1)^oo = {2/1!, 3/2!, 4/3!, 5/4!, ...})$
  + $lr({d_n})_(n=1)^oo = {1, 4, 7, 10, 13, ...}$
]

#exercise(title: [Sequences vs. Functions --- Convergence], num_prefix: auto)[
  For any function $f$ with domain $[0, oo)$, we define a sequence as $a_n = f(n)$. Let $L in RR$.
  Which of these implications is true?

  #choices(
    [IF $display(lim_(x -> oo) f(x) = L)$, THEN $display(lim_(n -> oo) a_n = L)$.],
    [IF $display(lim_(n -> oo) a_n = L)$, THEN $display(lim_(x -> oo) f(x) = L)$.],
    [IF $display(lim_(n -> oo) a_n = L)$, THEN $display(lim_(n -> oo) a_(n+1) = L)$.],
  )
]

#exercise(title: [Definition of Limit of a Sequence], num_prefix: auto, two-column: false)[
  Let #an be a sequence. Let $L in RR$. Which statements are equivalent to "#an $-->$ $L$"?

  #choices(
    $forall epsilon > 0, exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) < epsilon.$,
    $forall epsilon > 0, exists n_0 in NN, forall n in NN, quad n #red($>$) n_0 => abs(L - a_n) < epsilon.$,
    $forall epsilon > 0, exists n_0 in #red($RR$), forall n in NN, quad n >= n_0 => abs(L - a_n) < epsilon.$,
    $forall epsilon > 0, exists n_0 in NN, forall n in #red($RR$), quad n >= n_0 => abs(L - a_n) < epsilon.$,
    $forall epsilon > 0, exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) #red($<=$) epsilon.$,
    $forall epsilon #red($in (0, 1)$), exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) < epsilon.$,
    $forall epsilon > 0, exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) < #red($1/epsilon$).$,
    $forall #red($k in ZZ^+$), exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) < #red($k$).$,
    $forall #red($k in ZZ^+$), exists n_0 in NN, forall n in NN, quad n >= n_0 => abs(L - a_n) < #red($1/k$).$,
  )
]

// ---------------------------------------------------------------------------
// Properties of sequences
// ---------------------------------------------------------------------------

#lecture([Properties of Sequences], videos: ("11.5", "11.6"))

#exercise(title: [Sequences vs. Functions --- Monotonicity and Boundedness], num_prefix: auto)[
  For any function $f$ with domain $[0, oo)$, we define a sequence as $a_n = f(n)$. Which of these
  implications is true?

  #choices(
    [IF $f$ is increasing, THEN #an is increasing.],
    [IF #an is increasing, THEN $f$ is increasing.],
    [IF $f$ is bounded, THEN #an is bounded.],
    [IF #an is bounded, THEN $f$ is bounded.],
  )
]

#exercise(title: [Examples], num_prefix: auto)[
  Construct 8 examples of sequences. If any of them is impossible, cite a theorem to justify it.

  #let cell = box(width: 6em, height: 1.6em)
  #align(center, table(
    columns: 4,
    align: center + horizon,
    stroke: .6pt,
    [], [], [convergent], [divergent],
    table.cell(rowspan: 2)[monotonic], [bounded], cell, cell,
    [unbounded], cell, cell,
    table.cell(rowspan: 2)[not monotonic], [bounded], cell, cell,
    [unbounded], cell, cell,
  ))
]

#exercise(title: [True or False --- Convergence, Monotonicity, and Boundedness], num_prefix: auto)[
  + If a sequence is convergent, then it is bounded above.
  + If a sequence is bounded, then it is convergent.
  + If a sequence is convergent, then it is eventually monotonic.
  + If a sequence is positive and converges to 0, then it is eventually monotonic.
  + If a sequence diverges to $oo$, then it is eventually monotonic.
  + If a sequence diverges, then it is unbounded.
  + If a sequence diverges and is unbounded above, then it diverges to $oo$.
  + If a sequence is eventually monotonic, then it is either convergent, divergent to $oo$, or
    divergent to $-oo$.
]

#exercise(title: [Convergence and Divergence], num_prefix: auto)[
  Let #an be a sequence. Write the formal definition of the following concepts:

  + #an is convergent.
  + #an is divergent.
  + #an is divergent to $oo$.
]

// ---------------------------------------------------------------------------
// Theorems about sequences
// ---------------------------------------------------------------------------

#lecture([Theorems about Sequences], videos: ("11.7", "11.8"))

#exercise(title: [True or False --- Rapid Fire], num_prefix: auto)[
  + (convergent) $=>$ (bounded)
  + (convergent) $=>$ (monotonic)
  + (convergent) $=>$ (eventually monotonic)
  + (bounded) $=>$ (convergent)
  + (monotonic) $=>$ (convergent)
  + (bounded + monotonic) $=>$ (convergent)
  + (divergent to $oo$) $=>$ (eventually monotonic)
  + (divergent to $oo$) $=>$ (unbounded above)
  + (unbounded above) $=>$ (divergent to $oo$)
]

#exercise(title: [Proof of Theorem 3], num_prefix: auto)[
  Write a proof for the following Theorem

  #theorem(title: [3])[
    Let #an be a sequence.
    - IF #an is increasing AND unbounded above,
    - THEN #an is divergent to $oo$.
  ]

  + Write the definitions of "increasing", "unbounded above", and "divergent to $oo$".
  + Using the definition of what you want to prove, write down the structure of the formal proof.
  + Do some rough work if necessary.
  + Write a formal proof.
]

#slide(title: [Proof Feedback])[
  + Does your proof have the correct structure?
  + Are all your variables fixed (not quantified)? In the right order? Do you know what depends on
    what?
  + Is the proof self-contained? Or do I need to read the rough work to understand it?
  + Does each statement follow logically from previous statements?
  + Did you explain what you were doing? Would your reader be able to follow your thought process
    without reading your mind?
]

#exercise(title: [Critique This Proof --- \#1], num_prefix: auto)[
  #bogus_proof[
    - $forall M in RR, exists n_0 in NN, forall n in NN, quad n >= n_0 => x_n > M$
    - $M$ is not an upper bound: $exists n_0 in NN$ s.t. $x_(n_0) > M$
    - $n >= n_0 => x_n >= x_(n_0) > M$
  ]
]

#exercise(title: [Critique This Proof --- \#2], num_prefix: auto)[
  #bogus_proof[
    - WTS $a_n -> oo$. This means:

      $forall M in RR, exists n_0 in NN, forall n in NN, quad n >= n_0 => x_n > M$
    - bounded above: $quad exists M in RR, forall n in NN, x_n <= M$
    - negation: $quad forall M in RR, exists n in NN, x_n > M$
    - $forall n in NN$, take $n = n_0$.
  ]
]

// ---------------------------------------------------------------------------
// The Big Theorem
// ---------------------------------------------------------------------------

#lecture([The Big Theorem], videos: ("12.1", "12.4", "12.5"))

#exercise(title: [Calculations], num_prefix: auto)[
  + $display(lim_(n -> oo) (n! + 2e^n)/(3n! + 4e^n))$
  + $display(lim_(n -> oo) (2^n + (2n)^2)/(2^(n+1) + n^2))$
  + $display(lim_(n -> oo) (5n^5 + 5^n + 5n!)/n^n)$
]

#exercise(title: [True or False --- The Big Theorem], num_prefix: auto)[
  Let #an and #bn be positive sequences.

  + IF #red($a_n << b_n$), THEN #blue[$forall m in NN$, $a_m < b_m$].
  + IF #red($a_n << b_n$), THEN #blue[$exists m in NN$ s.t. $a_m < b_m$].
  + IF #red($a_n << b_n$), THEN #blue[$exists n_0 in NN$ s.t.
      $forall m in NN, m >= n_0 => a_m < b_m$].
  + IF #blue[$forall m in NN$, $a_m < b_m$], THEN #red($a_n << b_n$).
  + IF #blue[$exists m in NN$ s.t. $a_m < b_m$], THEN #red($a_n << b_n$).
  + IF #blue[$exists n_0 in NN$ s.t. $forall m in NN, m >= n_0 => a_m < b_m$], THEN
    #red($a_n << b_n$).
]

#exercise(title: [Refining the Big Theorem --- 1], num_prefix: auto)[
  + Construct a sequence $lr({u_n})_n$ such that
    $
      cases(forall a < 0 \, & n^a << u_n, forall a >= 0 \, & u_n << n^a)
    $
  + Construct a sequence $lr({v_n})_n$ such that
    $
      cases(forall a <= 0 \, & n^a << v_n, forall a > 0 \, & v_n << n^a)
    $
]

#exercise(title: [Refining the Big Theorem --- 2], num_prefix: auto)[
  + Construct a sequence $lr({u_n})_n$ such that
    $
      cases(forall a < 2 \, & n^a << u_n, forall a >= 2 \, & u_n << n^a)
    $
  + Construct a sequence $lr({v_n})_n$ such that
    $
      cases(forall a <= 2 \, & n^a << v_n, forall a > 2 \, & v_n << n^a)
    $
]
