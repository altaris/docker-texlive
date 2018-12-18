IMAGE = docker-texlive
SUDO = sudo

all: build test

build:
	$(SUDO) docker build -t $(IMAGE):$$(git rev-parse --abbrev-ref HEAD) .

clean:
	-$(SUDO) rm test/main.aux
	-$(SUDO) rm test/main.bbl
	-$(SUDO) rm test/main.blg
	-$(SUDO) rm test/main.idx
	-$(SUDO) rm test/main.ilg
	-$(SUDO) rm test/main.ind
	-$(SUDO) rm test/main.log
	-$(SUDO) rm test/main.pdf
	-$(SUDO) rm test/main.toc
	-$(SUDO) rm -rf test/_minted-main

test: build
	$(SUDO) docker run --rm \
	--volume $(shell pwd)/test:/var/tex \
	--env COMPILER_FLAGS="-shell-escape" \
	--env BIBLIOGRAPHY=yes \
	--env MAKEINDEX=yes \
	--env WORKING_DIR=no \
	$(IMAGE):$$(git rev-parse --abbrev-ref HEAD)
