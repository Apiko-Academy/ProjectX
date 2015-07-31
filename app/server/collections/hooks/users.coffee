Meteor.users.after.remove (userId, doc) ->
  companies = doc.profile.companies ? []
  _.each companies, (companyId) ->
    Companies.remove _id: companyId
