<div class = "modal" id = "annotationsDialog" role = "dialog" tabindex = "-1">
	<div class = "modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header"><h4>Annotation Style</h4></div>
			<div class = "modal-body">
				<div class = "form-group">
					<label>Type</label>
					<input class = "typeahead form-control" id = "typeInput" placeholder = "Start Typing..." type = "text">
					<asset:script type = "text/javascript">
						$( "#typeInput" ).on( "input", function () {
							var inputElement = $( "#typeInput" );
							setTimeout( function() {
								inputElement.typeahead( "destroy" );

								var types = "${ grailsApplication.config.annotations.types.collect { it.key }.join( "," ) }".split( "," );
								var source = types.filter( function( type ) {
									return type.contains( inputElement.val() );
								});
								inputElement.typeahead( null, {
									display: function( suggestion ) {
										inputElement.focus();
										return suggestion;
									},
									source: function( query, sync ) {
										inputElement.focus();
										return sync( source );
									}
								});
								inputElement.focus();
							}, 10);
						});
					</asset:script>

					<label>Ontology</label>
					<input class = "form-control" id = "ontologyInput" type = "number">

					<label>User</label>
					<input class = "typeahead form-control" id = "userInput" placeholder = "Start Typing..." type = "text">
					<asset:script type = "text/javascript">
						//$( document ).ready( function() {
							var pageLoadAnnoationUser = pageLoad;
							pageLoad = function() {
								pageLoadAnnoationUser();

								var inputElement = $( "#userInput" );
								$.ajax({
									data: "property=user",
									url: tlv.contextPath + "/annotation/getDistinctValues"
								})
								.always( function() {
									inputElement.typeahead( "destroy" );
								})
								.done( function( data ) {
									var source = data;
									inputElement.typeahead( null, {
										display: function( suggestion ) {
											inputElement.focus();
											return suggestion;
										},
										source: function( query, sync ) {
											inputElement.focus();
											return sync( source );
										}
									});
									//inputElement.focus();
								})
								.fail( function() {
								});
							}
						//});
					</asset:script>


					<label>Confidence</label>
					<select class = "form-control" id = "confidenceSelect">
						<g:each in = "${[ "High", "Medium", "Low" ]}">
							<option value = "${ it.toLowerCase() }">${ it }</option>
						</g:each>
					</select>

					<hr>

					<label>Fill Color</label>
					<input class = "form-control" id = "fillColorInput" type = "color">

					<label>Fill Transparency</label>
					<input class = "form-control" id = "fillTransparencyInput" max = "1" min = "0" step = "0.1" type = "number">

					<label>Radius</label>
					<input class = "form-control" id = "radiusInput" min = "0" type = "number">

					<label>Stroke Color</label>
					<input class = "form-control" id = "strokeColorInput" type = "color">

					<label>Stroke Transparency</label>
					<input class = "form-control" id = "strokeTransparencyInput" max = "1" min = "0" step = "0.1" type = "number">

					<label>Stroke Width</label>
					<input class = "form-control" id = "strokeWidthInput" max = "100" min = "1" step = "1" type = "number">
				</div>
			</div>
			<div class = "modal-footer">
				<button type = "button" class = "btn btn-primary" data-dismiss = "modal" onclick = applyAnnotationStyle()>Apply</button>
				<button type = "button" class = "btn btn-primary" data-dismiss = "modal" onclick = deleteFeature()>Delete</button>
                <button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
            </div>
		</div>
	</div>
</div>

<asset:script type = "text/javascript">
	$( "#annotationsDialog" ).on( "hidden.bs.modal", function (event) {
		hideDialog( "annotationsDialog" );
		removeInteractions();
	});
	$( "#annotationsDialog" ).on( "shown.bs.modal", function (event) { displayDialog( "annotationsDialog" ); } );
</asset:script>
