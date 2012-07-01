Spine = require('spine')

class Games extends Spine.Controller
  constructor: ->
    super
    @routes
      "/game/:id/show": (params) ->
        @log("/game/", params.id)
    
module.exports = Games