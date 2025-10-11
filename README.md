# SICP - Exercises (USING Scheme LISP DIALECT)

An introduction to programming by reading through this book [Structure and Interpretation of Computer Programs](https://share.google/ggUrx4yjj69blEZOa) (copy provided publicly and free by the Massachusetts Institute of Technology).

I'll be doing the Lisp exercises provided in the same book as i read through the chapters.


**using**:
- [Chicken](https://wiki.call-cc.org/man/5/Getting%20started) (Interpreter & compiler with REPL for the lisp scheme dialect)

### todo:

- makefile

### note:
no, i wont be using Lisp anymore than for this case for these reasons:

- i preffer learning golang deeply to then use C more later on
- and i wanted to test myself if i knew i understanded the material explained in the book



thanks for reading. maybe i'll update my blog to include a very brief explanation of some chapters.


# extras?

install the tar.gz in the provided link (if you're using Chicken), read the README or ignore it and do:
```sh
mkdir chicken_bins
cd chicken-5.4.0
make PREFIX=$HOME/Desktop/chicken_bins/ install
```

and then load that *chicken_bins/* into your PATH and source it (source .bashrc) 

```sh
#compiling
csc -o ./outputFile 1_1.scm
./outputFile
```

```sh
#or load it into the REPL
 csi 1_1.scm
```