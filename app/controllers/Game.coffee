Spine = require('spine')

class Game extends Spine.Controller
  constructor: ->
    super
    @routes
      "/game/:id/show": (params) ->
        @log("/game/", params.id)
    
module.exports = Game