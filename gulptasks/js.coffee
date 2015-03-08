gulp = require 'gulp'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'

externals = [
	'underscore'
]

gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	externals.forEach (ex) ->
		bundler.external(ex)

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')



gulp.task 'vendor', ->

	bundler = browserify()
		# entries: './src/blank.js'

	externals.forEach (ex) ->
		bundler.require(ex)

	bundler.bundle()
		.pipe source 'vendor.js'
		.pipe gulp.dest './dist'
