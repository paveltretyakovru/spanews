define (require) ->
	'use strict'

	Marionette 		= require 'marionette'
	TemplateItem 	= require 'text!tmpls/post_item.tpl'
	PostTemplate 	= require 'text!tmpls/post_content.tpl'
	NoResultTpl		= require 'text!tmpls/no_search_result.tpl'

	Collection 	= Backbone.Collection.extend()
	Model 		= Backbone.Model.extend
		defaults	: 
			query	: 'путин'

	ItemView 	= Marionette.ItemView.extend
		template : TemplateItem ,

		ui			:
			'linksShowPost'	: '.show-post-content'			# Ссылка "Подробнее"

		events		:
			'click @ui.linksShowPost'	: 'showPostContent'	# Показать статью полностью

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
			@.on 'render' , @afterRender , @

			@fetchData()

		afterRender : ->
			$( document ).ajaxStart =>
				@.$el.html '<div class="loader">Loading...</div>'

		# Метод загружает данные из google
		fetchData : ->
			# Изобржение которое отображается при отсутсвии изображений в статье
			no_image_url = 'http://theslogsweep.com/wp-content/themes/mightymag/images/no_thumb.png'

			if not @model.get 'query'
				@model.set 'query' , ''
			else
				$.ajax
					url 	: 'https://ajax.googleapis.com/ajax/services/search/news'
					data 	: 
						v 	: '1.0' ,
						rsz	: 8
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
					$('.loader').remove()

					console.error @.$el.html NoResultTpl if Results.length == 0					

					@collection.reset data.responseData.results	


	PostsCollectionView