Spine = require('spine')
Sidebar = require('controllers/Main.Sidebar')
Game = require('controllers/Game')

class Main extends Spine.Controller
  className : 'main'
  elements:
    ".sidebar": "jqSidebar"
  constructor: ->
    super
    @sidebar = new Sidebar({el:@jqSidebar})
    @sidebar.list.active()

    @game = new Game()
    
module.exports = Main