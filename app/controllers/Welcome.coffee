Spine   = require('spine')
$       = Spine.$

class Welcome extends Spine.Controller
  className: 'Welcome'

  constructor: ->
    super
    @html require('views/welcome')()


module.exports = Welcome