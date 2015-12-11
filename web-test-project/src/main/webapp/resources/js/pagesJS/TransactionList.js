$(document).ready(function() {
	// function for transaction table through client
	// table action view.
	$('#transactionFromClientTable').dataTable();

	// function for transaction table through home's
	// transaction button view.
	$('#transactionTable').dataTable();

	// validations for transaction form.
	$('#transactionForm').bootstrapValidator({
		framework : 'bootstrap',
		feedbackIcons : {
			valid : 'glyphicon glyphicon-ok',
			invalid : 'glyphicon glyphicon-remove',
			validating : 'glyphicon glyphicon-refresh'
		},
		fields : {
			clientFromHome : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The client is required and can\'t be empty.'
					}
				}

			},
			category : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The category is required and can\'t be empty.'
					}
				}

			},
			subCategory : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The sub-category is required and can\'t be empty.'
					}
				}

			},
			product : {
				row : '.col-xs-4',
				validators : {
					notEmpty : {
						message : 'The product is required and can\'t be empty.'
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
});
