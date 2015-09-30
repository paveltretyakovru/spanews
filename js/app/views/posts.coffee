define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	TemplateItem 	= require 'text!tmpls/post_item.tpl'
	PostTemplate 	= require 'text!tmpls/post_content.tpl'

	Collection 	= Backbone.Collection.extend()

	ItemView 	= Marionette.ItemView.extend
		template : TemplateItem ,

		ui			:
			'linksShowPost'	: '.show-post-content'

		events		:
			'click @ui.linksShowPost'	: 'showPostContent'

		showPostContent 	: (e) ->			
			$('#region-text').html( _.template( PostTemplate )( @model.toJSON() ) );

			$('#content').carousel 'next'

			e.preventDefault()

	PostsCollectionView = Marionette.CollectionView.extend
		debug		: true
		childView	: ItemView

		initialize : ->
			console.log 'Init posts collection view' if @debug

			# https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=путин

			$.ajax
				url 	: 'https://ajax.googleapis.com/ajax/services/search/news?v=1.0&q=путин'
				dataType: 'jsonp'
			.done (data) =>
				console.log 'Data loaded' , data.responseData.results if @debug
				@collection.reset data.responseData.results

			@collection = new Collection()

	PostsCollectionView