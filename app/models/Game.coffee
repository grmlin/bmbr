Spine = require('spine')

class Game extends Spine.Model
  @configure 'Game', 'name','player_number', 'players', 'state', 'public'
  validate: ->
    "A game name is required" unless @name
  
module.exports = Game