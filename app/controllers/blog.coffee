Spine = require('spine')
Post  = require('models/post')
$     = Spine.$

Posts = require('controllers/posts')

class Blog extends Spine.Controller
  className: 'Blog'

  constructor: ->
    super
    
    @posts  = new Posts

    @routes
      '/posts/:id/edit': (params) ->
        @posts.edit.active(params)
      '/posts/:id': (params) ->
        @posts.show.active(params)

    @append @posts

    Post.fetch()

    
module.exports = Blog
