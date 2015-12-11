$(document).ready(function() {
	// function for product category table view.
	$('#myTable').dataTable();

	// validations for remove product popup form.
	$('#removeProductCategoryPopUpForm').bootstrapValidator({
		framework : 'bootstrap',
		icon : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			pCatId_name : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The product category ID is required.'
					},
					regexp : {
						regexp : /^\d*$/,
						message : 'The product category ID should be integer only.'
					}

				}

			}
		}
	});

});