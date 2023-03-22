#!/bin/sh

cd /tmp/benchmark/poetry
hyperfine -m 100 --warmup 10 'poetry install'
cd /tmp/benchmark/flit
hyperfine -m 100 --warmup 10 -i 'flit install'
cd /tmp/benchmark/hatch
hyperfine -m 100 --warmup 10 'hatch new --init'
