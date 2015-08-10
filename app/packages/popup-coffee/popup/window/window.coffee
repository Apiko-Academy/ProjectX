@PopupWindow  = class PopupWindow extends Popup
  @register 'PopupWindow'

  template: () ->
    'PopupWindow'

  events: -> [
    'click .popup-window-close-btn': () ->
      @.$('.popup-window').hide()
  ]
