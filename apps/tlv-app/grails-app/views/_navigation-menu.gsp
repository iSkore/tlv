<div class = "row">
	<nav class = "navbar navbar-default navbar-static-top" id = "navigationMenu">
		<div class = "container-fluid">
			<div class = "navbar-header">
				<a class = "navbar-brand" href = "${ grailsApplication.config.baseUrl }" style = "padding-top: 5px">
					<asset:image height = "40" src = "logos/tlv.png" title = "O2 Home"/>
				</a>

				<g:render template = "/menus/time-lapse-menu-controls"/>

				<button aria-expanded = "false" class = "navbar-toggle collapsed" data-target = "#navigationMenuList" data-toggle = "collapse" type = "button">
					<span class = "sr-only">Toggle navigation</span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
					<span class = "icon-bar"></span>
				</button>
			</div>

			<div class = "collapse navbar-collapse" id = "navigationMenuList">
				<ul class = "nav navbar-nav">
					<g:render template = "/menus/search-menu"/>
					<g:render template = "/menus/annotations-menu"/>
					<g:render template = "/menus/export-menu"/>
					<g:render template = "/menus/image-properties-menu"/>
					<g:render template = "/menus/layers-menu"/>
					<g:render template = "/menus/time-lapse-menu"/>
					<g:render template = "/menus/view-menu"/>
					<g:render template = "/isa-menu"/>
				</ul>
				<ul class = "nav navbar-nav navbar-right">
					<g:render template = "/user"/>
					<g:render template = "/menus/help-menu"/>
				</ul>
			</div>
		</div>
	</nav>
</div>
