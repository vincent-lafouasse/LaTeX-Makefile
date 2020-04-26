# A simple Makefile for LaTeX using latexmk

## Introduction

`latexmk` is a powerful tool to properly compile `.tex` files.

Compiling `.tex` files may take several runs of compilation to properly output, especially if using a bibliography and cross-references or if using a table of contents.

`latexmk` will automatically do everything for you so you may just use the command `latexmk myfile.tex`.

So `latexmk` is actually already a great tool to automate the compilation of `.tex` documents (which explains why my Makefile is so succint).
The only problem with `latexmk` is that it put all auxilliary files (`.aux`, `.log`, `.bbl`, etc.) in the same directory as the `.tex`, which can get messy, especially with several `.tex` files.
This Makefile just runs `latexmk` then puts all those nasty files in an aux directory which is removed with the target `clean`.

## Features #

- [X] Properly compiles all TeX projects (a feature of `latexmk`).

- [X] Puts the shell output of the compilation in `tmp/yourfile/out` to avoid clutter in the shell and only have necessary information showing.

- [X] If the compilation fails, show the tail of the `tmp/yourfile/out` for debugging purposes.

- [X] Puts everything but the `.tex` and the output file (`.pdf` or `.dvi` etc) in `aux/yourfile/` to avoid clutter in your master directory.

- [X] Removes uneeded files using `make clean` or `make mrproper` (See "Commands").

### To be implemented

- [ ] Selective `clean` and `mrproper` targets that will only delete the aux files from a certain project.

- [ ] Include `.dvi` and `.ps` output files.

- [ ] Avoid relinking (recompiling when not necessary) even though compiling TeX projects doesn't take *that much* time (~ 10 s).


## Requirements

- `latexmk` is a Perl script, so you may have to install [Perl](https://www.perl.org).

- Obviously, the package `latexmk` should be installed, tho for me, it came with my LaTeX distribution. It comes with MikTex and MacTex. (Note that simply typing `latexmk` will compile all `.tex` files in the directory).

## Use

Just put the Makefile in the same directory as your .tex file and type `make myfile.pdf`in the shell while in the directory containing your `.tex`.

I personnally put the Makefile in a dedicated directory and create a symbolic link in each of my tex directory.

#### Dvi and Ps

I personnally only use `.pdf` but I will soon implement `.dvi` and `.ps` modes.

#### Commands

- `make myfile.pdf` will compile your project and output a `.pdf`.

- `make clean` clears everything but the `.tex` and the output file (for me `.pdf` but it won't clear `.dvi` and `.ps` either).

- `make mrproper` clears everything but the `.tex`.

Note that `make clean` and `make mrproper` will clear auxilliary from ALL projects in the directory. Selective `clean` and `mrproper` which would only clear the auxilliary files from a selected project is to be implemented.
