<div class="jumbotron">
	<div class="row">
		<div class="col-md-2 col-sm-3 text-center">
			<a class="story-title" href="#"><img alt="" src="<%= image.url %>" style="width:150px;height:140px" class="img-circle"></a>
		</div>
		<div class="col-md-10 col-sm-9">
			<h3><%= title %></h3>
			<%= content %>
			<div class="row">
				<div class="col-xs-9">					
					<h4>
						<span class="label label-default"><%= publisher  %></span></h4><h4>
						<small style="font-family:courier,'new courier';" class="text-muted"><%= publishedDate %>  • <a href="#" class="text-mute show-post-content">Читать  далее</a></small>
					</h4>
				</div>
				<div class="col-xs-3"></div>
			</div>
			<br><br>
		</div>
	</div>
</div>