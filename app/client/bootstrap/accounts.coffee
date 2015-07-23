AccountsTemplates.removeField 'password'
AccountsTemplates.addField
  _id: 'password'
  type: 'password'
  required: true
  minLength: 6


AccountsTemplates.addField
  _id: 'username'
  type: 'text'
  required: true
  minLength: 3
  maxLength: 32
  trim: true
  re: /^[\w]{3,32}$/
  errStr: 'Only symbols and digits allowed.'


AccountsTemplates.addField
  _id: 'fullname'
  type: 'text'
  displayName: 'Fullname'
  required: true
  minLength: 2
  maxLength: 140
  re: /^[\w\s]{2,140}$/
  errStr: 'Only symbols and digits allowed.'
