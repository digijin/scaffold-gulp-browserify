gulp = require 'gulp'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'
_ = require 'underscore'


externals = 
	'underscore': './bower_components/underscore/underscore.js'


gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		cwd: './'
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	_.keys(externals).forEach (ex) ->
		bundler.external(ex)

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')

gulp.task 'vendor', ->

	bundler = browserify()

	for name of externals
		bundler.require externals[name], expose: name
	
	bundler.bundle()
		.pipe source 'vendor.js'
		.pipe gulp.dest './dist'
