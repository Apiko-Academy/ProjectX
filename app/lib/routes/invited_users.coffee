Router.route "/invite/:companyId",
  name: 'inviteToCompany'
  layoutTemplate: 'Invitation'
  waitOn: () ->
    @subscribe ''