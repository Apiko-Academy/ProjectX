Router.route "/invite/:invitationId",
  name: 'inviteToCompany'
  layoutTemplate: 'Invitation'
  waitOn: () ->
    Meteor.subscribe 'invitation', @params.invitationId
    Meteor.subscribe 'usersEmails', @params.invitationId
  action: () ->
    if Invitations.findOne()
      user = Meteor.userId()
      userEmail = Invitations.findOne().emails[0]
      checkUserByEmail = Meteor.users.findOne {emails: {$elemMatch: {address: userEmail}}}
      if user
        Router.go 'userProfile'
      if not user and checkUserByEmail
        console.log 'need to login!'
        Router.go 'atSignIn', {email: userEmail}
      else if not user and not checkUserByEmail
        console.log 'need to register!'
        Router.go 'atSignUp', {email: userEmail}