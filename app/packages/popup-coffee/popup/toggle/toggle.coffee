@PopupToggle  = class PopupToggle extends BlazeComponent
  @register 'PopupToggle'

  template: () ->
    'PopupToggle'

  events: -> [
    'click >': (e) ->
      e.preventDefault()
      data = @data()
      console.log 'PopupToggle:', data
      $popup = $ "[data-popup-window=#{data.id}]"
      unless $popup.size()
        return
      $toggle = $ e.target
      toggle = _.extend $toggle.position(),
        width: $toggle.width()
        height: $toggle.height()
      popup =
        width: $popup.width()
        height: $popup.height()
      pageWidth = $('body').width()
      if data.autoPosition and $popup.is ':hidden'
        $popup.css 'left', () ->
          left = toggle.left + toggle.width / 2.0 - popup.width / 2.0
          if left + popup.width > pageWidth
            left = pageWidth - popup.width
          if left < 0
            left = 0
          left + 'px'
        $popup.css 'top', () ->
          undefined
      $popup.toggle data.animationSpeed
  ]
