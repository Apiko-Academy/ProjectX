class Controller extends RouteController
  onBeforeAction: () ->
    if Meteor.userId()
      @next()
    else
      Router.goToAccessForbidden()


Namespace 'controllers', Auth: Controller