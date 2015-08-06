Package.describe({
  name: 'gildaspk:autoform-moment-datepicker',
  summary: 'Moment datepicker for AutoForm',
  version: '0.0.2',
  git: 'https://github.com/djhi/meteor-autoform-moment-datepicker.git'
});

Package.onUse(function(api) {
  api.use([
    'templating@1.0.0',
    'blaze@2.0.0',
    'aldeed:autoform@5.4.0',
    'gildaspk:moment-datepicker@0.0.3'
  ]);
  api.addFiles([
    'autoform-moment-datepicker.html',
    'autoform-moment-datepicker.js'
  ], 'client');
});
