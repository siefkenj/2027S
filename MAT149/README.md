# MAT149 — Calculus II with Proofs

Slide decks for MAT149 (LEC0301, LEC0401), Winter 2027.

MAT149 is the second half of what used to be the year-long MAT137. The decks
are ported from the MAT137 class slides for the Winter-term units (7–14), as
listed on the [MAT137 course page](https://www.math.utoronto.ca/alfonso/137/137.html?videos).
Each class opens with a slide naming the MAT137 videos to watch before the next one.

## Layout

| File | MAT137 unit |
| --- | --- |
| `slides-07.typ` | 7 — The definition of the integral |
| `slides-08.typ` | 8 — The Fundamental Theorem of Calculus |
| `slides-09.typ` | 9 — Integration methods |
| `slides-10.typ` | 10 — Applications of the integral |
| `slides-11.typ` | 11 — Sequences |
| `slides-12.typ` | 12 — Improper integrals |
| `slides-13.typ` | 13 — Series |
| `slides-14.typ` | 14 — Power series and Taylor series |
| `images/` | Graphs used by units 7–9 (copied from the MAT137 sources) |

`preamble.typ` holds the MAT149-specific pieces and re-exports everything from
`../preamble.typ`. It is not a standalone document and is not built by CI.

## Writing slides

The decks follow the MAT246 conventions from
[2026F](https://github.com/siefkenj/2026F/tree/main/MAT246):

* `exercise(title: .., num_prefix: auto)` is a numbered problem. Its top-level
  `+` list is numbered `X.1`, `X.2`, .... Warm-ups and other non-questions leave
  `num_prefix` off; they show no number and do not consume one.
* `lecture([Title], videos: ("7.3", "7.4"))` opens a class.
* `choices(..)` is for multiple-choice options and statements the problem refers
  to by letter, labelled (A), (B), .... `columns:` sets them side by side and
  `start:` continues the lettering.
* `two-column: false` keeps a slide in one column (it still shrinks to fit).
  Use it when the autosizer would split a proof or an equation from its prompt.
  `one-column: true` turns off autosizing entirely, for side-by-side figures.
* `bogus_proof[..]` (from `../preamble.typ`) is the red box for "what is wrong
  with this?" problems, and `aside(title)[..]` the neutral box for hints and
  reference formulas.

* `restrict(F(x), a, b)` is the FTC evaluation bar $F(x)|_a^b$ (Typst has no
  built-in for it); use `abs(..)`, `norm(..)` and `dif` rather than bare `|`
  and `d`.
* `boxed[..]` is an inline box that keeps its content on the text baseline;
  `blank` is an empty one for students to fill in.

Inline maths is laid out by its real bounds (a show rule in `mat149-slides`).
Without it, a line's height comes from the font, so the limits of an inline
`$display(integral_a^b ..)$` overprint the next line or the title bar. Maths in
a slide *title* opts out with a label, `$..$<title-math>`, so that it does not
make the title bar taller.

Two checks worth repeating after editing a deck: the footer is painted over the
body, so content that overflows is *hidden*, not visible; and a slide that the
autosizer splits into two columns can separate a statement from its maths
(use `two-column: false`).

## Differences from the MAT137 LaTeX slides

* **No overlays.** The beamer `\pause`s are dropped and every part shows at
  once; the slide library has no overlay support. "Integrals from a Graph"
  (unit 9) stepped through three graphs; the two shaded ones are now on a
  continuation slide.
* **Commented-out frames are not ported.** Several units kept spare problems in
  `%`-comments; only the active frames were converted.
* **Duplicate frames are kept once:** "The Error Function" (unit 9),
  "Convergence Tests: Ninja Level" (unit 13) and "arcsin" (unit 14) each appeared
  in two lectures.
* **"MAT137 Lecture NN" titles are dropped.** The lecture numbers will not match
  MAT149's schedule; the lecture slides are titled by topic.
* **Corrections:** typos in the video lists ("8.5, .86, 8.7" → 8.6, "13,2" →
  13.2) and titles ("Properites", "Wecome"); `h(x) = arcsin` → `arcsin x`; and in
  "Definite Integral via Substitution" (unit 9) a line that read
  `1/9 (x^3+1)^(2/3)` — an accidental second error beside the intended one —
  now reads `2/9 (x^3+1)^(3/2)`.
* The lower/upper-sum number line in "A Tricky Question" (unit 7), a TikZ
  drawing in the original, is redrawn with cetz (`darboux-line` in
  `preamble.typ`).

## Slide machinery

The slide machinery lives in [`../libs`](../libs), a copy of the `book/libs/`
tree of <https://github.com/siefkenj/IBLODEs>, shared with MAT336; the
course-agnostic helpers are in [`../preamble.typ`](../preamble.typ). It was
copied from 2026F, where it carries three deliberate divergences from upstream:

* `../libs/cover.typ` is **removed**, and its import dropped from `lib.typ`.
  It draws a Van der Pol phase portrait over an IBLODEs background image, and
  its trailing self-preview call runs at *import* time, so merely importing
  `lib.typ` would fail without that image. The deck cover lives in
  `../preamble.typ` instead.
* The `*.test.typ` files are removed; they reference IBLODEs modules we do not
  ship.
* `slide` in `../libs/environment-slides.typ` gains a `num_prefix` field (see
  above). It is additive: its default is `none`, so a deck that does not set it
  renders exactly as upstream.

The library needs the fonts vendored in [`../fonts`](../fonts). Always build
with `--font-path`.

## Attribution

The problems are adapted from the MAT137 class slides by Alfonso Gracia-Saz and
the MAT137 teaching team (University of Toronto); copyright in them remains with
their authors. The credit appears on each deck's cover and in every slide
footer. The slide library in `libs/` is CC BY-SA 4.0, by Jason Siefken and
Bernardo Galvão-Sousa.

## Building

```sh
typst compile --root . --font-path ./fonts MAT149/slides-07.typ
```

from the repository root.
