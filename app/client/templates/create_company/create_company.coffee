AutoForm.addHooks 'insertCompanyForm',
  onSuccess: () ->
    Router.go 'home'
