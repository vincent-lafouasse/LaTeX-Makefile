# A simple Makefile for LaTeX using latexmk

## Introduction

`latexmk` is a powerful tool to properly compile `.tex` files.

Compiling `.tex` files may take several runs of compilation to properly output, especially if using a bibliography and cross-references or if using a table of contents.

`latexmk` will automatically do everything for you so you may just use the command `latexmk myfile.tex`.

So `latexmk` is actually already a great tool to automate the compilation of `.tex` documents (which explains why my Makefile is so succinct).
The only problem with `latexmk` is that it puts all auxilliary files (`.aux`, `.log`, `.bbl`, etc.) in the same directory as the `.tex`, which can get messy, especially with several `.tex` files.
This Makefile just runs `latexmk` then puts all those nasty files in the `aux/` directory which is removed with the target `clean`.

Note that simply typing `latexmk` will compile all `.tex` files in the directory.

## Features #

- [X] Properly compiles all TeX projects (a feature of `latexmk`).

- [X] Puts the shell output of the compilation (stdout) in `tmp/yourfile/out` to avoid clutter in the shell and only have necessary information showing.

- [X] If the compilation fails, show the tail of `tmp/yourfile/out` for debugging purposes.

- [X] Puts everything but the `.tex` and the output file (`.pdf` or `.dvi` etc) in `aux/yourfile/` to avoid clutter in your master directory.

- [X] Removes uneeded files using `make clean` or `make mrproper` (See "Commands").

### To be implemented

- [ ] Selective `clean` and `mrproper` targets that will only delete the aux files from a certain project instead of removing the whole `aux/` directory.

- [ ] Include `.dvi` and `.ps` output files.

- [ ] Avoid relinking (recompiling when not necessary) even though compiling TeX projects doesn't take *that much* time (~ 10-20 s).

- [ ] Try compiling a document with a bibliography.


## Requirements

If you use LaTeX, you probably already have the requirements for this Makefile.

- `latexmk` is a Perl script, so you may have to install [Perl](https://www.perl.org).

- Obviously, the package `latexmk` should be installed, tho for me, it came with my LaTeX distribution. It comes with MikTex and MacTex.

## Use

Just put the Makefile in the same directory as your `.tex` file and type `make myfile.pdf` in the shell while in the directory containing your `.tex`.

I personnally put the Makefile in a dedicated directory and create a symbolic link in each of my tex directory.

#### Dvi and Ps

I personnally only use `.pdf` but I will soon implement `.dvi` and `.ps` modes.

#### Commands

- `make myfile.pdf` will compile your project and output a `.pdf`.

- `make clean` clears everything but the `.tex` and the output file (for me `.pdf` but it won't clear `.dvi` and `.ps` either).

- `make mrproper` clears everything but the `.tex`.

- `make help` shows this README in the shell.

Note that `make clean` and `make mrproper` will clear auxilliary from ALL projects in the `aux/` directory (it removes the whole `aux/`). Selective `clean` and `mrproper` which would only clear the auxilliary files from a selected project is to be implemented.

## License

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
        Version 2, December 2004

Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

Everyone is permitted to copy and distribute verbatim or modified
copies of this license document, and changing it is allowed as long
as the name is changed.

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

0. You just DO WHAT THE FUCK YOU WANT TO.
