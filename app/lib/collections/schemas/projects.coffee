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
  milestones:
    type: [schemas.Milestone]
    label: 'Milestones'
    minCount: 0
    maxCount: 256

Namespace 'schemas', Projects:schema
