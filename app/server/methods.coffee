Meteor.startup () ->
  process.env.MAIL_URL = Meteor.settings["mail_url"]
#  console.log 'UniUsers => ', UniUsers.find().fetch()

Meteor.methods
  sendCompanyEmail: (doc) ->
    console.log 'doc => ', doc
    check doc, schemas.Invitation
    doc.emails.forEach (item) ->
      invititationId = Invitations.insert
        companyId: doc.companyId
        companyName: doc.companyName
        message: doc.message
        emails: [item]

      @unblock()

      Email.send
        to: item
        from: 'stepan.te.ua@gmail.com'
        subject: 'Invitation to ' + doc.companyName
        text: "#{Meteor.absoluteUrl()}invite#{invititationId}/#{doc.companyId}"
  #      expirationDate
#    @unblock()
#
#    Email.send
#      to: doc.emails[0]
#      from: 'stepan.te.ua@gmail.com'
#      subject: 'Invitation to' + doc.companyName
#      text: "#{Meteor.absoluteUrl()}invite/#{doc.companyId}"