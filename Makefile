# Build the Subversion book (LaTeX) into a PDF.
#
#   make            -> book.pdf
#   make cover      -> cover.pdf (wraparound print cover: back|spine|front)
#   make front-cover-> front-cover.jpg (front cover only, 300 dpi)
#   make clean      -> remove build artifacts
#
# 'front-cover' additionally requires ImageMagick (the 'magick' command).
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

cover.pdf: cover.tex images/cc-by.png
	@mkdir -p build
	$(ENGINE) $(FLAGS) cover.tex
	$(ENGINE) $(FLAGS) cover.tex   # second pass: TikZ "current page"
	cp build/cover.pdf cover.pdf

cover: cover.pdf

front-cover.jpg: front-cover.tex
	@mkdir -p build
	$(ENGINE) $(FLAGS) front-cover.tex
	$(ENGINE) $(FLAGS) front-cover.tex   # second pass: TikZ "current page"
	magick -density 300 build/front-cover.pdf -background white -flatten \
	       -quality 92 front-cover.jpg

front-cover: front-cover.jpg

clean:
	rm -rf build book.pdf cover.pdf front-cover.jpg

.PHONY: clean cover front-cover
