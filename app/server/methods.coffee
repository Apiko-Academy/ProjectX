Meteor.methods
  sendCompanyEmail: (doc) ->
    console.log 'doc => ', doc
    check doc, schemas.Invitation

