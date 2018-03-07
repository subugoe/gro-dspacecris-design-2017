#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086

function postcssO() {
  if [ "$npm_package_config_postcss_o_active" = "true" ]; then
    log "🏗️  PostCSS CSSO"
    ./node_modules/.bin/csso \
      ./assets/css/style.css \
      ./assets/css/style.css
  else
    log "🏗️  (PostCSS CSSO deactived)"
  fi
}

function postcssPrefix() {
  if [ "$npm_package_config_postcss_prefix_active" = "true" ]; then
    log "🏗️  PostCSS Prefix"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u autoprefixer \
      -b "${npm_package_config_css_prefix_versions}" \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Prefix deactived)"
  fi
}

function postcssFontvalues() {
  if [ "$npm_package_config_postcss_fontvalues_active" = "true" ]; then
    log "🏗️  PostCSS Font Values"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-minify-font-values \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Font Values deactivated)"
  fi
}

function postcssCalc() {
  if [ "$npm_package_config_postcss_calc_active" = "true" ]; then
    log "🏗️  PostCSS Calc"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-calc \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Calc deactivated)"
  fi
}

function postcssCustomproperties() {
  if [ "$npm_package_config_postcss_customproperties_active" = "true" ]; then
    log "🏗️  PostCSS Custom Properties"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-custom-properties \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Custom Properties deactivated)"
  fi
}

function postcssObjectfit() {
  if [ "$npm_package_config_postcss_objectfit_active" = "true" ]; then
    log "🏗️  PostCSS Objectfit"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-object-fit-images \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Objectfit deactivated)"
  fi
}

function postcssSelectornot() {
  if [ "$npm_package_config_postcss_selectornot_active" = "true" ]; then
    log "🏗️  PostCSS Selector Not"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-selector-not \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (PostCSS Selector Not deactivated)"
  fi
}
