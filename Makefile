# File: Makefile
SHELL           = /bin/sh
PROJECT         = thesis
PS2PDF          = ps2pdf14
DVIPS_FLAGS     = -Pcmz -Pamz -tA4
OUT_DIR         = out

.PHONY          = all clean

.PRECIOUS: $(PROJECT).ps

all: pdf

pdf: $(OUT_DIR)/$(PROJECT).pdf

html: $(OUT_DIR)/$(PROJECT).html

view: $(OUT_DIR)/$(PROJECT).pdf
	acroread $(<)

$(OUT_DIR)/%.pdf: %.ps
	mkdir -p $(OUT_DIR)
	$(PS2PDF) $(<) $(@)

%.ps: %.dvi
	dvips $(DVIPS_FLAGS) -o $(@) $(<)

%.dvi: %.tex Makefile *.tex *.sty
	latex $(<)
	-bibtex $(PROJECT)
	latex $(<)
	latex $(<)

$(OUT_DIR)/%.html: %.tex
	mkdir -p $(OUT_DIR)
	htlatex $(PROJECT).tex html "" -d$(OUT_DIR)
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
	rm -rf $(OUT_DIR)
