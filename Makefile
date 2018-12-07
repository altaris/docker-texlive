IMAGE = docker-texlive
SUDO = sudo

all: build test

build:
	$(SUDO) docker build -t $(IMAGE) .

clean:
	-rm test/main.pdf

test: build
	$(SUDO) docker run --rm \
	--volume $(shell pwd)/test:/var/tex \
	--env COMPILER_FLAGS="-shell-escape" \
	--env BIBLIOGRAPHY=yes \
	--env MAKEINDEX=yes \
	--env WORKING_DIR=no \
	$(IMAGE)
