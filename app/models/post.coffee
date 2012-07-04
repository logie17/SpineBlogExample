Spine = require('spine')

class Post extends Spine.Model
  @configure 'Post', 'author_last_name', 'author_first_name', 'content'
  @extend @Local

  #Class level    
  fullName: -> [ @author_last_name, @author_first_name ].join(' ')

  #Unable to save unless satisfied
  validate: -> 
    unless @author_last_name and @author_first_name and content
      "Author first and last name are required, as well as content"
  
module.exports = Post
