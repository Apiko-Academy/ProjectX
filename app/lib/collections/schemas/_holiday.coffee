schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 2
    max: 64
  startDate:
    type: Date
    label: 'Start date'
    autoform:
      type: 'bootstrap-datepicker'
  endDate:
    type: Date
    label: 'End date'
    autoform:
      type: 'bootstrap-datepicker'

Namespace 'schemas', Holiday: schema
