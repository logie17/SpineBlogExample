require = window.require

describe 'Blog', ->
  Blog = require('controllers/blog')
  
  it 'can noop', ->
    