schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 2
    max: 64
  startDate:
    type: Date
    label: 'Start date'
  endDate:
    type: Date
    label: 'End date'

Namespace 'schemas', Holiday: schema
