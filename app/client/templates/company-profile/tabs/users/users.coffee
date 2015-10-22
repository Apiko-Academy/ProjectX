AutoForm.hooks
  inviteByMail:
    formType: () ->
      console.log 'formType => ', arguments
    onSuccess: () ->
      console.log 'onSuccess =>', arguments
    onError: () ->
      console.log 'onError =>', arguments


Template.CompanyProfileUsersTab.events
  'click .invite-user': (e, t) ->
    Modal.show 'InviteUsers',
      t.data.company

Template.InviteUsers.helpers
  company: () ->
    companyInstance = Template.instance()

    companyId: companyInstance.data._id