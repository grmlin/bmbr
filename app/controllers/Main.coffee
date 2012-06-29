Spine = require('spine')
Sidebar = require('controllers/Main.Sidebar')

class Main extends Spine.Controller
  className : 'main'
  elements:
    ".sidebar": "jqSidebar"
  constructor: ->
    super
    @log(@el)
    @sidebar = new Sidebar({el:@jqSidebar})
    
module.exports = Main