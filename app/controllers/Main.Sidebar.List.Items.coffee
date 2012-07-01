Spine = require('spine')
Game = require('models/Game')

class MainSidebarListItems extends Spine.Controller
  events:
    'click tr': 'showGame'

  constructor: ->
    super
    Game.bind 'refresh change', @render

  render: =>
    games = Game.all()
    html =if games.length > 0 then require('views/sidebar-list-game')(games) else require('views/sidebar-list-nogame')()
    console.dir(@el)
    @html html

  showGame: (e) ->
    element = $(e.currentTarget)
    @navigate('/game',element.data("item").id,'show')

module.exports = MainSidebarListItems