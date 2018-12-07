FROM debian:stretch

MAINTAINER Cédric HT

RUN apt-get --assume-yes update
RUN apt-get --assume-yes install texlive-full
RUN apt-get --assume-yes install curl python3
RUN apt-get --assume-yes clean
RUN rm --recursive --force /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3 get-pip.py
RUN rm get-pip.py
RUN pip install --no-cache-dir Pygments
RUN rm --recursive --force /root/.cache/pip

ENV PATH /app:$PATH

COPY compile /app/

WORKDIR /var/tex

CMD compile
