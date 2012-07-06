Spine = require('spine')
Post  = require('models/post')
$     = Spine.$

class AddNew extends Spine.Controller
  className: 'add_new'

  constructor: ->
    super
    @render()
 
  render: ->
    @html require('views/add_post')

class Show extends Spine.Controller
  className: 'show'

  events:
    'click .edit':'edit'

  constructor: ->
    super
    @active @change
 
  render: ->
    @html require('views/show_post')(@item)

  change: (params) =>
    @item = Post.find(params.id)
    @render()
 
  edit: ->
    @navigate('/posts', @item.id, 'edit')

class Edit extends Spine.Controller
  className: 'edit'

  events:
    'submit form': 'submit'
    'click .save': 'submit'
    'click .delete': 'delete'

  elements:
    'form': 'form'

  constructor: ->
    super
    @active @change

  render: ->
    @html require('views/form_post')(@item)

  change: (params) =>
    @item = Post.find(params.id)
    @render()

  submit: (e) ->
    e.preventDefault()
    @item.fromForm(@form).save()
    @navigate('/contacts', @item.id)
  
  delete: ->
    @item.destroy() if confirm('Are you sure?')
    
class Posts extends Spine.Stack
  controllers:
    show: Show
    edit: Edit
    add_new: AddNew
    
module.exports = Posts
