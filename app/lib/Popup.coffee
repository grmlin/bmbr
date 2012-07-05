Spine   = require('spine')
$ = Spine.$
keycodes = require('lib/keycodes')

class Popup extends Spine.Controller
  @POPUP_FADE_DURATION: 200
  events:
    'click .close': 'close'

  constructor: ->
    super

  open: ->
    @el.fadeIn(Popup.POPUP_FADE_DURATION).prev().fadeIn(Popup.POPUP_FADE_DURATION)
    $('body').on('keyup.popup',@handleKeystroke)

  close: ->
    @el.fadeOut(Popup.POPUP_FADE_DURATION).prev().fadeOut(Popup.POPUP_FADE_DURATION)
    $('body').off('keyup.popup')


  handleKeystroke: (e) =>
    if e.keyCode is keycodes.Esc
      @close()


module.exports = Popup