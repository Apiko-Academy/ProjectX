Template.CompanyProfileCustomersTab.helpers
  customersInfo: () ->
    customersList = Template.currentData().company.customers
    _.map customersList, (customer, index) ->
      index: index + 1
      customer: customer
      fieldName: "customers.#{index}.name"
      formId: "updateCompanyCustomerName#{index}"
