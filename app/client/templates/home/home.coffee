Template.Home.events
  'click [data-action="sign-up"]': (e) ->
    e.preventDefault()
    Meteor.logout()
    Tracker.autorun () ->
      if not Meteor.userId()
        Router.go 'atSignUp'
