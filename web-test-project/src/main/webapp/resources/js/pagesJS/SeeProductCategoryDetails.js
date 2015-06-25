$(document).ready(function() {
	// function for product category table view.
	$('#subCategoryTable').dataTable();

	// cancel button value, used to ignore the bootstrap validation while Cancel
	// button is pressed.
	// var cancelPressed = $("#sub_cancel_id").val();
	// alert($("#sub_submit_id").click());

	// validations for remove product popup form.

	$('#createSubCategory').bootstrapValidator({
		framework : 'bootstrap',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			subCatName : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The sub product category name is required.'
					}
				}

			}
		}
	});

});
