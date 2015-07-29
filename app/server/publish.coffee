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
