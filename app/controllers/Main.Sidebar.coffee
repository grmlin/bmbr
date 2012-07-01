Spine   = require('spine')
Game    = require('models/Game')
Player  = require('models/Player')
$       = Spine.$

class SidebarList extends Spine.Controller
  @CREATE_LAYER_FADE_DURATION: 200
  className: 'sidebar-list games'
  events:
    'click header button':'openCreateLayer'
    'click .new-game-form-wrapper .close':'closeCreateLayer'
    'submit .new-game-form-wrapper form': 'submit'
    'click .new-game-form-wrapper .save': 'submit'

  elements:
    'footer .player-name': 'playerName'
    '.new-game-form-wrapper': 'createGameFormWrapper'
    '.new-game-form-wrapper form': 'createForm'
    'input': 'search'
    '.scrollable table tbody': 'gamesTable'

  constructor: ->
    super
    @active @render
    Game.bind 'refresh change', @render
    Player.bind 'refresh change', @renderPlayerName
    @html require('views/sidebar-list')()

  render: =>
    games = Game.all()
    html =if games.length > 0 then require('views/sidebar-list-game')(games) else require('views/sidebar-list-nogame')()
    @gamesTable.html html

  renderPlayerName: =>
    @playerName.text(Player.getLocalPlayer().name)

  openCreateLayer: ->
    @createGameFormWrapper.fadeIn(SidebarList.CREATE_LAYER_FADE_DURATION).prev().fadeIn(SidebarList.CREATE_LAYER_FADE_DURATION)

  closeCreateLayer: ->
    @createGameFormWrapper.fadeOut(SidebarList.CREATE_LAYER_FADE_DURATION).prev().fadeOut(SidebarList.CREATE_LAYER_FADE_DURATION)

  submit: (e) ->
    e.preventDefault()
    game = Game.fromForm(@createForm)
    game.addPlayer(Player.getLocalPlayer())
    unless game.save()
      msg = game.validate()
      return alert(msg)

    @closeCreateLayer()
    #@navigate('/game', game.id, 'show')

class SidebarShow extends Spine.Controller
  className: 'sidebar-show game'
  constructor: ->
    super
    @html require('views/sidebar-show')()

class Sidebar extends Spine.Stack
  controllers:
    list: SidebarList
    show: SidebarShow

module.exports = Sidebar