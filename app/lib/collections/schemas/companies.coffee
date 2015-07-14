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
  projects:
    type: [schemas.Project]
    label: 'Projects'
    min: 0
    max: 2 ** 32


Namespace 'schemas', Company:schema
