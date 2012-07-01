Spine = require('spine')
Sidebar = require('controllers/Main.Sidebar')
Game = require('models/Game')
Games = require('controllers/Games')
Player = require('models/Player')

class Main extends Spine.Controller
  className : 'main'
  elements:
    ".sidebar": "jqSidebar"
  constructor: ->
    super
    @sidebar = new Sidebar({el:@jqSidebar})
    @sidebar.list.active()

    @game = new Games()
    Game.fetch()

    unless Player.count() > 0
      defaultPlayer = new Player({name:"UNKNOWN"})
      defaultPlayer.save()
    
module.exports = Main