gulp = require 'gulp'

browserify = require 'browserify'
source = require 'vinyl-source-stream'

coffeeify = require 'coffeeify'

templatify = require 'browserify-underscore-templatify'

sass = require 'gulp-sass'

gulp.task 'default', ['build'], ->
	gulp.watch 'src/*.*', ['build']

gulp.task 'build', ['js', 'css']

gulp.task 'css', ->
	gulp.src('./src/**/*.scss')
        .pipe sass()
        .pipe gulp.dest './dist'

gulp.task 'js', ->
	bundler = browserify(
		entries: [ './src/index.coffee' ]
		debug: true)
	bundler.transform coffeeify
	bundler.transform templatify()

	bundler.bundle()
		.pipe(source('bundle.js'))
		.pipe gulp.dest('./dist/')

