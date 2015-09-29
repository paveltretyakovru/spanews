define (require) ->
	'use strict'

	Marionette = require 'marionette'

	PostsCollectionView = Marionette.CollectionView.extend
		debug	: true

		initialize : ->
			console.log 'Init posts collection view' if @debug

	PostsCollectionView