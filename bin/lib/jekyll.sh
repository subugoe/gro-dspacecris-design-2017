#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086

function jekyllCleanup() {
  log "🗑️  JEKYLL Clean-Up"
  rm -r ./jekyll/assets/img/*
  rm -r ./jekyll/assets/css/*
}

function jekyllWatch() {
  log "😳  JEKYLL watch"
  ./node_modules/.bin/nodemon \
    -e md,html,css,js,png,jpg,jpeg,svg \
    --watch jekyll \
    --verbose \
    -x "./bin/jekyll-build.sh; ./bin/browsersync-reload.sh;"
}

function jekyllBuild() {
  log "🏗️  JEKYLL build"
  JEKYLL_CONF="jekyll_config_base.yml"
  if [ "$MODE" = "production" ]; then
    JEKYLL_CONF=$JEKYLL_CONF",jekyll_config_build.yml"
  fi
  bundle exec \
    jekyll build \
    --config $JEKYLL_CONF
}
