Package.describe({
  name: "gildaspk:moment-datepicker",
  summary: "Moment Datepicker packaged for Meteor. See https://github.com/MakingSense/moment-datepicker",
  version: "0.0.3",
  git: "https://github.com/djhi/meteor-moment-datepicker.git"
});

Package.onUse(function(api) {
  api.use('jquery', 'client');
  api.use('momentjs:moment@2.10.6');

  api.addFiles([
    'moment-datepicker/moment-datepicker.js',
    'moment-datepicker/datepicker.css'
  ], 'client');
});
