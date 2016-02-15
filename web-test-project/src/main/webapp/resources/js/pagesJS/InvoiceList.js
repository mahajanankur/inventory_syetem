$(document).ready(function() {

	var t = $('#invoiceTable').DataTable();

	// Dependent dropdown - START

	// Dropdown select
	$("#subCategory").attr("disabled", true);
	$("#helpSubCat").hide();
	$("#category").change(function() {
		var catId = $(this[this.selectedIndex]).val();
		if (catId != "" && catId != null) {
			$("#subCategory").attr("disabled", false);
			$.ajax({
				type : 'GET',
				url : 'getSubCatOnCat',
				data : {
					subCat : catId
				},
				headers : {
					Accept : 'application/json'
				},
				dataType : 'json',
				success : function(data) {
					$("#helpSubCat").hide();
					var jsonSubCat = $.parseJSON(JSON.stringify(data));

					var $select = $('#subCategory');
					$select.empty().prepend("<option value='' selected='selected'>--Please select sub-category--</option>");
					$(jsonSubCat).each(function(index, o) {
						var $option = $("<option/>").attr("value", o.subCategoryId).text(o.subCategoryName);

						$select.append($option);
					});

					if (jsonSubCat == null || jsonSubCat == "") {
						$("#helpSubCat").show().html("No sub-category is linked to this category.");
					}

				},
				error : function(xmlHttpRequest, textStatus, errorThrown) {
					if (xmlHttpRequest.readyState = 0 || xmlHttpRequest.status == 0)
						return;
				},
			});
		}

	});

	$("#product").attr("disabled", true);
	$("#helpProduct").hide();
	$("#subCategory").change(function() {
		var subCatId = $(this[this.selectedIndex]).val();
		if (subCatId != "" && subCatId != null) {
			$("#product").attr("disabled", false);
			$.ajax({
				type : 'GET',
				url : 'getProductOnSubCategory',
				data : {
					subCat : subCatId
				},
				headers : {
					Accept : 'application/json'
				},
				dataType : 'json',
				success : function(data) {
					$("#helpProduct").hide();
					var jsonProduct = $.parseJSON(JSON.stringify(data));
					var $select = $('#product');
					$select.empty().prepend("<option value='' selected='selected'>--Please select product--</option>");
					$(jsonProduct).each(function(index, o) {
						var $option = $("<option/>").attr("value", o.pId + "|" + o.pName).text(o.pName);

						$select.append($option);
					});

					if (jsonProduct == null || jsonProduct == "") {
						$("#helpProduct").show().html("No product is linked to this sub-category.");
					}

				},
				error : function(ts) {
					alert(ts.responseText);
				},
			});
		}

	});

	// For balance calculation according to quantity of
	// product
	var amountPerProduct = 0;
	$("#product").change(function() {
		var productDetail = $(this[this.selectedIndex]).val();
		if (productDetail != "" && productDetail != null) {

			$.ajax({
				type : 'GET',
				url : 'getProductDetailsForBalanceCalculation',
				data : {
					productDetail : productDetail
				},
				headers : {
					Accept : 'application/json'
				},
				dataType : 'json',
				success : function(data) {
					if (data != null && data != "") {
						amountPerProduct = data;
					}

				},
				error : function(xmlHttpRequest, textStatus, errorThrown) {
					if (xmlHttpRequest.readyState = 0 || xmlHttpRequest.status == 0)
						return;
				},
			});
		}

	});

	$('#quantity').change(function() {
		var quantity = this.value;
		var totalAmount = 0;
		$("#amount").hide();
		if (this.value != null && quantity != "") {
			var quan = parseInt(quantity);
			var aPProduct = parseFloat(amountPerProduct);
			totalAmount = quan * aPProduct;
			$("#amount").show();
			$("#amount").text(totalAmount);
			$("#hAmount").val(totalAmount);
		} else {

		}

	});

	// Dependent dropdown - END

	// Add row function
	$('#addRow').on('click', function() {
		// split method for client
		var sArray = $('#client').val().split("|");
		var clientId = sArray[0];
		var clientName = sArray[1];
		// split method for product
		var sArray = $('#product').val().split("|");
		var pId = sArray[0];
		var pName = sArray[1];

		t.row.add([ clientId, clientName, pId, pName, $('#quantity').val(), $('#hAmount').val() ]).draw();

		// sum of price column.
		var sum = t.column(5).data().sum();
		$('#priceSum').html("Total Amount Without Applying Any Taxes : <b>&#x20B9;</b> " + sum);
	});

	// Delete row Function
	$('#invoiceTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			t.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	$('#deleteRow').click(function() {
		t.row('.selected').remove().draw(false);

		// sum of price column.
		var sum = t.column(5).data().sum();
		$('#priceSum').html("Total Amount Without Applying Any Taxes : <b>&#x20B9;</b> " + sum);
	});

	// converting all the table data into JSON format and send
	// it as request in ajax method.
	$('#submit').click(function() {
		var tableData = $('#invoiceTable').tableToJSON({
			headings : [ 'clientId', 'clientName', 'productId', 'productName', 'quantity', 'price' ]
		});
		// console.log(data);
		var json = JSON.stringify(tableData);
		// assign json to a hidden field value.
		$('#jsonData').val(json);
	});

	$("input[name$='invoiceType']").change(function() {
		var check = $(this).val();

		if (check != '' && check == "manual") {
			$('#manualDiv').show();
			$('#transactionDiv').hide();
		} else {
			$('#manualDiv').hide();
			$('#transactionDiv').show();
		}
	});

	// method for auto complete
	var transactionList = $("#transactionList").val();
	if (transactionList) {
		var alteredList = transactionList.substring(1, transactionList.length - 1);

		var transactionArray = [];
		transactionArray = alteredList.split(',');
		$("#transactionId").autocomplete({
			source : transactionArray,
		// select : function(event, ui) {
		// $('#transactionId').val((ui.item.value));
		// // console.log("Request Id" + $('#reqId').val());
		// // requestIDsData($('#reqId').val());
		// }
		});
	}

	// get the transaction list by id.

	$('#transactionId').change(function() {
		var id = $(this).val();

		$.ajax({
			type : 'GET',
			url : 'getTransactionsById',
			data : {
				transactionId : id
			},
			headers : {
				Accept : 'application/json'
			},
			dataType : 'json',
			success : function(data) {
				var jsonData = $.parseJSON(JSON.stringify(data));
			},
			error : function(ts) {
				alert(ts.responseText);
			},
		});
	});

});