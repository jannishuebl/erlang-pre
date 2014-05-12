


all:
	@make --no-print-directory out/index.pdf
	@make --no-print-directory out/handout_raw.pdf
	@make --no-print-directory out/handout.pdf
	@make --no-print-directory out/article.pdf
	

out/%.pdf: %.tex content.tex
	pdflatex -output-directory=out $<
	pdflatex -output-directory=out $<
	pdflatex -output-directory=out $<

index:
	@make --no-print-directory out/index.pdf

handout:
	@make --no-print-directory out/handout_raw.pdf
	@make --no-print-directory out/handout.pdf

article:
	@make --no-print-directory out/article.pdf


clean:
	rm -r -f out
	mkdir out

view:
	evince out/index.pdf

pres:
	evince -s out/index.pdf

install_env:
	sudo apt-get install texlive
	sudo apt-get install latex-beamer

#ENDE
