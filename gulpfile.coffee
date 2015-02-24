browserify = require 'browserify'
gulp = require 'gulp'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
t2 = require 'through2'
coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'

gulp.task 'default', ['js'], ->
	gulp.watch 'src/*.*', ['js']

gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')

