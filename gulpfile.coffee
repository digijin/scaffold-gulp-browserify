gulp = require 'gulp'
coffee = require 'coffee-script'
browserify = require 'browserify'
through2 = require 'through2'
coffeeify = require 'coffeeify'
rename = require 'gulp-rename'
buffer = require 'vinyl-buffer'


gulp.task 'default', ['bundle']


gulp.task 'bundle', ->
	bundler = browserify
		entries: [ './src/test.js' ]
		debug: true

	bundle = ->
		console.log bundler.pipe()
		# bundler.bundle()
		# .pipe buffer()
		# .pipe gulp.dest('./dist/js/')

	bundle()
