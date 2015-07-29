Meteor.users.attachSchema schemas.User

Meteor.users._transform = (user) ->
  if _.isObject user.profile
    companies = _.map user.profile.companies, (companyId) ->
      company = Companies.findOne _id: companyId
      company.isOwner = user._id is company.owner
      company
    user.profile.companies = companies
  user
