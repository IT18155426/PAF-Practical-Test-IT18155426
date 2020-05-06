$(document).ready(function()
		{
			$("#alertSuccess").hide();
		    $("#alertError").hide();
            $("#hidHospitalIDSave").val("");
		    $("#hospitalItem")[0].reset();
		   });

$(document).on("click", "#btnSave", function(event) {
	// Clear alerts---------------------
			$("#alertSuccess").text("");
			$("#alertSuccess").hide();
			$("#alertError").text("");
			$("#alertError").hide();
			
			// Form validation-------------------
			var status = validateItemForm();
			if (status != true)
			{
				$("#alertError").text(status);
				$("#alertError").show();   return;
			} 





//-----------IF Valiid------------------
var type = ($("#hidHospitalIDSave").val() == "") ? "POST" : "PUT";

$.ajax({
	url : "HospitalAPI",
	type : type,
	data : $("#formHospital").serialize(),
	dataType : "text",
	complete : function(response, status) {
		onHospitalSaveComplete(response.responseText, status);
		}
	});
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
	$("#formHospital")[0].reset();
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

$(document).on("click",".btnUpdate",function(event)
		{
			$("#hidUserIDUpdate").val(
					$(this).closest("tr").find('#hidUserIDUpdate').val());
			$("#name").val($(this).closest("tr").find('td:eq(1)').text());
			$("#license").val($(this).closest("tr").find('td:eq(2)').text());
			$("#emergancy").val($(this).closest("tr").find('td:eq(3)').text());
			$("#telephone").val($(this).closest("tr").find('td:eq(4)').text());
			$("#facilities").val($(this).closest("tr").find('td:eq(5)').text());
			$("##rooms").val($(this).closest("tr").find('td:eq(6)').text());
			
		});

function validateItemForm() {
	// Hospital Name
	if ($("#name").val().trim() == "") {
		return "Insert Hospital Name";
	}
	// License Number
	if ($("#license").val().trim() == "") {
		return "Insert License Number.";
	}
	// Telephone Number
	if ($("#emergancy").val().trim() == "") {
		return "Insert Telephone Number .";
	}

	// Emergency Number
	if ($("#telephone").val().trim() == "") {
		return "Insert Emergency Number.";
	}
	
	//Facilities
	if ($("#facilities").val().trim() == "") {
		return "Insert Facilities.";
	}
	//Room Numbers
	if ($("#rooms").val().trim() == "") {
		return "Insert youe Add Room Numbers.";
	}
	
	return true;
}






