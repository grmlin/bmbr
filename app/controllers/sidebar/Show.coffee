Spine   = require('spine')
Game    = require('models/Game')
Player  = require('models/Player')
Popup   = require('lib/Popup')

class Show extends Spine.Controller
  elements:
    '.share-game-wrapper': 'jSharePopup'
    '.share-game-wrapper input': 'jShareUrl'
  events:
    'click .game-actions .share-game':'share'
  className: 'sidebar-show game'
  currentGame: ""
  constructor: ->
    super
    @sharePopup = null
    Player.bind 'refresh change', @render
    @active @show

  show: (params) ->
    @currentGame = params.id
    @render()

  render: () =>
    unless @currentGame is ""
      game = Game.find(@currentGame)
      @log game, Player.find(game.creator)

      viewData =
        game: game
        owner: Player.find(game.creator)
        url: window.location
        helper:
          getPlayerName: (playerId) ->
            Player.find(playerId).name

      @html require('views/sidebar-show')(viewData)

  share: =>
    @sharePopup = new Popup({el:@jSharePopup}) if @sharePopup is null
    @sharePopup.open()
    @jShareUrl.focus().select()


module.exports = Show