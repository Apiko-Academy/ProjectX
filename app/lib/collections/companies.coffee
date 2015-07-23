@Companies = new Mongo.Collection 'companies'

Companies.allow
  insert: -> true
  update: -> true
  remove: -> true

Companies.attachSchema schemas.Company
