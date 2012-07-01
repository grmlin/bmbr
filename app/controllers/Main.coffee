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

    @routes
      "/game/list": ->
        @sidebar.list.active()
      "/game/:id/show": (params) ->
        @sidebar.show.active(params)

module.exports = Main