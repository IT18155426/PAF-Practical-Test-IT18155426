var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";

$.ajax({
	url : "HospitalAPI",
	type : type,
	data : $("#hospitalItem").serialize(),
	dataType : "text",
	complete : function(response, status) {
		onHospitalSaveComplete(response.responseText, status);
	}
});

function onHospitalSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();

			$("#divHospitalsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}

	$("#hidHospitalIDSave").val("");
	$("#hospitalItem")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	$.ajax({
		url : "HospitalAPI",
		type : "DELETE",
		data : "license=" + $(this).data("license"),
		dataType : "text",
		complete : function(response, status) {
			onHospitalDeleteComplete(response.responseText, status);
		}
	});
});

function onHospitalDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();

			$("#divHospitalsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

$("#hidHospitalIDSave").val("");
$("#hospitalItem")[0].reset();