schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140
  photo:
    type: String
    regEx: SimpleSchema.RegEx.Id
    label: 'Photo'
    optional: true
  companies:
    type: [String]
    label: 'Companies'
    defaultValue: []
    minCount: 0
    maxCount: 2**16
  'companies.$':
    regEx: SimpleSchema.RegEx.Id

Namespace 'schemas', UserProfile: schema
