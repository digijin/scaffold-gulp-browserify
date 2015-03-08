
view = require './template.html'

window.onload = ->
	container = document.getElementById 'container'
	container.innerHTML = view()

_ = require 'underscore'
console.log _