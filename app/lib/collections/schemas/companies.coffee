schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 1
    max: 32
  holidays:
    type: [Object]
    label: 'Holidays'
    minCount: 0
    maxCount: 365


Namespace 'schemas', Company:schema
