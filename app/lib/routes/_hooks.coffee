Router.onBeforeAction () ->
  if Meteor.userId()
    @next()
  else
    Router.goToAccessForbidden()
,
  only: [
    'createCompany',
    'userProfile',
    'companyProfile'
  ]


Router.onAfterAction () ->
  @render 'DefaultMenu', to: 'layoutMenu'
,
  only: [
    'createCompany',
    'userProfile',
    'companyProfile'
  ]