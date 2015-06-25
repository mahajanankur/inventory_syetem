$(document).ready(function() {
	// function for product category table view.
	$('#createCategory').dataTable();
	// validations for create product popup form.
	$('#createProductCategoryPopUpForm').bootstrapValidator({
		framework : 'bootstrap',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			pCatName : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'Product category name is required.'
					}
				}
			}
		}
	});

	// validations for update product category pop up form.
	$('#updateProductCategoryPopUpForm').bootstrapValidator({
		framework : 'bootstrap',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			catName : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'Product category name is required.'
					}
				}

			}
		}
	});

});
// Alert message when remove button is clicked.
function getAlertForRemove() {
	confirm("Are you really want to remove this!!");
};