#!/bin/sh

export SRC="$(pwd)"

cd "$(dirname "$0")"

COMMAND="${1:-lab}"

make "$COMMAND"
