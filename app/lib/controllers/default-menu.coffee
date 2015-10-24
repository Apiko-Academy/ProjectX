class Controller extends controllers.Auth
  onAfterAction: () ->
    @render 'DefaultMenu', to: 'layoutMenu'


Namespace 'controllers', DefaultMenu: Controller