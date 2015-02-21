browserify = require 'browserify'
gulp = require 'gulp'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
uglify = require 'gulp-uglify'
sourcemaps = require 'gulp-sourcemaps'
t2 = require 'through2'
coffeeify = require 'coffeeify'

gulp.task 'default', ['js'], ->
	# gulp.watch 'gulpfile.coffee', ['js']


gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		debug: true)
	bundler.transform coffeeify

	# xform = t2.obj (file, enc, cb) ->
	# 	console.log String file.contents
	# 	@push file
	# 	cb()

	bundle = ->
		bundler.bundle()
			.pipe(source('bundle.js'))
			.pipe(buffer())
			.pipe(sourcemaps.init(loadMaps: true))
			# .pipe(xform)
			.pipe(uglify())
			.pipe(sourcemaps.write())#'./'
			.pipe gulp.dest('./dist/')

	bundle()
