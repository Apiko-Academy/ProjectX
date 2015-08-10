Package.describe({
  name: 'jss:popup-coffee',
  version: '0.0.2',
  summary: 'Popup window.',
  git: 'https://github.com/JSSolutions/meteor-popup/',
  documentation: 'README.md'
});


Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use([
    'coffeescript',
    'less',
    'templating',
    'jquery',
    'underscore',
    'fortawesome:fontawesome',
    'peerlibrary:blaze-components'
  ], 'client');
  api.addFiles([
    'popup/abs/popup.coffee',
    'popup/toggle/toggle.html',
    'popup/toggle/toggle.coffee',
    'popup/window/window.html',
    'popup/window/window.less',
    'popup/window/window.coffee'
  ], 'client');
});
