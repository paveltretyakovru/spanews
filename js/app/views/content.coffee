define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	LayoutTemplate 	= require 'text!tmpls/content.tpl'
	PostsView		= require 'views/posts'	

	Marionette.LayoutView.extend
		debug 		: true
		template	: LayoutTemplate

		ui			: 
			'buttonShowPosts' 	: '.show-posts'

		events 		:
			'click @ui.buttonShowPosts' : 'showPosts'

		regions 	:
			regionPosts	: '#region-posts'		

		initialize 	: ->
			console.log 'Initialize content Layout' if @debug

			@on 'render' , @afterRender , this

		afterRender : ->
			@postsView = new PostsView()

			@regionPosts.show @postsView

			# Init page carousel
			$('#content').carousel interval : false

			# Отслеживаем ввод нового поискового запроса
			$('body').on 'keyup' , '#search-input' , => @changedInput()

		showPosts 	: (e) ->
			console.log 'Show posts button' if @debug

			$('#content').carousel 'prev'

		changedInput : ->
			console.log 'Новый поисковый запрос' , $('#search-input').val() if @debug			
			@postsView.model.set('query' , $('#search-input').val())
			$('#content').carousel 1