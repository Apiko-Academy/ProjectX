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
    type: [schemas.Holiday]
    label: 'Holiday'
    defaultValue: []
    minCount: 0
    maxCount: 2**16

Namespace 'schemas', Resource: schema
