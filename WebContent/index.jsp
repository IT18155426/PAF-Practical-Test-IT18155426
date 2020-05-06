<%@page import="com.hospital.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hospital Service Managment</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/Hospital.js"></script>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<h2>Hospital Portal</h2>

				<legend>Add Hospital Details</legend>
				<form id="formHospital" name="formHospital">

					<br>Hospital Name: <input id="name" name="name" type="text"
						class="form-control form-control-sm"> 
						
					<br>License Number: <input id="license" name="license" type="text"
						class="form-control form-control-sm"> 
						
					<br>Telephone Number <input id="telephone" name="telephone" type="text"
						class="form-control form-control-sm"> 
						
					<br>Emergency Number: <input id="emergancy" name="emergancy"
						type="text" class="form-control form-control-sm"> 
						
					<br> Facilities: <input id="facilities" name="facilities"
						type="text" class="form-control form-control-sm"> 
						
					<br> Add Room Numbers: <input id="rooms" name="rooms"
						type="text" class="form-control form-control-sm"> 
						
					<br> <input id="btnSave" name="btnSave" type="button"
						value="Save" class="btn btn-primary"> <input type="hidden"
						id="hidHospitalIDSave" name="hidHospitalIDSave" value="">

				</form>

				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>

				<br>
				<div id="divHospitalsGrid">
					<%
						Hospital hospitalObj = new Hospital();
						out.print(hospitalObj.readHospitals());
					%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>