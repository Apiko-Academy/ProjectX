Package.describe({
  name: 'jss:bootstrap-vertical-tabs',
  version: '0.0.1',
  summary: '',
  git: 'https://github.com/JSSolutions/meteor-bootstrap-vertical-tabs/',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.3');
  api.addFiles('bootstrap-vertical-tabs.css', 'client');
});
