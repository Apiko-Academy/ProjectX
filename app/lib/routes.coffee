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


Router.route '/companies/new',
  name: 'createCompany'
  layoutTemplate: 'Layout'
