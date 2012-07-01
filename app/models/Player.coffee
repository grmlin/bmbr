Spine = require('spine')

class Player extends Spine.Model
  @configure 'Player', 'name'
  @extend Spine.Model.Local
  constructor: ->
    super
  @getLocalPlayer: ->
    Player.first()

module.exports = Player