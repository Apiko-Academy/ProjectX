schema = new SimpleSchema
  companyId:
    type: String
  companyName:
    type: String
  message:
    type: String
    label: 'Message'
    optional: true
    min: 6
    max: 140
  emails:
    type: [String]
    label: 'Email'
    regEx: SimpleSchema.RegEx.Email
    minCount: 1
  expirationDate:
    type: Date
    label: 'Expiration date'
    optional: true
    autoValue: ->
      new Date()
    autoform:
      type: 'bootstrap-datepicker'

Namespace 'schemas', Invitation: schema
