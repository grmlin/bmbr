require = window.require

describe 'Main.Sidebar.List.Items', ->
  Main.Sidebar.List.Items = require('controllers/main.sidebar.list.items')
  
  it 'can noop', ->
    