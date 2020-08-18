all: main.pdf

FIGURES=fig/helix-semantics.eps fig/helixstages.eps fig/interp-figure.pdf

texdirectives.tex:
	touch $@

main.pdf: texdirectives.tex macros.tex main.tex introduction.tex syntax.tex vellvm-values.tex semantics.tex itree2.tex refinement.tex interpreter.tex helix.tex related.tex refs.bib $(FIGURES)
	latexmk -pdf main -halt-on-error

fast:
	pdflatex main
	bibtex main
	cp main.pdf temp.pdf

clean:
	latexmk -C main
	rm -f *.vo *.glob
# 	rm -f echo.ml echo.mli
