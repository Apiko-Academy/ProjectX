Meteor.startup () ->
  process.env.MAIL_URL = Meteor.settings["mail_url"]

Meteor.methods
  sendCompanyEmail: (doc) ->
    console.log 'doc => ', doc
    check doc, schemas.Invitation
    doc.emails.forEach (item) =>
      invitationId = Invitations.insert
        companyId: doc.companyId
        message: doc.message or ""
        emails: [item]

      @unblock()

      Email.send
        to: item
        from: 'stepan_ua@i.ua'
        subject: 'Invitation to ' + doc.companyId
        text: "#{Meteor.absoluteUrl()}invite/#{invitationId}"

  invitationStatus: (id) ->
    check id, String
    Invitations.update id,
      $set: isActive: true