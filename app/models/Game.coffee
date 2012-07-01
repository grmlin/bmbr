Spine = require('spine')

class Game extends Spine.Model
  @configure 'Game', 'name','creator', 'players', 'state', 'public'
  @extend Spine.Model.Local

  @MAX_PLAYER: 4
  @PLAYER_COLORS: ["#C75233","#C78933","#79B5AC","#5E2F46"]

  players: []
  state: 1

  validate: ->
    "An owner has to be set for a game" unless @creator
    "A game name is required" unless @name
    "Maximum #{Game.MAX_PLAYER} players are allowed in a game, not #{@players.length}" unless @players.length <= Game.MAX_PLAYER

  addPlayer: (player) ->
    @updateAttribute("players", @players.concat([player.id]))

  helper:
    getPlayerColor: (index) ->
      if index >= Game.PLAYER_COLORS.length then 'red' else Game.PLAYER_COLORS[index]

module.exports = Game