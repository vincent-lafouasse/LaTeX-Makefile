# lists of all output files that can be made
ALL_PDF = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
ALL_DVI = $(patsubst %.tex,%.dvi,$(wildcard *.tex))
ALL_PS = $(patsubst %.tex,%.ps,$(wildcard *.tex))


# makes everything that can be made
# default is pdf
all : $(ALL_PDF)

pdf : $(ALL_PDF)
dvi : $(ALL_DVI)
ps : $(ALL_PS)



%.pdf: aux/% tmp/% %.tex
	latexmk -xelatex $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
# compile using XeLaTex
# redirects the shell output of latexmk to tmp
# if latexmk were to fail, show the tail of said output for debugging purposes
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*
# moves everything but the .tex and .pdf to aux (or eventually .dvi or .ps)

%.dvi : aux/% tmp/% %.tex
	latexmk -dvi $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*

%.ps : aux/% tmp/% %.tex
	latexmk -ps $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*


tmp :
	mkdir -p tmp

aux :
	mkdir -p aux

tmp/%: tmp
	mkdir -p tmp/$*

aux/%: aux
	mkdir -p aux/$*


clean:
	rm -rf aux
	rm -rf tmp
	latexmk -c
# cleans everything but the .tex and .pdf (or eventually .dvi or .ps)

mrproper: clean
	latexmk -C
# cleans everything but the .tex

clean_% :
	latexmk -c $*.tex
	rm -rf aux/$*
	rm -rf tmp/$*
	-rm -df aux
	-rm -df tmp

mrproper_% : clean_%
	rm -rf $*.pdf
	rm -rf $*.dvi
	rm -rf $*.ps



help :
	cat README.md


.PHONY: all clean mrproper help pdf dvi ps
