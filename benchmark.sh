#!/usr/bin/env bash

# Benchmark, GPIOs tested on RPi 3B
# Run from directory with ./test binary.
# e.g. from build/: ../benchmark.sh

set -e

DURATION=3

run() {
  echo "Running: $*"
  timeout "${DURATION}s" "$@" || true
  sleep 1
}

# GPIO 10 (SPI)
run ./test -s grb -g 10 -x 200  -y 1 -b
# GPIO 12 (PWM)
run sudo ./test -s grb -g 12 -x 200  -y 1 -b
# GPIO 21 (PCM)
run sudo ./test -s grb -g 21 -x 200  -y 1 -b

# GPIO 10 (SPI)
run ./test -s grb -g 10 -x 2000 -y 1 -b
# GPIO 12 (PWM)
run sudo ./test -s grb -g 12 -x 2000 -y 1 -b
# GPIO 21 (PCM)
run sudo ./test -s grb -g 21 -x 2000 -y 1 -b