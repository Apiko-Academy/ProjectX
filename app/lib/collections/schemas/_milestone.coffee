schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 2
    max: 32
  description:
    type: String
    optional: true
    label: 'Description'
    min: 6
    max: 140
  date:
    type: Date
    label: 'Date'

Namespace 'schemas', Milestone: schema
