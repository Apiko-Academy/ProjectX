schema = new SimpleSchema
  message:
    type: String
    label: 'Message'
    min: 6
    max: 140
  email:
    type: String
    label: 'Email'
    regEx: SimpleSchema.RegEx.Email
  expirationDate:
    type: Date
    label: 'Expiration date'

Namespace 'schemas', Invitation: schema
