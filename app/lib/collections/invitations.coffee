@Invitations = new Mongo.Collection 'invitations'

Invitations.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      Non-authorized user tries get access to the `Invitations` collection'
    '''
  deny

Invitations.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Invitations.attachSchema schemas.Invitation
