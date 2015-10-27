Template.AcceptInvite.events
  'click .accept-invite': (e, t) ->
    Meteor.call 'acceptInvitation', Template.currentData(), (err, res) ->
      if res
        Router.go 'userProfile'
  'click .decline-invite': (e, t) ->
    Meteor.call 'declineInvitation', Template.currentData(), (err, res) ->
      if res
        Router.go 'userProfile'