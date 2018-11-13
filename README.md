docker-texlive
==============

A dockerized texlive compiler.

# Usage

Let's say you have a tex project in directory `/this/is/a/directory`, and the main file is `main.tex`. Then run

```sh
    docker run --rm --volume /this/is/a/directory:/var/tex altaris/docker-texlive xelatex main.tex
```

or use any other compiler you fancy.

# TODOs

- [ ] Script for build sequences
- [ ] Separate build files from source files
- [ ] Put build files in a temporary volume
- [ ] Use environment variables to tweak build
