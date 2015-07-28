@Companies = new Mongo.Collection 'companies'

Companies.allow
  insert: -> true
  update: -> true
  remove: -> true

denyChecker = (userId) ->
  deny = not Meteor.userId()
  if deny
    Winston.warn '''
      Non-authorized user tries get access to the `Companies` collection'
    '''
  deny

Companies.deny
  insert: denyChecker
  update: denyChecker
  remove: denyChecker

Companies.attachSchema schemas.Company

Companies.after.insert (userId, doc) ->
  user = Meteor.users.findOne _id: userId
  if user
     Meteor.users.update userId, $push:
       'profile.companies': doc._id
