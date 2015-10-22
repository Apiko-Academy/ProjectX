Router.route '/companies/create',
  name: 'createCompany'
  layoutTemplate: 'Layout'


Router.route '/company/:_id/profile',
  name: 'companyProfile'
  layoutTemplate: 'Layout'
  waitOn: () ->
    @subscribe 'company', @params._id
  data: () ->
    console.log 'Companies => ', Companies.findOne()
    company: Companies.findOne()