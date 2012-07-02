Spine   = require('spine')
$       = Spine.$
Player = require('models/Player')


class Footer extends Spine.Controller
  className: 'sidebar-footer'
  elements:
    '.player-name':'playerName'
  events:
    'keydown .player-name':'handleEditKeyDown'
    'keyup .player-name':'handleEditKeyUp'
  constructor: ->
    super
    @edited = false;
    @player = Player.getLocalPlayer()
    @player.bind 'refresh change', @render
    @render()

  render: =>
    @log "name changed, edited: #{@edited}"
    if not @edited
      @playerName.text(@player.name)
    else
      @edited = false

  handleEditKeyDown: (e) =>
    if e.keyCode is 27 or e.keyCode is 13
      @playerName.blur()

  handleEditKeyUp: (e) =>
    if e.keyCode isnt 27 or e.keyCode isnt 13
      @edited = true
      @player.updateAttribute("name", @playerName.text())
    return false
module.exports = Footer