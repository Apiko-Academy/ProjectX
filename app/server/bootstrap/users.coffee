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
