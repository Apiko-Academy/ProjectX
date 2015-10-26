class Controller extends controllers.Auth
  layoutTemplate: 'Layout'
  onAfterAction: () ->
    @render 'DefaultMenu', to: 'layoutMenu'


Namespace 'controllers', DefaultMenu: Controller