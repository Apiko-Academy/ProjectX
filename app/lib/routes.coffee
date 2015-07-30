Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'


AccountsTemplates.configureRoute 'signIn',
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
  layoutTemplate: 'Layout'
  redirect: () ->
    Router.go 'createCompany'


AccountsTemplates.configureRoute 'resetPwd',
  layoutTemplate: 'Layout'


Router._scrollToHash = (hash) ->
  hash = 'body' unless hash.length
  $section = $ hash
  if $section.length
    $('html, body').animate
      scrollTop: $section.offset().top
    ,
      'slow'


Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'HomeMenu', to: 'layoutMenu'
    @render 'Home'


Router.route '/user/profile',
  name: 'userProfile'
  waitOn: () ->
    Meteor.subscribe 'fullUserProfile'
  layoutTemplate: 'Layout'


Router.route '/access-forbidden',
  name: 'accessForbidden'


Router.goToAccessForbidden = () ->
  url = Iron.Location.get().path
  Winston.warn "Request to forbidden URL \"#{url}\""
  Router.go 'accessForbidden'


Router.route '/companies/create',
  name: 'createCompany'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'CreateCompanyMenu', to: 'layoutMenu'
    @render 'CreateCompany'


Router.onBeforeAction () ->
  if Meteor.userId()
    @next()
  else
    Router.goToAccessForbidden()
,
  only: ['createCompany', 'userProfile']
