define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	LayoutTemplate 	= require 'text!tmpls/content.tpl'
	PostsView		= require 'views/posts'	

	Marionette.LayoutView.extend
		debug 		: true
		template	: LayoutTemplate

		ui			: 
			'buttonShowPosts' : '.show-posts'

		events 		:
			'click @ui.buttonShowPosts' : 'showPosts'

		regions 	:
			regionPosts	: '#region-posts'		

		initialize 	: ->
			console.log 'Initialize content Layout' if @debug

			@on 'render' , @afterRender , this

		afterRender : ->
			@regionPosts.show new PostsView()

			# Init page carousel
			$('#content').carousel interval : false

		showPosts 	: (e) ->
			console.log 'Show posts button' if @debug

			$('#content').carousel 'prev'
