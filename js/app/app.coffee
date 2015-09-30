###*
 * Главный скрипт приложения
 * @author Pavel Tretyakov 1@tretyakovpavel.ru	
###
define (require) ->
	'use strict'

	Marionette 	= require 'marionette'
	ContentView = require 'views/content'

	app = new Marionette.Application
		debug 	: true
		
		regions :
			regionContainer : '#content'

		initialize : ->
			console.log 'Initialize marionette application' if @debug

		# Начальный метод
		preload : ->
			console.log 'Completing preload function' if @debug
			@regionContainer.show new ContentView()			

	app.addInitializer (options) -> @preload()

	Marionette.Renderer.render = (template, data) ->
        tmpl = _.template template
        tmpl data

	app