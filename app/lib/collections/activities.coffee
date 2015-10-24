@Activities = new Mongo.Collection 'activities'

Activities.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not userId
  if deny
    Winston.warn '''
      Non-authorized user tries get access to the `Activities` collection'
    '''
  deny

Activities.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Activities.attachSchema schemas.Activity
