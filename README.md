docker-texlive
==============

[![Docker Build Status](https://img.shields.io/docker/build/altaris/docker-texlive.svg)](https://hub.docker.com/r/altaris/docker-texlive/)
[![Docker Pulls](https://img.shields.io/docker/pulls/altaris/docker-texlive.svg)](https://hub.docker.com/r/altaris/docker-texlive/)
[![GitHub](https://img.shields.io/github/license/altaris/docker-texlive.svg)](https://choosealicense.com/licenses/mit/)

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
    --env BIBLIOGRAPHY=yes \
    --env FILE=src/project.tex \
    docker-texlive
```

or equivalently

```sh
docker run --rm \
    --volume /this/is/a/directory:/var/tex \
    --env BIBLIOGRAPHY=yes \
    docker-texlive compile src/project.tex
```

The compilation script reads the following environment variables:

* `BIBLIOGRAPHY_FLAGS` (default: none): Additional flags for the bibliography compiler.
* `BIBLIOGRAPHY` (default: none): Compiles bibliography using the indicated compiler (e.g. `bibtex`, `bibtex8`). If the value is `yes`, then `bibtex` is used. If none is specified, this step is skipped.
* `COMPILER_FLAGS` (default: none): Additional flags for the compiler. Note that the following flags are automatically prepended:
    - `-interaction=nonstopmode`
    - `-output-directory $WORKING_DIR`.
* `COMPILER` (default: `xelatex`): Name of the compiler to use.
* `FILE` (default: `/var/tex/main.tex`): Absolute or relative `.tex` file path.
* `MAKEINDEX_FLAGS` (default: none): Additional flags for the index compiler. Note that the following flags are automatically prepended:
    - `-o $WORKING_DIR/$PROJECT_NAME.ind`, where `PROJECT_NAME` is `$FILE` without the path and the `.tex`
    - `-l $WORKING_DIR/$PROJECT_NAME.ilg`
* `MAKEINDEX` (default: none): Builds index using the indicated compiler. If the value is `yes`, then `makeindex` is used. If none is specified, this step is skipped.
* `WORKING_DIR` (default: `/tmp/tex`): Directory where auxiliary files are written. If value is `no`, then this variable is set to the directory of `$FILE`.
