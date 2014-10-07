# File: Makefile
SHELL           = /bin/sh
PROJECT         = thesis
PS2PDF          = ps2pdf14
DVIPS_FLAGS     = -Pcmz -Pamz -tA4
HTML_DIR        = html

.PHONY          = all clean

.PRECIOUS: $(PROJECT).ps

all: pdf

pdf: $(PROJECT).pdf

html: $(HTML_DIR)/$(PROJECT).html

view: $(PROJECT).pdf
	acroread $(<)

%.pdf: %.ps
	$(PS2PDF) $(<) $(@)

%.ps: %.dvi
	dvips $(DVIPS_FLAGS) -o $(@) $(<)

%.dvi: %.tex Makefile *.tex *.sty
	latex $(<)
	-bibtex $(PROJECT)
	latex $(<)
	latex $(<)

$(HTML_DIR)/%.html: %.tex
	mkdir -p $(HTML_DIR)
	htlatex $(PROJECT).tex html "" -d$(HTML_DIR)
	rm $(PROJECT).html $(PROJECT).css

force:
	$(MAKE) -W $(PROJECT).tex

dist: pdf clean
	( cd .. ; \
	rm -rf thesis-style_`date +%Y%m%d`.zip ; \
	zip -r thesis-style_`date +%Y%m%d`.zip thesis-style -x \*/.svn/\* \*/auto/\*   )
	cp thesis.pdf ../thesis-style_`date +%Y%m%d`.pdf

clean:
	rm -f *.{pdf,out,brf,toc,lof,lot,loa,synctex,bbl,blg,bak,aux,dvi,ps,log,tmp,idv,lg,xref,4ct,4tc} *~
	rm -f img/*-eps-converted-to.pdf
	rm -rf $(HTML_DIR)
