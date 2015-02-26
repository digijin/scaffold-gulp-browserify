gulp = require 'gulp'


sass = require 'gulp-sass'

require './gulptasks/js.coffee'

gulp.task 'default', ['build'], ->
	gulp.watch 'src/*.*', ['build']

gulp.task 'build', ['js', 'css']

gulp.task 'css', ->
	gulp.src('./src/**/*.scss')
        .pipe sass()
        .pipe gulp.dest './dist'
