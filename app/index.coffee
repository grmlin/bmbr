require('lib/setup')

Spine = require('spine')
Main = require('controllers/Main')

class App extends Spine.Controller
  elements:
    "#main": "jqMain"
  constructor: ->
    super
    @main = new Main({el:@jqMain})

module.exports = App
    