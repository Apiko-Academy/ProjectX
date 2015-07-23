schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 1
    max: 32
  holidays:
    type: [Object]
    label: 'Holidays'
    defaultValue: []
    minCount: 0
    maxCount: 365
  projects:
    type: [schemas.Project]
    label: 'Projects'
    defaultValue: []
    min: 0
    max: 2 ** 32
  customers:
    type: [schemas.Customer]
    label: 'Customers'
    defaultValue: []
    min: 0
    max: 2 ** 16


Namespace 'schemas', Company:schema
