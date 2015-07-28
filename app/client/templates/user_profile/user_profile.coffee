Template.UserProfile.helpers
  userEmail: () ->
    if Meteor.user()
      Meteor.user().emails[0].address
  userRole: () ->
    if Roles.userIsInRole Meteor.userId(), 'admin'
      'Owner'
    else if Roles.userIsInRole Meteor.userId(), 'invited'
      'Invited user'
    else
      'None'
  userInitials: () ->
    fullName = Meteor.user().profile.fullName
    [x[0].upper() for x in fullName.split(' ')].join('')
