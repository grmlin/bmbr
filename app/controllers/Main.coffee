Spine = require('spine')
Sidebar = require('controllers/Main.Sidebar')
SidebarFooter = require('controllers/sidebar/Footer')
Game = require('models/Game')
Games = require('controllers/Games')
Player = require('models/Player')

class Main extends Spine.Controller
  className : 'main'
  elements:
    ".sidebar": "jqSidebar"
    ".sidebar > footer": "sidebarFooter"
  constructor: ->
    super
    Game.fetch()
    Player.fetch()
    unless Player.count() > 0
      defaultPlayer = new Player({name:"UNKNOWN"})
      defaultPlayer.save()

    @sidebar = new Sidebar({el:@jqSidebar})
    @sidebar.list.active()

    @sidebarFooter = new SidebarFooter({el: @sidebarFooter})
    @sidebarFooter.active()

    @routes
      "/":->
        @navigate('/game/list')
      "/game/list": ->
        @sidebar.list.active()
        @sidebarFooter.active()
      "/game/:id/show": (params) ->
        @sidebar.show.active(params)
        @sidebarFooter.active()

module.exports = Main