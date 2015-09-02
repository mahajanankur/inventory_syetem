$(document)
		.ready(
				function() {
					// function for stock table.
					$('#stockTable').dataTable();

					// News ticker function for stockList.
					$(".stockNewsTicker").bootstrapNews({
						newsPerPage : 1,
						autoplay : true,
						pauseOnHover : true,
						navigation : false,
						direction : 'down',
						newsTickerInterval : 2500,
						onToDo : function() {
							// console.log(this);
						}
					});

					// validations for create stock popup form.
					$('#createStockPopUpForm')
							.bootstrapValidator(
									{
										framework : 'bootstrap',
										feedbackIcons : {
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										fields : {
											vendor : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The vendor is required and can\'t be empty.'
													}
												}
											},
											stockname : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The stock name is required and can\'t be empty.'
													}
												}
											},
											quantity : {
												row : '.col-xs-4',
												validators : {
													notEmpty : {
														message : 'The quantity is required and can\'t be empty.'
													},
													regexp : {
														regexp : /^\d*$/,
														message : 'The quantity should be numeric only.'
													}
												}
											}
										}
									});

				});
