Router.route '/companies/create',
  name: 'createCompany'
  controller: controllers.DefaultMenu


Router.route '/company/:_id/profile',
  name: 'companyProfile'
  waitOn: () ->
    @subscribe 'company', @params._id
  data: () ->
    company: Companies.findOne _id: @params._id
  controller: controllers.DefaultMenu