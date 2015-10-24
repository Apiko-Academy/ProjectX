Router.route "/invite/:invitationId",
  name: 'inviteToCompany'
  layoutTemplate: 'Invitation'
  waitOn: () ->
    Meteor.subscribe 'invitation', @params.invitationId
    Meteor.subscribe 'usersEmails', @params.invitationId
  action: () ->
    invitation = Invitations.findOne _id: @params.invitationId
    unless invitation
      return
    Meteor.call 'invitationStatus', invitation._id, (err) ->
      if err
        # do something
      else
        user = Meteor.userId()
        if user
          Router.go 'userProfile'
        userEmail = invitation.emails[0]
        checkUserByEmail = Meteor.users.findOne
          emails:
            $elemMatch: address: userEmail
        if checkUserByEmail
          console.log 'need to login!'
          Router.go 'atSignIn', email: userEmail
        else
          console.log 'need to register!'
          Router.go 'atSignUp', email: userEmail