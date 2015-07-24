@Activity = new Mongo.Collection 'activity'

Activity.allow
  insert: -> true
  update: -> true
  remove: -> true

Activity.deny
  insert: (userId) ->
    not Meteor.userId()
  update: (userId) ->
    not Meteor.userId()
  remove: (userId) ->
    not Meteor.userId()

Activity.attachSchema schemas.Activity
