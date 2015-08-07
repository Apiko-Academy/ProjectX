@Popup = class PopupToggle extends BlazeComponent

  constructor: (kwargs) ->
    kwargs = kwargs ? {}
    @displayCloseBtn = kwargs.displayCloseBtn ? true
    @closeBtnPosition = kwargs.closeBtnPosition ? 'right'
    @animationSpeed = kwargs.animationSpeed ? 400
    @autoPosition = kwargs.autoPosition ? false
    kwargs = _.omit kwargs, 'displayCloseBtn',
                            'closeBtnPosition',
                            'animationSpeed',
                            'autoPosition'
    for key, val of kwargs
      @[key] = val