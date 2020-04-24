all:

%.pdf: dir tmp %.tex
	latexmk $*.tex > tmp/out || (less +G tmp/out && exit 1)
# redirects the output of latexmk to tmp/out
# if latexmk were to fail, show the tail of said output for debugging purposes
# the option $pdf_mode = 5; in ~/.latexmkrc allows us to compile using XeLaTex and to just write latexmk instead of latexmk -pdf
	mv `ls $*.* | grep -v '.tex\|.pdf\|.dvi\|.ps'` aux
	mv $*.fdb_latexmk aux
	-mv $*Notes.bib aux
# moves everything but the .tex and .pdf to aux (or eventually .dvi or .ps)

tmp:
	mkdir -p tmp

dir:
	mkdir -p aux

clean:
	rm -rf aux
	rm -rf tmp
	latexmk -c
# cleans everything but the .tex and .pdf (or eventually .dvi or .ps)

mrproper: clean
	latexmk -C
# cleans everything but the .tex

.PHONY: all clean dir tmp mrproper
