$(document)
		.ready(
				function() {
					// function for seeProductBatchTable table view.
					$('#seeProductBatchTable').dataTable();

					// function for createProductBatchTable table view.
					var t = $('#createProductBatchTable').DataTable();

					// on loading the page add row button should be disabled.
					$('#addRow').attr('disabled', true);

					// date pickers
					$('#manufacture').datepicker({
						numberOfMonths : 1,
						// dateFormat : 'dd/mm/yy',
						changeMonth : true,
						changeYear : true,
						maxDate : -1,
						onSelect : function(selected) {
							var dt = new Date(selected);
							dt.setDate(dt.getDate() + 1);
							$("#expiry").datepicker("option", "minDate", dt);
						}
					});
					$('#expiry').datepicker(
							{
								numberOfMonths : 1,
								// dateFormat : 'dd/mm/yy',
								changeMonth : true,
								changeYear : true,
								onSelect : function(selected) {
									var dt = new Date(selected);
									dt.setDate(dt.getDate() - 1);
									$("#manufacture").datepicker("option",
											"maxDate", dt);
								}
							});

					// this method calls when the field's focus changes, it is
					// used to
					// enable or
					// disable the addRow button according to fields values.
					$("#status, #manufacture, #expiry").bind(
							'keyup change',
							function() {
								var status = $('#status').val();
								var manufacture = $('#manufacture').val();
								var expiry = $('#expiry').val();
								if (status == "" || manufacture == ""
										|| expiry == "") {
									$('#addRow').attr('disabled', true);
								} else {
									$('#addRow').attr('disabled', false);
								}
							});

					// Add row function
					$('#addRow').on('click', function() {
						var status = $('#status').val();
						var manufacture = $('#manufacture').val();
						var expiry = $('#expiry').val();
						t.row.add([ manufacture, expiry, status ]).draw();
						// To reset the form fields.
						$('#createProductBatchForm')[0].reset();
					});

					// Select multiple row function
					$('#createProductBatchTable tbody').on('click', 'tr',
							function() {
								// For Multiple row selection --
								$(this).toggleClass('selected');
							});

					// Delete selected row function
					$('#deleteRow').click(function() {
						t.row('.selected').remove().draw(false);
					});

					// converting all the table data into JSON format to send it
					// to
					// controller.
					$('#submit')
							.click(
									function() {

										// get row count of the table. use
										// dataTable() instead
										// of DataTable().
										var rowCount = $(
												'#createProductBatchTable')
												.dataTable().fnGetData().length;
										var quant = $('#quantityRequired')
												.val();

										if (rowCount == quant) {
											var tableData = $(
													'#createProductBatchTable')
													.tableToJSON(
															{
																headings : [
																		'manufacture',
																		'expiry',
																		'status' ]
															});
											// console.log(data);
											alert(JSON.stringify(tableData));
											var json = JSON
													.stringify(tableData);
											// assigning value to an input
											// hidden field.
											$('#jsonData').val(json);
										} else {
											var diff = quant - rowCount;
											// positive value of difference.
											var absDiff = Math.abs(diff);
											if (diff > 0) {
												alert("Add "
														+ absDiff
														+ " more rows, row count should be exect "
														+ quant);
											} else if (diff < 0) {
												alert("Remove "
														+ absDiff
														+ " rows, row count should be exect "
														+ quant);
											}
										}
									});

				});