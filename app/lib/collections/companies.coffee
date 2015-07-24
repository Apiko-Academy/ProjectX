@Companies = new Mongo.Collection 'companies'

Companies.allow
  insert: -> true
  update: -> true
  remove: -> true

Companies.deny
  insert: (userId) ->
    not Meteor.userId()
  update: (userId) ->
    not Meteor.userId()
  remove: (userId) ->
    not Meteor.userId()

Companies.attachSchema schemas.Company
