@Activity = new Mongo.Collection 'activity'

Activity.allow
  insert: -> true
  update: -> true
  remove: -> true

Activity.attachSchema schemas.Activity
