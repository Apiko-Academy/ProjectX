schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140
  photo:
    type: Mongo.ObjectID
    label: 'Photo'

Namespace 'schemas', UserProfile:schema
