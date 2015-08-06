schema = new SimpleSchema
  name:
    type: String
    label: 'Name'
    min: 2
    max: 32
  description:
    type: String
    label: 'Description'
    optional: true
    min: 6
    max: 140
  startDate:
    type: Date
    label: 'Start date'
    autoform:
      type: 'moment-datepicker'
  endDate:
    type: Date
    label: 'End date'
    autoform:
      type: 'moment-datepicker'
  dailyEstimate:
    type: Number
    label: 'Daily estimate'
    optional: true
    min: 1
    max: 24

Namespace 'schemas', Activity: schema
