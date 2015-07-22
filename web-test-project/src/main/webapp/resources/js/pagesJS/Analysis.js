$(document)
		.ready(
				function() {

					//date pickers
					$('#dFrom').datepicker({
						numberOfMonths : 1,
						//dateFormat : 'dd/mm/yy',
						changeMonth : true,
						changeYear : true,
						maxDate : -1,
						onSelect : function(selected) {
							var dt = new Date(selected);
							dt.setDate(dt.getDate() + 1);
							$("#dTo").datepicker("option", "minDate", dt);
						}
					});
					$('#dTo').datepicker({
						numberOfMonths : 1,
						//dateFormat : 'dd/mm/yy',
						changeMonth : true,
						changeYear : true,
						maxDate : 0,
						onSelect : function(selected) {
							var dt = new Date(selected);
							dt.setDate(dt.getDate() - 1);
							$("#dFrom").datepicker("option", "maxDate", dt);
						}
					});

					// Function for flot pie chart.
					var placeholder = $('#placeholder');
					//var json = $('#jsonData').val();
					var maxLabel = $('#maxPName').val(), maxData = $(
							'#maxPCount').val(), minLabel = $('#minPName')
							.val(), minData = $('#minPCount').val(), restData = $(
							'#totalSoldProducts').val();
					var dataForm = dataFormatter(maxLabel, maxData, minLabel,
							minData, restData);
					//var series = $.parseJSON(JSON.stringify(json));
					$.plot(placeholder, dataForm, {
						series : {
							pie : {
								show : true,
								radius : 1,
								label : {
									show : true,
									radius : 2 / 3,
									formatter : labelFormatter,
									background : {
										opacity : 0.5
									}
								}
							}
						},
						legend : {
							show : false
						}
					});

					// A custom label formatter used by pie plots
					function labelFormatter(label, series) {
						return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>"
								+ label
								+ "<br/>"
								+ Math.round(series.percent)
								+ "%</div>";
					}
					;

					// A custom data formatter used to get required data in proper format as the flot wants.
					function dataFormatter(maxLabel, maxData, minLabel,
							minData, restData) {

						var data = [], size = 3;

						for ( var i = 0; i < size; i++) {
							if (i == 0) {
								if (maxLabel != '' && maxData != '') {
									data[i] = {
										label : maxLabel,
										data : parseInt(maxData)
									};
								}
							}

							if (i == 1) {
								if (minLabel != '' && minData != '') {
									data[i] = {
										label : minLabel,
										data : parseInt(minData)
									};
								}
							}

							if (i == 2) {
								if (restData != '') {
									var restD = parseInt(restData)
											- (parseInt(maxData) + parseInt(minData));
									data[i] = {
										label : "Other",
										data : restD
									};
								}
							}

						}
						return data;
					}
					;

				});