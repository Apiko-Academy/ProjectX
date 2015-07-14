schema = new SimpleSchema
  emails:
    type: [Object]
    label: 'Emails'
  'emails.$.address':
    regEx: SimpleSchema.RegEx.Email
    type: String
  'emails.$.verified':
    type: Boolean
  profile:
    type: schemas.UserProfile
    label: 'Profile'
  createdAt:
    type: Date
    label: 'Created at'
  roles:
    type: [String]
    label: 'Roles'
    optional: true
    blackbox: true

Namespace 'schemas', User:schema
