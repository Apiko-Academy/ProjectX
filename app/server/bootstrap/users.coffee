Meteor.startup ->
  console.log 'users.coffee'
  usersNum = Meteor.users.find().count()
  unless usersNum
    userId = Accounts.createUser
      username: 'admin'
      password: 'admin'
      email: 'admin@projectx.com'
      profile:
        fullname: 'Maxim Grischuk'
    Winston.info "Added new admin user: #{userId}"
    Roles.addUsersToRoles userId, 'admin'
