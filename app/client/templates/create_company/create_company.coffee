AutoForm.addHooks 'insertCompanyForm',
  onSuccess: () ->
    Router.go 'home'
  onError: (action, error) ->
    Winston.warn """
      User '#{Meteor.userId()}'' got an error
      '#{error.message}' on `insertCompanyForm`
      form.
    """
    sAlert.error error.message
