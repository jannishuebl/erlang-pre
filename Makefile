
all:
	make out/index.pdf
	make out/handout_raw.pdf
	make out/handout.pdf
	make out/article.pdf
	

out/%.pdf: %.tex content.tex
	pdflatex -output-directory=out $<
	pdflatex -output-directory=out $<
	pdflatex -output-directory=out $<

clean:
	rm -r -f out
	mkdir out

view:
	evince out/index.pdf

pres:
	evince -s out/index.pdf

#ENDE
