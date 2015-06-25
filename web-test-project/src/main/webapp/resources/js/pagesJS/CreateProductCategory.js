$(document)
		.ready(
				function() {
					// function for product category table view.
					$('#createCategory').dataTable();
					// validations for create product popup form.
					$('#createProductCategoryPopUpForm')
							.bootstrapValidator(
									{
										framework : 'bootstrap',
										icon : {
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										fields : {
											pCatName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product category name is required.'
													}
												}
											}
										}
									});

					// validations for remove product popup form.
					$('#removeProductCategoryPopUpForm')
							.bootstrapValidator(
									{
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

					// validations for see product details popup form.
					$('#seeProductCategoryDetailsPopUpForm')
							.bootstrapValidator(
									{
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
// Alert message when remove button is clicked.
function getAlertForRemove() {
	confirm("Are you really want to remove this!!");
};