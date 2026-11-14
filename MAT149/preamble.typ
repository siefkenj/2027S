// MAT149-specific setup. Everything course-agnostic lives in
// `../preamble.typ`, which this re-exports.

#import "../preamble.typ": *

// ---------------------------------------------------------------------------
// Sources
// ---------------------------------------------------------------------------

// MAT149 is the second half of what used to be the year-long MAT137. These
// decks are ported from the MAT137 class slides (units 7-14), so every slide
// carries that credit. `sources` on `mat149-slides` picks the ones a deck
// uses; the short forms go in the footer, the long forms on the cover.

#let mat137_slides = (
  short: [MAT137 class slides (Gracia-Saz and the MAT137 team)],
  long: [
    Problems adapted from the *MAT137 class slides* by Alfonso Gracia-Saz and the MAT137 teaching
    team (University of Toronto).
  ],
)

// ---------------------------------------------------------------------------
// Slides
// ---------------------------------------------------------------------------

// A class-activity problem. `num_prefix` is passed straight through to `slide`
// and keeps its default of `none`: pass `auto` to number the problem; a
// warm-up simply leaves it off.
//
// `one-column: true` opts out of autosizing entirely (full frame width, no
// column split, no shrinking). Use it only when a display equation or table is
// wider than a column would be; it gives up the overflow protection, so check
// the result.
#let exercise(
  title: none,
  size: none,
  two-column: none,
  one-column: false,
  num_prefix: none,
  body,
) = slide(
  title: title,
  autosize: not one-column,
  force_scale: size,
  two_columns: two-column,
  num_prefix: num_prefix,
  body,
)

// The slide that opens each class: what the class is about, and which MAT137
// videos to watch before the next one. `body` replaces the video line (for a
// class with no videos to assign).
#let lecture(title, videos: (), body: none) = slide(title: title)[
  #if body != none {
    body
  } else if videos != () [
    *Before next class:* watch videos #videos.map(str).join(", ").
  ]
]

// Multiple-choice options, labelled (A), (B), ... so they can be referred to
// by letter ("Does (A) imply (B)?"). Problem *parts* are plain `+` enums
// instead, which the slide numbers `X.1`, `X.2`, ...
//
// `columns` lays short options out side by side. `start` continues the
// lettering after a break (`start: 3` begins at (C)).
#let choices(columns: 1, start: 1, ..items) = grid(
  columns: columns,
  column-gutter: 1.5em,
  row-gutter: .8em,
  // A one-item `enum` per option, rather than a label cell beside a body
  // cell: an enum sets its marker on the baseline of the item's first line,
  // which a grid cell cannot do once the item contains tall maths. The
  // explicit `numbering:` also overrides the slide's `X.y` numbering.
  ..items.pos().enumerate().map(((i, it)) => enum(numbering: "(A)", start: start + i, it)),
)

// An empty box standing in for an expression the students fill in.
// An inline box around text or maths. Its content stays on the surrounding
// text's baseline (a box with `inset` already does that; setting `baseline:`
// as well shifts it off), and the padding takes up space so a box on a
// slide's first line does not run into the title bar.
#let boxed(it) = box(stroke: .6pt, inset: (x: .35em, y: .3em), it)
#let blank = boxed(hide[MM])

// Lower and upper Darboux integrals, $underline(I_a^b)(f)$ and
// $overline(I_a^b)(f)$.
#let lowint(a, b, f: $f$) = $underline(I_#a^#b) (#f)$
#let upint(a, b, f: $f$) = $overline(I_#a^#b) (#f)$

// The evaluation bar of FTC: `restrict(F(x), a, b)` is $F(x) |_a^b$, with the
// bar a little taller than `body` so the limits clear it. Typst has no
// built-in for this.
#let restrict(body, lo, hi) = $lr(#body thin |, size: #140%)_(#lo)^(#hi)$

// ---------------------------------------------------------------------------
// Graphics
// ---------------------------------------------------------------------------

// A number line with the lower sums (red) piling up below the lower integral
// and the upper sums (green) piling down above the upper integral. `lower` and
// `upper` are where the two integrals are marked; `finer` adds arrows showing
// what refining the partition does.
#let darboux-line(lower: -1, upper: 1, finer: false, scale: 1) = cetz.canvas(
  length: scale * .7cm,
  {
    import cetz.draw: *
    let red = rgb("#c0392b")
    let green = rgb("#2e8b57")
    let lo = lower - .04
    let up = upper + .04
    line((-5, 0), (5, 0), stroke: 1pt)
    for d in (2.5, 3.3, 2.0, 1.8, 1.3, .8, .5, .2, .05) {
      circle((lo - d, 0), radius: .1, fill: red, stroke: none)
    }
    for d in (2.7, 3.1, 1.8, 1.5, 1.2, .7, .4, .2, .03) {
      circle((up + d, 0), radius: .1, fill: green, stroke: none)
    }
    cetz.decorations.brace((lo - 3.5, .3), (lo, .3), amplitude: .3)
    content((lo - 1.75, 1), text(fill: red, size: .8em)[lower sums])
    cetz.decorations.brace((up, .3), (up + 3.5, .3), amplitude: .3)
    content((up + 1.75, 1), text(fill: green, size: .8em)[upper sums])
    line((lower, .3), (lower, -.3), stroke: 1.5pt)
    content((lower, -.75), text(size: .8em, $underline(I_a^b) (f)$))
    line((upper, .3), (upper, -.3), stroke: 1.5pt)
    content((upper, -.75), text(size: .8em, $overline(I_a^b) (f)$))
    if finer {
      let arrow = (end: "stealth", fill: black, scale: .6)
      line((lo - 3.5, -1.5), (lo, -1.5), mark: arrow, stroke: 1pt)
      content((lo - 1.75, -2), text(size: .7em)[finer partitions])
      line((up + 3.5, -1.5), (up, -1.5), mark: arrow, stroke: 1pt)
      content((up + 1.75, -2), text(size: .7em)[finer partitions])
    }
  },
)

// ---------------------------------------------------------------------------
// Template
// ---------------------------------------------------------------------------

#let mat149-slides(chapter-title, sources: (mat137_slides,), body) = course-slides(
  chapter-title,
  code: [MAT149],
  name: [Calculus II with Proofs],
  credits: sources.map(s => s.long) + (
    [#sym.copyright Jason Siefken, #YEAR. Copyright in the adapted problems remains with their
      authors.],
  ),
  footer-credit: {
    let named = sources.map(s => s.short).filter(s => s != none)
    if named != () [Adapted from #named.join([; ]).]
  },
  {
    // Many MAT137 problems put display-style sums and integrals inline
    // (`$display(integral_a^b ...)$`). By default a line's height comes from
    // the font's ascender and descender, not from what is actually on it, so
    // the limits of one line overprint the next (or the slide's title bar).
    // Measuring inline equations by their real bounds gives such lines the
    // room they need (and keeps a first line clear of the title bar), while
    // lines of plain text keep their normal spacing.
    //
    // Maths in a slide *title* must not grow the title bar, so it opts out
    // with a label: `title: [Compute $integral_1^2 x^2 dif x$<title-math> ...]`.
    show math.equation.where(block: false): it => {
      if it.at("label", default: none) == <title-math> {
        it
      } else {
        set text(top-edge: "bounds", bottom-edge: "bounds")
        it
      }
    }
    set enum(spacing: .8em)
    body
  },
)
