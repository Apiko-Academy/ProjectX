schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 1
    max: 32
  holidays:
    type: [schemas.Holiday]
    label: 'Holidays'
    defaultValue: []
    minCount: 0
    maxCount: 2**16
  projects:
    type: [schemas.Project]
    label: 'Projects'
    defaultValue: []
    minCount: 0
    maxCount: 2**16
  owner:
    type: String
    regEx: SimpleSchema.RegEx.Id
    label: 'Owner'
    denyUpdate: true
    autoform:
      type: 'hidden'
    autoValue: () ->
      @userId if @isInsert
  resources:
    type: [schemas.Resource]
    label: 'Resources'
    defaultValue: []
    minCount: 0
    maxCount: 2**16
  customers:
    type: [schemas.Customer]
    label: 'Customers'
    defaultValue: []
    minCount: 0
    maxCount: 2**16
  userRole:
    type: [Object]
    label: 'Role'
    autoform:
      type: 'hidden'
    defaultValue: []
    optional: true
    blackbox: true


Namespace 'schemas', Company:schema
