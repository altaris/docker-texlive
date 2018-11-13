FROM debian:stretch

MAINTAINER Cédric HT

RUN apt-get --assume-yes update
RUN apt-get --assume-yes install texlive-full
RUN apt-get --assume-yes clean
RUN rm --recursive --force /var/lib/apt/lists/*

WORKDIR /var/tex
