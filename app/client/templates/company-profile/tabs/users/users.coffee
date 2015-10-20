AutoForm.hooks
  inviteByMail:
    onSuccess: () ->
      console.log 'onSuccess =>', arguments
    onError: () ->
      console.log 'onError =>', arguments


Template.CompanyProfileUsersTab.events
  'click .invite-user': (e, t) ->
    Modal.show 'InviteUsers',
      t.data.company

Template.InviteUsers.helpers
  companyInviteLink: () ->
#    companyInstance = Template.instance()
#    company = Companies.findOne companyInstance.data, fields: inviteToken: 1
#    Meteor.absoluteUrl "invite/#{company.inviteToken}"
  company: () ->
    companyInstance = Template.instance()

    companyId: companyInstance.data._id
    name: companyInstance.data.name

#Template.inviteByMail.helpers