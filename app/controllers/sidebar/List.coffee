Spine   = require('spine')
ListItems = require('controllers/sidebar/SidebarListItems')
Game    = require('models/Game')
Player  = require('models/Player')
Popup = require('lib/Popup')

class List extends Spine.Controller
  @CREATE_LAYER_FADE_DURATION: 200
  className: 'sidebar-list games'
  events:
    'click header button':'openCreateLayer'
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
    @popup = new Popup({el:@createGameFormWrapper})
    listItems = new ListItems({el:@gamesTable})
    @active ->
      listItems.render()


  openCreateLayer: ->
    @popup.open()

  submit: (e) ->
    e.preventDefault()
    player = Player.getLocalPlayer()
    game = Game.fromForm(@createForm)
    game.updateAttribute("creator",player.id)
    game.addPlayer(player)
    unless game.save()
      msg = game.validate()
      return alert(msg)

    @popup.close()

module.exports = List