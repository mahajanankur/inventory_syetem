function getTableContent() {
	$("tr.table").click(function() {
		var tableData = $(this).children("td").map(function() {
			return $(this).text();
		}).get();

		alert("Your data is: " + $.trim(tableData[0]) + " , " + $.trim(tableData[1]) + " , " + $.trim(tableData[2]));
	});

}
