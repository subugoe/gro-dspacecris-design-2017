#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086

source ./bin/lib/browsersync.sh
source ./bin/lib/postcss.sh
source ./bin/lib/image.sh
source ./bin/lib/jekyll.sh

function sassdoc() {
  log "Sassdoc"
  node_modules/.bin/sassdoc  \
    ./assets/scss/*.scss \
    -d jekyll/sassdoc
}

function sassdocCleanup() {
  log "🗑️  Sassdoc Clean-Up"
  rm -rf ./jekyll/sassdoc/*
}

function cssCleanup() {
  log "🗑️  CSS Clean-Up"
  rm -r ./assets/css/*
}

function cssCopyToJekyll() {
  log "🏗️  CSS copy to jekyll"
  mkdir ./jekyll/assets/css
  cp ./assets/css/style.css ./jekyll/assets/css/style.css
  cp ./assets/css/style.css.map ./jekyll/assets/css/style.css.map
}

function buildCleanup() {
  log "🗑️  Build Clean-Up"
  rm -rf build
}

function log() {
  echo "$1 | $(date '+%Y-%m-%d %H:%M:%S')" >> ./${npm_package_config_log_file}
}

function logCleanup() {
  rm ./log.log
  touch log.log
  log "🗑️  LOG Clean-Up"
}

function scssWatch() {
  log "😳  SCSS watch"
  ./node_modules/.bin/nodemon \
    -e scss \
    --watch assets/scss \
    --verbose \
    -x ./bin/scss-build.sh
}

function scssBuild() {
  scssProcess
  postcssPrefix
  postcssCalc
  postcssFontvalues
  postcssObjectfit
  postcssSelectornot
  postcssCustomproperties
  if [ "$MODE" = "production" ]; then
    postcssO
  fi
  cssCopyToJekyll
}

function scssProcess() {
  log "🏗️  SCSS Process"
  ./node_modules/.bin/node-sass \
    ./assets/scss/style.scss \
    --output-style expanded \
    --source-map true \
    -o ./assets/css/
}

function serveCleanup() {
  log "🗑️  SERVE Clean-Up"
  rm -r ./serve/*
}
