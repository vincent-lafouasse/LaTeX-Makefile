ALL_PDF = $(patsubst %.tex,%.pdf,$(wildcard *.tex))
ALL_DVI = $(patsubst %.tex,%.dvi,$(wildcard *.tex))
ALL_PS = $(patsubst %.tex,%.ps,$(wildcard *.tex))

all : $(ALL_PDF)

pdf : $(ALL_PDF)

dvi : $(ALL_DVI)

ps : $(ALL_PS)

# makes all pdf files in the master directory

%.pdf: aux/% tmp/% %.tex
	latexmk -xelatex $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
# compile using XeLaTex
# redirects the shell output of latexmk to tmp
# if latexmk were to fail, show the tail of said output for debugging purposes
	ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*
# moves everything but the .tex and .pdf to aux (or eventually .dvi or .ps)

%.dvi : aux/% tmp/% %.tex
	latexmk -dvi $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
	ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'
	mv `ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'` aux/$*
	-mv $*Notes.bib aux/$*

%.ps : aux/% tmp/% %.tex
	latexmk -ps $*.tex > tmp/$*/out || (less +G tmp/$*/out && exit 1)
	ls $*.* | grep -v '\.tex\|\.pdf\|\.dvi\|\.ps'
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

help :
	cat README.md


.PHONY: all clean tmp/% aux/% mrproper help pdf dvi ps
