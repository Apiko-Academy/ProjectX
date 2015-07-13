@Invitations = new Mongo.Collection 'invitations'

Invitations.attachSchema schemas.Invitation
