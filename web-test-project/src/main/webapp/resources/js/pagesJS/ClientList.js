$(document)
		.ready(
				function() {
					// function for product category table view.
					$('#createClientTable').dataTable();
					// validations for create product popup form.
					$('#createClientPopUpForm')
							.bootstrapValidator(
									{
										framework : 'bootstrap',
										feedbackIcons : {
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										fields : {
											clientName : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'Client name is required.'
													}
												}
											},
											email : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'E-Mail is required.'
													},

													emailAddress : {
														message : 'Please provide a valid e-mail.'
													}

												}

											},
											balance : {
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

											},
											mobile : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'Mobile number is required.'
													},
													stringLength : {
														min : 10,
														max : 10,
														message : 'Mobile number should consist exact 10 digits.'
													},
													regexp : {
														regexp : /^\d*$/,
														message : 'Please provide a valid mobile number.'
													}

												}

											},
											address : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'Address is required.'
													}

												}

											},
											pincode : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'Pincode is required.'
													},
													stringLength : {
														min : 6,
														max : 6,
														message : 'Pincode should consist exact 6 digits.'
													},
													regexp : {
														regexp : /^\d*$/,
														message : 'Please provide a valid pincode.'
													}

												}

											}
										}
									});
				});