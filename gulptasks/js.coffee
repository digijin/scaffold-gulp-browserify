gulp = require 'gulp'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'


gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')

