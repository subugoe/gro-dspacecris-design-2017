#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086

function imgBuild() {
  imgOptimize
  imgMakeWebp
  imgCopyToJekyll
}

function imgOptimize() {
  mkdir ./assets/img/optimized/
  log "🏗️  IMG optimize JPG"
  # JPG
  ./node_modules/.bin/imagemin \
    ./assets/img/original/**.{jpg,jpeg} \
    --out-dir=./assets/img/optimized/

  # SVG
  log "🏗️  IMG optimize SVG"
  ./node_modules/.bin/imagemin \
    ./assets/img/original/**.svg \
    --plugin=svgo \
    --out-dir=./assets/img/optimized/

  # PNG
  log "🏗  IMG optimize PNG"
  ./node_modules/.bin/imagemin \
    ./assets/img/original/**.png \
    --plugin=pngcrush \
    --out-dir=./assets/img/optimized/
}

function imgMakeWebp() {
  if [ "$npm_package_config_img_webp_active" = "true" ]; then
    log "🏗️  IMG make WebP"
    ./node_modules/.bin/imagemin \
      ./assets/img/original/**.{jpg,jpeg} \
      --plugin=webp \
      --out-dir=./assets/img/optimized/
  else
    log "🏗️  (IMG make WebP deactivated)"
  fi
}

function imgCopyToJekyll() {
  log "🏗️  IMG copy to jekyll"
  mkdir ./jekyll/assets/img
  cp ./assets/img/optimized/**.* ./jekyll/assets/img
}

function imgWatch() {
  log "😳  IMG watch"
  ./node_modules/.bin/nodemon \
    -e jpeg,jpg,png,svg,gif \
    --watch assets/img/original \
    -x "./bin/img-build.sh"
}

function imgCleanup() {
  log "🗑️  IMG Clean-Up"
  rm -r ./assets/img/optimized/*
}
