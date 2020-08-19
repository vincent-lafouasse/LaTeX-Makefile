# A simple Makefile for LaTeX using latexmk

## Introduction

`latexmk` is a powerful tool to properly compile `.tex` projects.

Compiling `.tex` files may take several runs of compilation to properly output, especially when cross-referencing and indexing (citations, label/ref and table of contents).

`latexmk` will automatically do everything for you so you may just use the command `$ latexmk myfile.tex`.

So `latexmk` is actually already a great tool to automate the compilation of `.tex` projects (which explains why my Makefile is so succinct).
The only problem with `latexmk` is that it puts all auxilliary files (`.aux`, `.log`, `.bbl`, etc.) in the same directory as the `.tex`, which can get messy, especially with several `.tex` files.
This Makefile just runs `latexmk` then puts all those nasty files in the `aux/` directory which is removed with the target `clean`.

Note that the command `$ latexmk` will compile all `.tex` files in the directory.

## Features #

- [X] Properly compiles all TeX projects (a feature of `latexmk`).

- [X] Compiles by default all `.tex` projects in the master directory and outputs `.pdf` files. Just use the command `$ make`.

- [X] Puts the shell output of the compilation (the standard output) in `tmp/myfile/out` to avoid clutter in the shell and only have necessary information showing.

- [X] If the compilation fails, it will show the tail of `tmp/myfile/out` for debugging purposes.

- [X] Puts everything but `.tex` files and output files (`.pdf` or `.dvi` etc) in `aux/myfile/` to avoid clutter in your master directory.

- [X] Removes unneeded files using `$ make clean` or `$ make mrproper` (see "Commands").

- [X] Default output type is `.pdf` but compatible with `.dvi` and `.ps` (see "Commands").

- [X] Selective `clean` and `mrproper` targets that will only delete the aux files from a certain project instead of removing the whole `aux/` directory. (see "Commands").

#### Incoming features

- [ ] A target that cleans then recompiles. This may be useful when changing something external to the source code e.g. changing a figure or changing bibliography.

- [ ] Maybe a version 2.0 that would use a `src/` directory for the `.tex` files and an `out/` directory for the output files.

## Requirements

If you use LaTeX, you probably already have the requirements for this Makefile.

- `latexmk` is a Perl script, so you may have to install [Perl](https://www.perl.org).

- Obviously, the package `latexmk` should be installed, tho for me, it came with my LaTeX distribution. It comes with MikTex and MacTex.

## Use

Just put the Makefile in the same directory as your `.tex` file and use the command `$ make myfile.pdf` in the shell while in the directory containing your `.tex`.

You may also use the command `$ make` to compile all `.tex` files and output `.pdf` files.

I personnally put this Makefile in a dedicated directory and create a symbolic link in each of my TeX projects. I will soon create an alias that copies this Makefile and its README in my directory of choice.


#### Commands

- `$ make` will compile all `.tex` files in the directory and output `.pdf` files by default.

- `$ make pdf`, `$ make dvi` and `$ make ps` do the same as `make` but output the desired file types. Note that `$ make pdf` and `$ make` are equivalent.

- `$ make myfile.pdf` will compile `myfile.tex` and output a `.pdf`. Note that you may also make `.dvi` and `.ps` files.

- `$ make clean` clears everything but `.tex` files and output files (for me `.pdf` but it won't clear `.dvi` and `.ps` either). It completely removes `aux/` and `tmp/`.

- `$ make clean_myfile` only removes `aux/myfile` and `tmp/myfile`

- `$ make mrproper` clears everything but the `.tex` (including output files).

- `$ make mrproper_myfile` runs `$ make clean_myfile` and also removes `myfile.pdf` (or `.dvi` or `.ps`).

- `$ make help` shows this README in the shell.

Note that if `aux/` or `tmp/` are empty after `$ make clean_myfile` or `$ make mrproper_myfile`, they will also be removed.


## License

```
            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
                    Version 2, December 2004

 Copyright (C) 2004 Sam Hocevar <sam@hocevar.net>

 Everyone is permitted to copy and distribute verbatim or modified
 copies of this license document, and changing it is allowed as long
 as the name is changed.

            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

  0. You just DO WHAT THE FUCK YOU WANT TO.
```
