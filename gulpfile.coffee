# inspired by https://github.com/KyleAMathews/coffee-react-quickstart
# 
fs = require 'fs'
process = require 'process'

gulp = require 'gulp'
gutil = require 'gulp-util'
size = require 'gulp-size'
compass = require 'gulp-compass'
minimist = require 'minimist'

options = minimist process.argv.slice(2)
delete options._
if Object.keys(options).length == 0 && options.constructor == Object
  console.log "options emtpy, doing nothing"

# FIXME, make better error message
try
  config = require './projects'
catch err
  console.log "A projects config file needs to be created (projects.json, projects.js, or projects.coffee)." # noqa
  config = {}
  # destroy options
  options = {}

gulp.task 'projects', () ->
  projects = Object.keys options
  console.log "Compiling stylesheets for #{projects.join(', ')}"
  projects.forEach (proj) ->
    src = "./sass/*.scss"
    if config[proj]?.sass
      src = "./#{config[proj].sass}/*.scss"
    dest = config[proj].css
    gulp.src(src)
    .pipe compass
      config_file: './config.rb'
      css: 'assets/stylesheets'
      sass: 'sass'
    .on 'error', (error) ->
      console.log error
      @emit 'end'
    .pipe size()
    .pipe gulp.dest config[proj].css
    
gulp.task 'default', ->
  gulp.start 'projects'
 
gulp.task 'compass', ->
  gulp.src './sass/*.scss'
  .pipe compass
    task: 'watch'
    config_file: './config.rb'
    css: 'assets/stylesheets'
    sass: 'sass'
  .on 'error', (error) ->
    console.log error
    @emit 'end'
  .pipe size()


      
  
gulp.task 'watch', ->
  gulp.watch ['./sass/**/*.scss'], ['compass']
