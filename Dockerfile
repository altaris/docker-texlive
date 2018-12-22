FROM alpine:latest

# Metadatas
MAINTAINER Cédric HT

# Package installation through apk
RUN apk add --no-cache texlive-full
RUN apk add --no-cache curl
RUN apk add --no-cache python3

# Package installation through pip
RUN `# Install pip`                                                        && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py                && \
    python3 get-pip.py                                                     && \
    rm get-pip.py                                                          && \
    `# Install packages`                                                   && \
    pip install --no-cache-dir Pygments                                    && \
    `# Cleanup`                                                            && \
    rm -rf /root/.cache/pip 

# Rebuild font cache
RUN ln -s /usr/share/texmf-dist/fonts/ /usr/share/ && fc-cache -fs

# Setup executables
ENV PATH /app:$PATH
COPY compile /app/

# Initial state
WORKDIR /var/tex
CMD compile
