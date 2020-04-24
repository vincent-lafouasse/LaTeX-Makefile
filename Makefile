all:

%.pdf: dir tmp
	latexmk -pdf $*.tex > tmp/out || (tail tmp/out && exit 1)
	# redirects the output of latexmk to tmp/out
	# if latexmk were to fail, show the tail of said output for debugging purposes
	mv `ls $*.* | grep -v '.tex\|.pdf'` aux
	mv $*.fdb_latexmk aux
	-mv $*Notes.bib aux
	# move everything else but the .tex and .pdf to aux

tmp:
	mkdir -p tmp

dir:
	mkdir -p aux

clean:
	rm -rf aux
	rm -rf tmp
# cleans everything but the .tex and .pdf

mrproper: clean
	latexmk -C
# cleans everything but the .tex

.PHONY: all clean dir tmp mrproper
