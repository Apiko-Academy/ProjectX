Template.AcceptInvite.events
  'click .accept-invite': (e, t) ->
    console.log Template.currentData()
  'click .decline-invite': (e, t) ->
    console.log Template.currentData()
    Meteor.call 'declineInvitation', Template.currentData(), (err, res) ->
      if res
        Router.go 'userProfile'