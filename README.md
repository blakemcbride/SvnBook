# Version Control with Subversion — LaTeX edition

The book in LaTeX, converted from its original DocBook XML sources.

## Build

```sh
make            # produces book.pdf (578 pages)
make clean      # remove build artifacts
```

Requires **xelatex** (Fedora: `texlive-xetex`) — the text uses Unicode
characters (→ … ™ ®) that need a Unicode-aware engine. The build runs three
passes (content, table of contents, cross-references) and emits **0 errors and
0 undefined cross-references**.

## Layout

```
book.tex            master file: preamble, title, TOC, \part structure, \input list
tex/                one file per chapter (mirrors the original DocBook split)
  foreword.tex
  ch00-preface.tex
  ch01-fundamental-concepts.tex
  ...
  ref-svn.tex ... ref-reposhooks.tex     command reference
  appa-quickstart.tex ... appd-berkeley-db.tex
  copyright.tex
images/             figures referenced by \includegraphics
sample-repositories/  example SVN dump used by the branching/merging chapter
Makefile
```

To edit the book, edit the files under `tex/`. To change the document class,
packages, title page, or part structure, edit `book.tex`.

## History

This was converted from DocBook XML with pandoc + xelatex. The conversion
rebuilt the `<refentry>` command reference into proper chapters/sections,
resolved all cross-references to their target titles, embedded the figures, and
made wide tables and long command-output lines wrap to the page. The DocBook
sources and the one-off conversion tooling have since been removed; `book.tex`
and `tex/` are now the source of truth.
