usersNum = Meteor.users.find().count()
unless usersNum
  Accounts.createUser
    username: 'admin'
    password: 'admin'
    email: 'admin@projectx.com'
    profile:
      fullname: 'Maxim Grischuk'
  console.log 'Added new admin user.'
