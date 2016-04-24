/*jshint node:true*/
/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    'ember-power-select': {
      theme: 'bootstrap'
    },
    minifyJS: {
      enabled: EmberApp.env() === 'production'
    },
    minifyCSS: {
      enabled: EmberApp.env() === 'production'
    },
    sassOptions: {
      extension: 'sass'
    }
    // Add options here
  });

  // Adding fonts

  app.import('vendor/fonts/fontawesome-webfont.eot',{
    destDir: 'assets'
  });
  app.import('vendor/fonts/fontawesome-webfont.svg',{
    destDir: 'assets'
  });
  app.import('vendor/fonts/fontawesome-webfont.ttf',{
    destDir: 'assets'
  });
  app.import('vendor/fonts/fontawesome-webfont.woff',{
    destDir: 'assets'
  });
  app.import('vendor/fonts/fontawesome-webfont.woff2',{
    destDir: 'assets'
  });

  // Manually added libraries
  app.import('vendor/javascripts/plugins/bootstrap/bootstrap.js');
  app.import('vendor/javascripts/plugins/metisMenu/jquery.metisMenu.js');
  app.import('vendor/javascripts/plugins/pace/pace.min.js');
  app.import('vendor/javascripts/plugins/slimscroll/jquery.slimscroll.js');

  // Manually added initializer
  app.import('vendor/javascripts/inspinia.js');
  // Use `app.import` to add additional libraries to the generated
  // output files.
  //
  // If you need to use different assets in different
  // environments, specify an object as the first parameter. That
  // object's keys should be the environment name and the values
  // should be the asset to use in that environment.
  //
  // If the library that you are including contains AMD or ES6
  // modules that you would like to import into your application
  // please specify an object with the list of modules as keys
  // along with the exports of each module as its value.

  return app.toTree();
};
