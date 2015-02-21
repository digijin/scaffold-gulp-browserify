browserify = require('browserify')
gulp = require('gulp')
source = require('vinyl-source-stream')
buffer = require('vinyl-buffer')
uglify = require('gulp-uglify')
sourcemaps = require('gulp-sourcemaps')


gulp.task 'default', ->
	bundler = browserify(
		entries: [ './src/test.js' ]
		debug: true)

	bundle = ->
		bundler.bundle()
			.pipe(source('bundle.js'))
			.pipe(buffer())
			.pipe(sourcemaps.init(loadMaps: true))
			.pipe(uglify())
			.pipe(sourcemaps.write('./'))
			.pipe gulp.dest('./dist/')

	bundle()
