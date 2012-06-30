require('lib/setup')

Spine = require('spine')
Main = require('controllers/Main')

class App extends Spine.Controller
  elements:
    "#main": "jqMain"
  constructor: ->
    super
    @main = new Main({el:@jqMain})
    @main.active()

    Spine.Route.setup()

module.exports = App
    