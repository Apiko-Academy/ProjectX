@Invitations = new Mongo.Collection 'invitations'

Invitations.allow
  insert: -> true
  update: -> true
  remove: -> true

Invitations.attachSchema schemas.Invitation
