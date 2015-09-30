define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	LayoutTemplate 	= require 'text!tmpls/content.tpl'
	PostsView		= require 'views/posts'

	ContentModel	= Backbone.Model.extend()

	TextView		= Marionette.ItemView.extend
		template : 'text view template'



	Marionette.LayoutView.extend
		debug 		: true
		template	: LayoutTemplate

		regions 	:
			regionText 	: '#region-text'
			regionPosts	: '#region-posts'

		initialize 	: ->
			console.log 'Initialize content Layout' if @debug

			@model = new ContentModel()
			@model.set 'test' , 'Google test'

			@on 'render' , @afterRender , this

		afterRender : ->
			@regionText.show  new TextView()
			@regionPosts.show new PostsView()