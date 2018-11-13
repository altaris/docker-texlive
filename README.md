docker-texlive
==============

A dockerized texlive compiler.

# Usage

Let's say you have a tex project in directory `/this/is/a/directory`, and the main file is `main.tex`. Then run

```sh
    docker run --rm \
    --volume /this/is/a/directory:/var/tex \
    --env FLAGS="-shell-escape" \
    docker-texlive
```

Alternatively, if the tex file is located at `/this/is/a/directory/src/project.tex`, then you can run

```sh
    docker run --rm \
    --volume /this/is/a/directory:/var/tex \
    --env FILE=src/project.tex \
    --env FLAGS="-shell-escape" \
    docker-texlive
```

The compilation script reads the following environment variables:

* `COMPILER` (default: `xelatex`): Name of the compiler to use.
* `FILE` (default: `/var/tex/main.tex`): Absolute or relative file path.
* `FLAGS` (default: none): Additional flags for the compiler. Note that the following flags are automatically prepended: `-interaction=nonstopmode`.

# TODOs

- [ ] Better script for build sequences
- [ ] Separate build files from source files
- [ ] Put build files in a temporary volume
- [X] Use environment variables to tweak build
