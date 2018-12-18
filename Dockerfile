FROM alpine:latest

MAINTAINER Cédric HT

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

ENV PATH /app:$PATH

COPY compile /app/

WORKDIR /var/tex

CMD compile
