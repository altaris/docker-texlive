FROM debian:stretch

MAINTAINER Cédric HT

# texlive-full installation through apt
# Separated from other installations for better recompilation time
RUN `# Update package list`                                                && \
    apt-get --assume-yes update                                            && \
    `# Install packages`                                                   && \
    apt-get --assume-yes install texlive-full                              && \
    `# Cleanup`                                                            && \
    apt-get --assume-yes clean                                             && \
    rm --recursive --force /var/lib/apt/lists/*

# Other package installation through apt
RUN `# Update package list`                                                && \
    apt-get --assume-yes update                                            && \
    `# Install packages`                                                   && \
    apt-get --assume-yes install curl                                      && \
    apt-get --assume-yes install python3                                   && \
    `# Cleanup`                                                            && \
    apt-get --assume-yes clean                                             && \
    rm --recursive --force /var/lib/apt/lists/*

# Package installation through pip
RUN `# Install pip`                                                        && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py                && \
    python3 get-pip.py                                                     && \
    rm get-pip.py                                                          && \
    `# Install packages`                                                   && \
    pip install --no-cache-dir Pygments                                    && \
    `# Cleanup`                                                            && \
    rm --recursive --force /root/.cache/pip 

ENV PATH /app:$PATH

COPY compile /app/

WORKDIR /var/tex

CMD compile
