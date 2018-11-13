FROM debian:stretch

MAINTAINER Cédric HT

RUN apt-get --assume-yes update
RUN apt-get --assume-yes install texlive-full
RUN apt-get --assume-yes clean
RUN rm --recursive --force /var/lib/apt/lists/*

ENV PATH /app:$PATH

COPY compile /app/

WORKDIR /var/tex

CMD compile
