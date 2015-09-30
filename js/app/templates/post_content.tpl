<div class="jumbotron">
	<div class="row">
		<div class="col-md-12">
			<div class="icon-preview show-posts"><i class="mdi-navigation-arrow-back"></i></div>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
		<div class="thumbnail text-center">
			<img alt="" src="<%= image.url %>" style="width:100%">
			<div class="caption">
				<h2><%= title %></h2>
			</div>
		</div>		
    		<p><%= content %></p>

    		<p><a href="<%= unescapedUrl %>">Продолжение в источнике</a></p>
    		<p>Источник: <span class="label label-info"><%= publisher  %></span></p>
    		<h4>				
				<small style="font-family:courier,'new courier';" class="text-muted"><%= publishedDate %></small>
			</h4>
		</div>
	</div>
</div>