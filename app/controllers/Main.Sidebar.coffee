Spine   = require('spine')
$       = Spine.$

class Sidebar extends Spine.Controller
  className: 'sidebar'

  elements:
    '.items': 'items'
    'input': 'search'

  constructor: ->
    super
    @html require('views/sidebar')()

module.exports = Sidebar