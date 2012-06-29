require = window.require

describe 'Main.Sidebar', ->
  Main.Sidebar = require('controllers/main.sidebar')
  
  it 'can noop', ->
    