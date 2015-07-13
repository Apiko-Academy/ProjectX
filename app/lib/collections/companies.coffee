@Companies = new Mongo.Collection 'companies'

@Companies.attachSchema schemas.Company
