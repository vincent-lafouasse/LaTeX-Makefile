all:

%.pdf: aux/% tmp/% %.tex
	latexmk -xelatex $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
# compile using XeLaTex
# redirects the shell output of latexmk to tmp
# if latexmk were to fail, show the tail of said output for debugging purposes
	ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*
# moves everything but the .tex and .pdf to aux (or eventually .dvi or .ps)

tmp :
	mkdir -p tmp

aux :
	mkdir -p aux

tmp/%: tmp
	mkdir -p tmp/$*

aux/%: aux
	mkdir -p aux/$*

clean

clean:
	rm -rf aux
	rm -rf tmp
	latexmk -c
# cleans everything but the .tex and .pdf (or eventually .dvi or .ps)

mrproper: clean
	latexmk -C
# cleans everything but the .tex

.PHONY: all clean tmp/% aux/% mrproper
