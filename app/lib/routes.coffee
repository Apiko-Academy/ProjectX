Router.configure
  layoutTemplate: 'SimpleLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'


AccountsTemplates.configureRoute 'signIn',
  layoutTemplate: 'Layout'
AccountsTemplates.configureRoute 'signUp',
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
  only: ['createCompany']
