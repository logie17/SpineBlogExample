Spine = require('spine')
Post  = require('models/post')
$     = Spine.$


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
    console.log("FUKC!!!")
    @item = Contact.find(params.id)
    console.log("FUKC!!!")
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
    console.log("FUKC!!!")
    @item = Post.find(params.id)
    console.log("FUKC!!!")
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
    
module.exports = Posts
