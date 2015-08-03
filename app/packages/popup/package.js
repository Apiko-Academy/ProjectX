Package.describe({
  name: 'jss:popup',
  version: '0.0.1',
  summary: '',
  git: 'https://github.com/JSSolutions/meteor-popup/',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use(['templating', 'jquery']);
  api.addFiles(['popup.html', 'popup.css', 'popup.js'], 'client');
});
