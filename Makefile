


all:
	@make --no-print-directory out_raw/index.pdf
	@make --no-print-directory out_raw/handout_raw.pdf
	@make --no-print-directory out_raw/handout.pdf
	@make --no-print-directory out_raw/article.pdf


out_raw/%.pdf: %.tex content.tex
	pdflatex -output-directory=out_raw $<
	pdflatex -output-directory=out_raw $<
	pdflatex -output-directory=out_raw $<
	cp $@ out

index:
	@make --no-print-directory out_raw/index.pdf

handout:
	@make --no-print-directory out_raw/handout_raw.pdf
	@make --no-print-directory out_raw/handout.pdf

article:
	@make --no-print-directory out_raw/article.pdf


clean:
	rm -r -f out
	mkdir out

view:
	evince out/index.pdf

pres:
	evince -s out/index.pdf

install_env:
	@echo "Latex and some dependencys must be installed"
	@echo "this will install texlive,latex-beamer,texlive-latex-extra packages"
	@echo "Warning: its a about 2GB of data!!"
	@while [ -z "$$CONTINUE" ]; do \
		read -r -p "Type anything but Y or y to exit. [y/N]: " CONTINUE; \
  done ; \
	[ $$CONTINUE = "y" ] || [ $$CONTINUE = "Y" ] || (echo "Exiting."; exit 1;)
	sudo apt-get install texlive
	sudo apt-get install texlive-latex-extra
	sudo apt-get install latex-beamer

#ENDE
