FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV HYPERFINE_VERSION=1.12.0

RUN mkdir /tmp/benchmark
COPY . /tmp/benchmark

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev wget dpkg \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/sharkdp/hyperfine/releases/download/v${HYPERFINE_VERSION}/hyperfine_${HYPERFINE_VERSION}_amd64.deb \
    && dpkg -i hyperfine_${HYPERFINE_VERSION}_amd64.deb

RUN pip install --upgrade flit poetry hatch

RUN export FLIT_ROOT_INSTALL=1

# ENTRYPOINT [ "/bin/sh /tmp/benchmark/run_benchmark.sh" ]
