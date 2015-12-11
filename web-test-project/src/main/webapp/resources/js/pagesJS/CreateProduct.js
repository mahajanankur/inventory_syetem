$(document).ready(function() {
	// function for product table view.
	$('#createProductTable').dataTable();

	// validations for create product form.
	$('#createProduct').bootstrapValidator({
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
			costPrice : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The cost price is required.'
					},
					regexp : {
						regexp : /^\d*$/,
						message : 'The cost price should be numeric only.'
					}

				}

			},
			salePrice : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The sale price is required.'
					},
					regexp : {
						regexp : /^\d*$/,
						message : 'The sale price should be numeric only.'
					}

				}

			},
			profitPerc : {
				row : '.col-xs-4',
				validators : {
					regexp : {
						regexp : /^\d{1,2}(?:\.\d{1,5})?$/,
						message : 'The % should be less than 100.'
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

	// sale price calculation by percentage once the calculate
	// button is pressed.
	$('#pCalc').click(function() {
		var costPrice = parseFloat($('#costPrice').val());
		var pPerc = parseFloat($('#profitPerc').val()) / 100;
		var calcSale = costPrice + (costPrice * pPerc);
		$('#salePrice').val(calcSale);
	});
});