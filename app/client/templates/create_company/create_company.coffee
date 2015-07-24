AutoForm.addHooks 'insertCompanyForm',
  onSuccess: () ->
    Router.go 'home'
  onError: (action, error) ->
    sAlert.error error.message
