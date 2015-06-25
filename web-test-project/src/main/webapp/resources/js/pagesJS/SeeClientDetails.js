$(document).ready(function() {
	// function for product category table view.
	$('#myTable').dataTable();

	// validations for remove product popup form.
	$('#addBalanceForm').bootstrapValidator({
		framework : 'bootstrap',
		icon : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			aBalance : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'Balance is required.'
					},
					regexp : {
						regexp : /^[1-9]\d*(\.\d+)?$/,
						message : 'Please provide numeric value for balance.'
					}
				}
			}
		}
	});

});