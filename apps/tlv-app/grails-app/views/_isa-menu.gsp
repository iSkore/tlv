<g:if test = "${ grailsApplication.config.isaUrl }">
	<li class = "navbar-button">
		<a href = "javascript:void(0)" onclick = exportToISA()>3DISA</a>
	</li>

	<asset:script type = "text/javascript">
	    function exportToISA() {
	        var form = document.createElement( "form" );
	        form.action = "${ grailsApplication.config.isaUrl }";
	        form.method = "post";
	        form.target = "_blank";
	        $( "body" ).append( form );

			var view = tlv.map.getView();

			var bbox = document.createElement( "input" );
			bbox.type = "hidden";
			bbox.name = "bbox";
			bbox.value = ol.proj.transformExtent( view.calculateExtent( tlv.map.getSize() ), "EPSG:3857", "EPSG:4326" );
			form.appendChild( bbox );

	        var filenames = document.createElement( "input" );
	        filenames.type = "hidden";
	        filenames.name = "filenames";
	        filenames.value = tlv.layers.map( function( layer ) { return layer.metadata.filename; } );
	        form.appendChild( filenames );

			var location = document.createElement( "input" );
			location.type = "hidden";
			location.name = "location";
			location.value = ol.proj.transform( view.getCenter(), "EPSG:3857", "EPSG:4326" ).reverse();
			form.appendChild( location );

	        form.submit();
	        form.remove();
	    }
	</asset:script>
</g:if>
