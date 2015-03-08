gulp = require 'gulp'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'



externals = 
	'underscore': './bower_components/underscore/underscore.js'


gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		cwd: './'
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	# externals.forEach (ex) ->
	# 	bundler.external(ex)
	bundler.external 'underscore'

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')



gulp.task 'vendor', ->

	bundler = browserify()
		# entries: './src/externals.js'


	# paths = [
	# 	{
	# 		src: './bower_components/underscore/underscore.js'
	# 		expose: 'uscor'
	# 	}
	# ]
	# bundler.plugin remapify, paths
	bundler.require './bower_components/underscore/underscore.js', expose: 'underscore'

	# externals.forEach (ex) ->
	# 	bundler.require(ex)

	bundler.bundle()
		.pipe source 'vendor.js'
		.pipe gulp.dest './dist'
