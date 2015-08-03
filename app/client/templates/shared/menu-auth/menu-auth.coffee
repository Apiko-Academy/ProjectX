Template.MenuAuth.events
  'click [data-action="sign-out"]': (e) ->
    e.preventDefault()
    Meteor.logout()
    Router.go 'home'
