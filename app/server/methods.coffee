# TODO #1: Add MAIL_URL to the settings.json file.
#
# TODO #2: Let's initialize this global variable in some other place.
# TODO #2: This file is only for server-side methods.
Meteor.startup () ->
  process.env.MAIL_URL = Meteor.settings["mail_url"]

Meteor.methods
  sendCompanyEmail: (doc) ->
    check doc, schemas.Invitation
    @unblock()
    doc.emails.forEach (item) =>
      Invitations.insert {
          companyId: doc.companyId
          message: doc.message or ""
          emails: [item]
        }, (err, res) ->
              if err
                console.log err
              else
                Email.send
                  to: item
                # TODO #3: Make this option configurable as well.
                  from: 'invitations@project-x.com'
                  subject: 'Invitation to ' + doc.companyId
                  text: """You were invited to company (there is will be company name in future)\n
                        Please follow this link #{Meteor.absoluteUrl()}invite/#{res} to accept invitation.\n
                        If you don't want to accept this invitation, just ignore it!.\n
                        Please, do not reply on this message!"""

  invitationStatus: (id) ->
    check id, String
    # TODO #5: Pls check if user has enough rights to activate this invitation.
    Invitations.update id,
      $set: isActive: true
    # TODO #6: Don't forget to deactivate all other invitations of this user.

  acceptInvitation: (invitationData) ->
    check invitationData.invitationId, String
    check invitationData.userEmail, String
    invite = Invitations.findOne
      emails: invitationData.userEmail
      isActive: true
    if invite
      user = Meteor.users.findOne
        emails:
          $elemMatch: address: invitationData.userEmail
      Meteor.users.update user._id,
        {$addToSet: 'profile.companies': invite.companyId},
        (err, res) ->
          console.log err if err
          if res
            Invitations.remove invitationData.invitationId

  declineInvitation: (invitationData) ->
    console.log invitationData
    check invitationData.invitationId, String
    check invitationData.userEmail, String
    email = Meteor.users.findOne
      emails:
        $elemMatch: address: invitationData.userEmail
    if email
      Invitations.remove invitationData.invitationId