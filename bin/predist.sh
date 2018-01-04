#!/bin/bash
# shellcheck disable=SC1091

source ./bin/lib.sh

logCleanup
distCleanup
jekyllCleanup
imgCleanup
mkdir dist
