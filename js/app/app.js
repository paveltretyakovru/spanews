// Generated by CoffeeScript 1.10.0

/**
 * Главный скрипт приложения
 * @author Pavel Tretyakov 1@tretyakovpavel.ru
 */
define(function(require) {
  'use strict';
  var ContentView, Marionette, app;
  Marionette = require('marionette');
  ContentView = require('views/content');
  app = new Marionette.Application({
    debug: true,
    regions: {
      regionContainer: '#content'
    },
    initialize: function() {
      if (this.debug) {
        return console.log('Initialize marionette application');
      }
    },
    preload: function() {
      if (this.debug) {
        console.log('Completing preload function');
      }
      this.regionContainer.show(new ContentView());
      return $.ajax({
        url: 'https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=путин',
        dataType: 'jsonp'
      }).done((function(_this) {
        return function(data) {
          if (_this.debug) {
            return console.log('Data loaded', data);
          }
        };
      })(this));
    }
  });
  app.addInitializer(function(options) {
    return this.preload();
  });
  Marionette.Renderer.render = function(template, data) {
    var tmpl;
    tmpl = _.template(template);
    return tmpl(data);
  };
  return app;
});
