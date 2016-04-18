#!/bin/sh

set -e

export LANG=C

docker build --tag=asustor/$(basename ${PWD}) .
