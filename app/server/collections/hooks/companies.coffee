Companies.after.insert (userId, doc) ->
  user = Meteor.users.findOne _id: userId
  if user
    Meteor.users.update userId, $push:
      'profile.companies': doc._id


Companies.after.remove (userId, doc) ->
  user = Meteor.users.findOne _id: userId
  if user
    Meteor.users.update userId, $pull:
      'profile.companies': doc._id
