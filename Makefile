all:

%.pdf: dir tmp
	latexmk -pdf $*.tex > tmp/out || (less +G tmp/out && exit 1)
	mv `ls $*.* | grep -v '.tex\|.pdf'` aux
	mv $*.fdb_latexmk aux
	-mv $*Notes.bib aux

tmp:
	mkdir -p tmp

dir:
	mkdir -p aux

clean:
	rm -rf aux
	rm -rf tmp

mrproper: clean
	latexmk -C

.PHONY: all clean dir tmp mrproper
