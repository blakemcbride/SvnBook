# Version Control with Subversion — 1.14.5 Edition

An updated, LaTeX-built edition of *Version Control with Subversion* — the
standard book on Apache Subversion — brought up to date for **Subversion
1.14.5** and typeset from LaTeX into a PDF.

> **This is an unofficial derivative work.** It is not affiliated with, nor
> endorsed by, the original authors or the Apache Subversion project. Any
> errors introduced by the update are not the original authors'.

## Credit to the original authors

*Version Control with Subversion* was written by **Ben Collins-Sussman**,
**Brian W. Fitzpatrick**, and **C. Michael Pilato**, Copyright © 2002–2016.
The original book documents Subversion through version **1.8** and is
published at <https://svnbook.red-bean.com/>. It is licensed under the
[Creative Commons Attribution License 2.0 (CC BY 2.0)][cc].

Essentially all of the prose and figures in this edition are the original
authors' work. This repository converts, updates, and extends that work;
the substance and the credit belong to them.

## What makes this edition different

This edition was produced by **Claude Code** under the direction of
**Blake McBride**. Relative to the original (which covered Subversion 1.8),
it differs as follows.

- **Format.** Converted from the original DocBook XML sources to LaTeX. The
  book now builds to a PDF with `xelatex` (see [Building](#building)).
- **Updated to Subversion 1.14.5.** The reference and the behavior chapters
  were audited against a 1.14.5 install:
  - The "What's New in Subversion" history now runs through 1.14.
  - **Interactive conflict resolver** rewritten for the 1.10 redesign, plus
    the 1.9 three-way (`|||||||`) conflict markers.
  - **Path-based authorization** wildcard / `:glob:` rules (1.10).
  - **FSFS** logical addressing (format 7, 1.9), **LZ4** compression
    (format 8, 1.10), and the `fsfs.conf` tuning options.
  - **Shelving / checkpointing** (experimental) and **Python 3** bindings
    (1.14) coverage.
  - Command reference filled in against the 1.14.5 binaries: the new
    `svn auth` subcommand; the new `svnadmin` subcommands (`info`,
    `rev-size`, `build-repcache`, `delrevprop`, `dump-revprops`,
    `load-revprops`); a brand-new **`svnfsfs`** reference chapter; and the
    options added across the tools in 1.9–1.14.
- **Berkeley DB demoted to history.** FSFS is presented as *the* repository
  back end. Berkeley DB is mentioned only in historical context; the
  architecture diagram, the BDB-specific appendix, and the BDB-only
  `svnadmin` options/subcommands were removed.
- **Appendices.** Removed *Subversion for CVS Users* and *The Berkeley DB
  Legacy Filesystem*; added a new appendix documenting the open-source
  [Subversion-Utils](https://github.com/blakemcbride/Subversion-Utils)
  command-line helpers.

## Building

```sh
make          # produces book.pdf
make clean    # remove build artifacts
```

Requires **xelatex** (e.g. Fedora's `texlive-xetex`); the text uses Unicode
characters (→ … ™ ®) that need a Unicode-aware engine. The build runs three
passes (content, table of contents, cross-references) and currently produces
a clean **576-page** PDF (trimmed to **6.69 × 9.61 in**, i.e. 170 × 244 mm)
with 0 errors and 0 undefined cross-references.

## Repository layout

```
book.tex     master file: preamble, title page, TOC, \part structure, \input list
tex/         one file per chapter/appendix (mirrors the original DocBook split)
images/      figures referenced by \includegraphics
sample-repositories/   example SVN dump used by the branching/merging chapter
Makefile
```

To edit the book, edit the files under `tex/`. To change the document class,
packages, title page, or part structure, edit `book.tex`.

## License

Like the original, this edition is licensed under the
[Creative Commons Attribution License 2.0 (CC BY 2.0)][cc]. You are free to
share and adapt it, including commercially, provided you **give credit to
the original authors** (named above), **indicate that changes were made**
(this file does so), and **do not imply their endorsement**.

[cc]: https://creativecommons.org/licenses/by/2.0/
