require('lib/setup')

Spine = require('spine')
Blog  = require('controllers/blog')

class App extends Spine.Controller
  constructor: ->
    super
    @blog = new Blog
    @append @blog

    Spine.Route.setup()

module.exports = App
    
