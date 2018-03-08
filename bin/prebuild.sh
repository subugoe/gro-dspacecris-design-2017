#!/bin/bash
# shellcheck disable=SC1091

source ./bin/lib.sh

logCleanup
buildCleanup
jekyllCleanup
imgCleanup
mkdir build
