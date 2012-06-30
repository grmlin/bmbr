Spine   = require('spine')
Game    = require('models/Game')
$       = Spine.$

class Sidebar extends Spine.Controller
  className: 'sidebar'
  events:
    'click header button':'openCreateLayer'
    'click .new-game-form-wrapper .close':'closeCreateLayer'
    'submit .new-game-form-wrapper form': 'submit'
    'click .new-game-form-wrapper .save': 'submit'

  elements:
    '.new-game-form-wrapper': 'createGameFormWrapper'
    '.new-game-form-wrapper form': 'createForm'
    'input': 'search'

  constructor: ->
    super
    @html require('views/sidebar')()

  openCreateLayer: ->
    @createGameFormWrapper.show().prev().show()
  closeCreateLayer: ->
    @createGameFormWrapper.hide().prev().hide()
  submit: (e) ->
    e.preventDefault()
    game = Game.fromForm(@createForm)
    unless game.save()
      msg = game.validate()
      return alert(msg)
    @navigate('/game', game.id, 'show')


module.exports = Sidebar