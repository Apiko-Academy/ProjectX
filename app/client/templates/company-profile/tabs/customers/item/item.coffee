Template.CompanyProfileCustomersTabItem.events
  'click [data-action="remove-customer"]': (e) ->
    e.preventDefault()
    customer = Template.currentData().customer
    company = Template.parentData().company
    Companies.update _id: company._id,
      $pull: customers: name: customer.name