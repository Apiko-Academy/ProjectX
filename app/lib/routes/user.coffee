AccountsTemplates.configureRoute 'signIn',
  path: '/sign-in/:email?'
  data: () ->
    email: @params.email
  layoutTemplate: 'Layout'
  redirect: () ->
    user = Meteor.user()
    unless user
      return
    if user.profile.companies.length
      Router.go 'userProfile'
    else
      Router.go 'createCompany'


AccountsTemplates.configureRoute 'signUp',
  path: '/sign-up/:email?'
  data: () ->
    email: @params.email
  layoutTemplate: 'Layout'
  redirect: () ->
    Router.go 'createCompany'


AccountsTemplates.configureRoute 'resetPwd',
  layoutTemplate: 'Layout'


Router.route '/user/profile',
  name: 'userProfile'
  waitOn: () ->
    Meteor.subscribe 'fullUserProfile'
  layoutTemplate: 'Layout'