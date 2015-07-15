schema = new SimpleSchema
  name:
    type:String
    label: 'Name'
    min: 2
    max: 32
  position:
    type: String
    label: 'Position'
    optional: true
    min: 2
    max: 140
  workingHours:
    type: Number
    label: 'Working hours'
    min: 1
    max: 24
  holiday:
    type: [Date]
    label: 'Holiday'
    minCount: 0
    maxCount: 365

Namespace 'schemas', Resource: schema
