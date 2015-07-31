Template.UserProfile.events
  'click [data-action="remove-user"]': (e) ->
    e.preventDefault()
    Meteor.users.remove _id: Meteor.userId(), (err) ->
      if (err)
        sAlert.error err
        Winston.error err
      else
        Router.go 'home'

Template.UserProfile.helpers
  userEmail: () ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    user = Meteor.user()
    if Roles.userIsInRole user._id, 'admin'
      'Admin'
    else if user.profile.companies.length
      'Invited user'
    else
      'None'
  userInitials: () ->
    fullname = ''
    for word in Meteor.user().profile.fullname.split(' ')
      fullname += word[0].toUpperCase()
    fullname
