schema = new SimpleSchema
  fullname:
    type: String
    label: 'Full name'
    min: 2
    max: 140

Namespace 'schemas', UserProfile:schema
