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
      # TODO #4: It would be good make it in a bit more asynchronous way ;)
      # TODO #4: We could add callback into the insert function.
      # TODO #4: In this callback we should send email if there wasn't errors.
      invitationId = Invitations.insert
        companyId: doc.companyId
        message: doc.message or ""
        emails: [item]
      Email.send
        to: item
        # TODO #3: Make this option configurable as well.
        from: 'stepan_ua@i.ua'
        subject: 'Invitation to ' + doc.companyId
        text: "#{Meteor.absoluteUrl()}invite/#{invitationId}"

  invitationStatus: (id) ->
    check id, String
    # TODO #5: Pls check if user has enough rights to activate this invitation.
    Invitations.update id,
      $set: isActive: true
    # TODO #6: Don't forget to deactivate all other invitations of this user.