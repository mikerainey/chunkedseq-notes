PDFLATEX = pdflatex
LATEX = latex


default: pdf

dvi: 
	$(LATEX) main

ps: dvi
#	dvips -o main.ps -t letter main
	dvips -P cmz -t letter -o main.ps main.dvi

pstopdf: ps
	ps2pdfwr main.ps main.pdf

DEP=$(wildcard *.tex) $(wildcard ../../bibliography/*.bib)

bib: $(DEP)
	$(PDFLATEX) main
	bibtex main
	$(PDFLATEX) main
	$(PDFLATEX) main


pdf: $(DEP)
	$(PDFLATEX)  main

img.gen: graphs.r
	R --file=graphs.r
	touch img.gen

simple: 
	$(PDFLATEX)  main

final: 
	rm -f main.pdf main.aux main.dvi main.log main.bbl main.blg
	$(PDFLATEX)  main
	bibtex main
	$(PDFLATEX)  main
	$(PDFLATEX)  main
	open main.pdf
clean: 
	rm -f main.aux main.dvi main.bbl main.blg main.log main.pdf main.ps



cont: continuous
continuous:
	mkdir -p ./build
	latexmk -outdir=./build -pdf -pvc main.tex
