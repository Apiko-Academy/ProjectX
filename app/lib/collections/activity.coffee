@Activity = new Mongo.Collection 'activity'

Activity.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      Non-authorized user tries get access to the `Activity` collection'
    '''
  deny

Activity.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Activity.attachSchema schemas.Activity
