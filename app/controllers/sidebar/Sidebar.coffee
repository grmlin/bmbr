Spine   = require('spine')
Game    = require('models/Game')
Player  = require('models/Player')
ListItems = require('controllers/Main.Sidebar.List.Items')
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
    '.new-game-form-wrapper': 'createGameFormWrapper'
    '.new-game-form-wrapper form': 'createForm'
    'input': 'search'
    '.scrollable table tbody': 'gamesTable'

  constructor: ->
    super
    @html require('views/sidebar-list')()
    listItems = new ListItems({el:@gamesTable})
    @active ->
    listItems.render()

  openCreateLayer: ->
    @createGameFormWrapper.fadeIn(SidebarList.CREATE_LAYER_FADE_DURATION).prev().fadeIn(SidebarList.CREATE_LAYER_FADE_DURATION)

  closeCreateLayer: ->
    @createGameFormWrapper.fadeOut(SidebarList.CREATE_LAYER_FADE_DURATION).prev().fadeOut(SidebarList.CREATE_LAYER_FADE_DURATION)

  submit: (e) ->
    e.preventDefault()
    player = Player.getLocalPlayer()
    game = Game.fromForm(@createForm)
    game.updateAttribute("creator",player.id)
    game.addPlayer(player)
    unless game.save()
      msg = game.validate()
      return alert(msg)

    @closeCreateLayer()

class SidebarShow extends Spine.Controller
  className: 'sidebar-show game'
  constructor: ->
    super

    @active @show

  show: (params) ->
    @render(params.id)

  render: (id) ->
    game = Game.find(id)
    @html require('views/sidebar-show')(game)


class Sidebar extends Spine.Stack
  controllers:
    list: SidebarList
    show: SidebarShow

module.exports = Sidebar