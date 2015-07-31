Template.UserProfile.events
  'click [data-action="remove-user"]': (e) ->
    e.preventDefault()
    Meteor.users.remove _id: Meteor.userId(), (err) ->
      if (err)
        sAlert.error err.message
        Winston.error err.message
      else
        Router.go 'home'

Template.UserProfile.helpers
  userEmail: () ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userInitials: () ->
    fullname = ''
    for word in Meteor.user().profile.fullname.split(' ')
      fullname += word[0].toUpperCase()
    fullname
