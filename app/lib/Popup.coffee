Spine   = require('spine')

class Popup extends Spine.Controller
  @POPUP_FADE_DURATION: 200
  events:
    'click .close': 'close'

  constructor: ->
    super

  open: ->
    @el.fadeIn(Popup.POPUP_FADE_DURATION).prev().fadeIn(Popup.POPUP_FADE_DURATION)

  close: ->
    @el.fadeOut(Popup.POPUP_FADE_DURATION).prev().fadeOut(Popup.POPUP_FADE_DURATION)


module.exports = Popup