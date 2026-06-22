# Build the Subversion book (LaTeX) into a PDF.
#
#   make            -> book.pdf
#   make clean      -> remove build artifacts
#
# Requires xelatex (texlive-xetex) for native UTF-8 (the text uses → … ™ ®).
# book.tex is the master; the chapters live in tex/ and are pulled in with
# \input.  Images are in images/.

ENGINE = xelatex
FLAGS  = -interaction=nonstopmode -halt-on-error -output-directory=build
SOURCES = book.tex $(wildcard tex/*.tex)

book.pdf: $(SOURCES)
	@mkdir -p build
	$(ENGINE) $(FLAGS) book.tex
	$(ENGINE) $(FLAGS) book.tex   # second pass: table of contents
	$(ENGINE) $(FLAGS) book.tex   # third pass: cross-references
	cp build/book.pdf book.pdf

clean:
	rm -rf build book.pdf

.PHONY: clean
