# 2027S

Course slides for the Winter 2027 semester, written in [Typst](https://typst.app).

**Built slides: <https://siefkenj.github.io/2027S/>**

| Folder | Course |
| --- | --- |
| [`MAT149`](MAT149) | Calculus II with Proofs |
| [`MAT336`](MAT336) | Elements of Analysis |

## Building

GitHub Actions builds every deck on each push to `main` and publishes the PDFs,
together with the landing page in [`website/landing-page`](website/landing-page),
to [GitHub Pages](https://siefkenj.github.io/2027S/).

To build a deck locally, run from this directory:

```sh
typst compile --root . --font-path ./fonts MAT149/slides-07.typ
```

Both flags are required:

- `--root .` lets a deck reach `../preamble.typ` and `../libs/`, which sit outside
  its own folder.
- `--font-path ./fonts` uses the fonts vendored in [`fonts/`](fonts) rather than
  whatever is installed.

To publish a new deck, add it to the list in
[`.github/workflows/on-pull-request.yml`](.github/workflows/on-pull-request.yml)
and link it from [`website/landing-page/index.html`](website/landing-page/index.html).

## Layout

| Path | What it is |
| --- | --- |
| [`preamble.typ`](preamble.typ) | Shared course setup: the `course-slides` template, `cover`, `fit-frame`, boxes, notation, attribution, and the `TERM`/`YEAR` shown on every deck. |
| `MATNNN/preamble.typ` | Binds the course code, name and credits, and re-exports the shared preamble. |
| `MATNNN/slides-*.typ` | The decks. |
| [`libs/`](libs) | The slide library, a near-verbatim copy of `book/libs/` from [IBLODEs](https://github.com/siefkenj/IBLODEs). Keep it close to upstream so it can be re-synced; the divergences are listed in [`MAT149/README.md`](MAT149/README.md). |
| [`fonts/`](fonts) | Vendored fonts (see above). |
| [`website/landing-page`](website/landing-page) | The GitHub Pages landing page. |

This repository is modelled on [2026F](https://github.com/siefkenj/2026F); `preamble.typ`,
`libs/`, `fonts/` and the CI workflow were copied from there. The one change to
`preamble.typ` is that the term and year are now the `TERM` and `YEAR` constants,
and the cover lets a long chapter title shrink instead of overlapping the credits.
