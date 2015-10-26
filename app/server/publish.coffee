Meteor.publishComposite 'fullUserProfile',
  find: () ->
    Meteor.users.find _id: @userId
  children: [
    find: (user) ->
      companies = _.map user.profile.companies, (company) ->
        company._id
      Companies.find _id:
        $in: companies
  ]

Meteor.publish 'company', (companyId) ->
  Companies.find _id: companyId, owner: @userId

Meteor.publish 'invitation', (invitationId) ->
  Invitations.find _id: invitationId

Meteor.publish 'usersEmails', (invitationId) ->
  invitation = Invitations.findOne
    _id: invitationId
  if invitation
    email = invitation.emails[0]
    Meteor.users.find
      emails:
        $elemMatch: address: email
    ,
      fields: emails: 1
  else
    @stop()