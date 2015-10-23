Meteor.startup ->
  usersNum = Meteor.users.find().count()
  unless usersNum
    userId = Accounts.createUser
      username: 'admin'
      password: 'admin'
      email: 'admin@projectx.com'
      profile:
        fullname: 'Maxim Grischuk'
    Roles.addUsersToRoles userId, 'admin'
    Winston.info "Added new admin user: #{userId}"

  Accounts.onLogin (doc) ->
    email = doc.user.emails[0].address
    invite = Invitations.findOne({emails: email, isActive: true})
    if invite
      Meteor.users.update doc.user._id,
        $addToSet: 'profile.companies': invite.companyId