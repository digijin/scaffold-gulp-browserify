path = require 'path'
t2 = require 'through2'
_ = require 'underscore'

# opts =
# 	source: true

module.exports = (file) ->
	unless path.extname(file) is '.html'
		return t2()

	t2 (data, enc, cb) ->
		console.log String data
		# console.log 
		# if opts.source
		# data = _.template(String data).source
		data = "console.log('test');"
		# else
		# 	data = '_=require("underscore");module'
		@push data
		cb()
	# write = (buf) ->
	# 	data += buf

	# end = ->
	# 	compile file, data, (error, result) ->
	# 		if error
	# 			stream.emit 'error', error
	# 		stream.queue result
	# 		stream.queue null

	# if !isCoffee(file)
	# 	return through()
	# data = ''
	# stream = through write, end
	# stream