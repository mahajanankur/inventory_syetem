$(document)
		.ready(
				function() {
					// function for product table view.
					$('#createProductTable').dataTable();

					// validations for create product form.
					$('#createProduct')
							.bootstrapValidator(
									{
										framework : 'bootstrap',
										feedbackIcons : {
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										fields : {
											productName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product name is required.'
													}
												}

											},
											brandName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product brand is required.'
													}
												}

											},
											priceName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product price is required.'
													},
													regexp : {
														regexp : /^\d*$/,
														message : 'The product price should be numeric only.'
													}

												}

											},
											quantity : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product quantity is required.'
													},
													regexp : {
														regexp : /^\d*$/,
														message : 'The product quantity should be numeric only.'
													}

												}

											},
											OffersName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product offer is required.'
													}
												}

											},
											photosName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product photos are required.'
													}
												}

											},
											specificationsName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The product specifications are required.'
													}
												}

											}
										}
									});

				});