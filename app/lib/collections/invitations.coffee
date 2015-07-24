@Invitations = new Mongo.Collection 'invitations'

Invitations.allow
  insert: -> true
  update: -> true
  remove: -> true

Invitations.deny
  insert: (userId) ->
    not Meteor.userId()
  update: (userId) ->
    not Meteor.userId()
  remove: (userId) ->
    not Meteor.userId()

Invitations.attachSchema schemas.Invitation
