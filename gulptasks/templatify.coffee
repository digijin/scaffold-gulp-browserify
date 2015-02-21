path = require 'path'
t2 = require 'through2'

module.exports = (file) ->
	unless path.extname file is '.html'
		t2()
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