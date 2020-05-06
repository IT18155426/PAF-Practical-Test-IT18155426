package com.hospital;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Hospital {
	public Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/newdb", "root", "");
			System.out.print(" hos Successfully connected");

		} catch (Exception e) {
			System.out.print("error");
			e.printStackTrace();
		}
		return con;
	}

	public String createHospital(String name, String license, String telephone, String emergancy, String facilities,
			String rooms) {

		String Output = "";

		try {
			// patientDatabase newp = new patientDatabase();
			Connection con = connect();

			if (con == null) {
				return "Error while connectingto the database for inserting";
			}

			String query = " insert into hospital (`hos_id`,`hos_name`,`hos_license`, `hos_telephone`, `hos_emergancy`,`hos_facilities`, `hos_rooms`) "
					+ "values(?, ?, ?, ?, ?, ?, ?)";
			// Date date = Calendar.getInstance().getTime();
			// DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
			// String strDate = dateFormat.format(date);

			PreparedStatement preparedStmt = con.prepareStatement(query);
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, name);
			preparedStmt.setInt(3, Integer.parseInt(license));
			preparedStmt.setInt(4, Integer.parseInt(telephone));
			preparedStmt.setInt(5, Integer.parseInt(emergancy));
			preparedStmt.setString(6, facilities);
			preparedStmt.setInt(7, Integer.parseInt(rooms));

			System.out.print("i run insert patient");
			preparedStmt.execute();
			con.close();
			String newHospital = readHospitals();
			Output = "{\"status\":\"success\", \"data\": \"" +
			newHospital + "\"}"; 
			
			
		} catch (Exception e) {
			Output = "{\"status\":\"error\", \"data\":"
					+ "         \"Error while inserting the item.\"}";
			System.err.println(e.getMessage());   
		}

		return Output;
	}

	public String deleteHospital(String emergancyNum)

	{
		String output = "";

		try {
			Connection connection = connect();

			if (connection == null) {
				return "Error while connecting to the database for deleting.";
			}

			String query = "delete from hospital where hos_emergancy=?";

			PreparedStatement prepareStmt = connection.prepareStatement(query);

			prepareStmt.setInt(1, Integer.parseInt(emergancyNum));
			prepareStmt.execute();
			connection.close();

			String newHospitals = readHospitals();
			output = "{\"status\":\"success\", \"data\": \"" + newHospitals + "\"}";
			
		} catch (Exception e) {
			output = "error while deleting the patient";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String updateHospital(String License, String tnumber, String enumber, String facilities, String roomNo) {
		String output = "";

		try {
			Connection connection = connect();
			if (connection == null) {
				return "error while connecting to the database for updating";
			}

			String query = "UPDATE hospital SET hos_telephone=?,hos_emergancy	=?,hos_facilities=?,hos_rooms=? "
					+ "where hos_license=? ";

			PreparedStatement pStatement = connection.prepareStatement(query);

			// pStatement.setString(1, appointmentNum);
			pStatement.setInt(1, Integer.parseInt(tnumber));
			pStatement.setInt(2, Integer.parseInt(enumber));
			pStatement.setString(3, (facilities));
			pStatement.setInt(4, Integer.parseInt(roomNo));
			pStatement.setInt(5, Integer.parseInt(License));

			pStatement.execute();
			connection.close();
			System.out.print("updated");
			String newHospitals = readHospitals();
			output = "{\"status\":\"success\", \"data\": \"" + newHospitals + "\"}";

		} catch (Exception e) {
			// TODO: handle exception
			System.out.print("not updated");
			output = "error while updating the appointment";
			System.err.println(e.getMessage());
		}
		return output;
	}

	public String readHospitals() {
		String output = "";

		try {
			Connection con = connect();

			if (con == null) {
				return "error while connecting to the database for reading";
			}
			output = "<table class='table'></th><th>Hospital Name</th>"					
					 +"<th>License Number</th>"
					 +"<th>Telphone No</th>"
					 + "<th>Emergancy Number</th>"
					 +"<th> Facilities</th>"		
					 +"<th>Room number</th>"
					 +"<th>Update</th>"
					 +"<th>Delete</th>"+"</tr>";

			String query = "select * from hospital ";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				String name = rs.getString("hos_name");
				String license = Integer.toString(rs.getInt("hos_license"));
				String number = Integer.toString(rs.getInt("hos_telephone"));
				String emergancy = Integer.toString(rs.getInt("hos_emergancy"));
				String facilities = rs.getString("hos_facilities");
				String roomno = Integer.toString(rs.getInt("hos_rooms"));

				// html table
				output += "<tr><td><input id=\"hidItemIDUpdate\"   " + "     name=\"hidItemIDUpdate\"       "
						+ "   type=\"hidden\" value=\"" + number + "\">" + emergancy + facilities + roomno + "</td>";

				output += "<tr><td>" + name + "</td>";
				output += "<td>" + license + "</td>";
				output += "<td>" + number + "</td>";
				output += "<td>" + emergancy + "</td>";
				output += "<td>" + facilities + "</td>";
				output += "<td>" + roomno + "</td>";

				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td> <td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-license ='"
						+ license + "'>" + "</td></tr>";

			}
			con.close();

			output += "</table>";
			System.out.println("table can be view");
		} catch (Exception e) {
			output = "{\"status\":\"error\", \"data\": \"Error while inserting the Hospitals.\"}";
			System.err.println(e.getMessage());
			System.out.println("table can't be view");
		}
		return output;

	}
}
