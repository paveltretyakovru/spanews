define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	TemplateItem 	= require 'text!tmpls/post_item.tpl'
	PostTemplate 	= require 'text!tmpls/post_content.tpl'

	Collection 	= Backbone.Collection.extend()
	Model 		= Backbone.Model.extend
		defaults	: 
			query	: 'google'

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

			@model 		= new Model()
			@collection = new Collection()

			# Отслеживаем изменение параметра поиска
			@model.on 'change:query' , @fetchData , @			

			@fetchData()	

		fetchData : ->
			no_image_url = 'http://theslogsweep.com/wp-content/themes/mightymag/images/no_thumb.png'

			if not @model.get 'query'
				@model.set 'query' , ''
			else
				$.ajax
					url 	: 'https://ajax.googleapis.com/ajax/services/search/news'
					data 	: 
						v 	: '1.0'
						q	: @model.get 'query'
					dataType: 'jsonp'
				.done (data) =>
					Results = data.responseData.results
					console.log 'Data loaded' , Results if @debug

					# Предотвращаем js ошибку, если статья не содежит изображения
					for post in Results
						if not post.image
							post.image = {}
							post.image.url = no_image_url

					@collection.reset data.responseData.results	


	PostsCollectionView