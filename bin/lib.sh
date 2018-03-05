#!/bin/bash
# shellcheck disable=SC2154
# shellcheck disable=SC2086


function browsersyncReload() {
  log "🏁  BROWSERSYNC reload"
  ./node_modules/.bin/browser-sync \
    reload \
    --url http://${npm_package_config_url}:${npm_package_config_browsersync_port}
}

function browsersyncStart() {
  log "🎬  BROWSERSYNC start"
  ./node_modules/.bin/browser-sync \
    start \
    -c ./browsersync.json \
    --server ./serve \
    --port "${npm_package_config_browsersync_port}" \
    --ui-port "${npm_package_config_browsersync_uiport}"
}


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

function cssNano() {
  if [ "$npm_package_config_css_nano_active" = "true" ]; then
    log "🏗️  CSS Nano"
    ./node_modules/.bin/csso \
      ./assets/css/style.css \
      ./assets/css/style.css
  else
    log "🏗️  (CSS Nano deactived)"
  fi
}

function cssPrefix() {
  if [ "$npm_package_config_css_prefix_active" = "true" ]; then
    log "🏗️  CSS Prefix"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u autoprefixer \
      -b "${npm_package_config_css_prefix_versions}" \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (CSS Prefix deactived)"
  fi
}

function cssFontvalues() {
  if [ "$npm_package_config_css_fontvalues_active" = "true" ]; then
    log "🏗️  CSS Font Values"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-minify-font-values \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (CSS Font Values deactivated)"
  fi
}

function cssCalc() {
  if [ "$npm_package_config_css_calc_active" = "true" ]; then
    log "🏗️  CSS Calc"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-calc \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (CSS Calc deactivated)"
  fi
}

function cssCustomproperties() {
  if [ "$npm_package_config_css_customproperties_active" = "true" ]; then
    log "🏗️  CSS Custom Properties"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-custom-properties \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (CSS Custom Properties deactivated)"
  fi
}

function cssObjectfit() {
  if [ "$npm_package_config_css_objectfit_active" = "true" ]; then
    log "🏗️ CSS Objectfit"
    ./node_modules/.bin/postcss \
      ./assets/css/style.css \
      -m \
      -u postcss-object-fit-images \
      -o ./assets/css/style.css \
      --verbose
  else
    log "🏗️  (CSS Objectfit deactivated)"
  fi
}

function cssCopyToJekyll() {
  log "🏗️  CSS copy to jekyll"
  mkdir ./jekyll/assets/css
  cp ./assets/css/style.css ./jekyll/assets/css/style.css
  cp ./assets/css/style.css.map ./jekyll/assets/css/style.css.map
}





function distCleanup() {
  log "🗑️  DIST Clean-Up"
  rm -rf dist
}





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





function jekyllBuildDist() {
  log "🏗️  JEKYLL build [DIST]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml,jekyll_config_dist.yml
}

function jekyllBuildNetlify() {
  log "🏗️  JEKYLL build [NETLIFY]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml,jekyll_config_netlify.yml
}

function jekyllBuildDev() {
  log "🏗️  JEKYLL build [DEV]"
  bundle exec \
    jekyll build \
    --config jekyll_config_base.yml
}

function jekyllCleanup() {
  log "🗑️  JEKYLL Clean-Up"
  rm -r ./jekyll/assets/img/*
  rm -r ./jekyll/assets/css/*
}

function jekyllWatchDev() {
  log "😳  JEKYLL watch"
  ./node_modules/.bin/nodemon \
    -e md,html,css,js,png,jpg,jpeg,svg \
    --watch jekyll \
    -x "./bin/jekyll-build--dev.sh; ./bin/browsersync-reload.sh;"
}





function log() {
  echo "$1 | $(date '+%Y-%m-%d %H:%M:%S')" >> ./${npm_package_config_log_file}
}

function logCleanup() {
  rm ./log.log
  touch log.log
  log "🗑️  LOG Clean-Up"
}





function scssWatchDev() {
  log "😳  SCSS watch"
  ./node_modules/.bin/nodemon \
    -e scss \
    --watch assets/scss \
    -x ./bin/scss-build--dev.sh
}

function scssBuildDev() {
  scssProcess
  cssPrefix
  cssCalc
  cssFontvalues
  cssObjectfit
  cssCustomproperties
  cssCopyToJekyll
}

function scssBuildDist() {
  scssProcess
  cssPrefix
  cssCalc
  cssFontvalues
  cssObjectfit
  cssNano
  cssCustomproperties
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
