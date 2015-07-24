schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140
  photo:
    type: Mongo.ObjectID
    label: 'Photo'
    optional: true
  companies:
    type: [String]
    label: 'Companies'
    defaultValue: []
  'companies.$':
    regEx: SimpleSchema.RegEx.Id

Namespace 'schemas', UserProfile: schema
