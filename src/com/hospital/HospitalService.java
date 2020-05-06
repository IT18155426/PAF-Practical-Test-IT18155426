package com.hospital;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
//For JSON
import com.google.gson.*;
//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document; 

@Path("/Hospital")
public class HospitalService {
	Hospital hospitalService = new Hospital();
	

	@GET
	@Path("/test")
	@Produces(MediaType.TEXT_HTML)
	public String readItems()
	 {
	 return "Hello";
	 } 

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readHospital()
	 {
	 return hospitalService.readHospitals();
	 }
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertHospital(@FormParam("name") String name,
	 @FormParam("license") String license,
	 @FormParam("telephone") String telephone,
	 @FormParam("emergancy") String emergancy,
	 @FormParam("facilities") String facilities,
	 @FormParam("rooms") String rooms)
	 
	{
	 String output = hospitalService.createHospital(name,license,telephone,emergancy,facilities,rooms);
	return output;
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateHospital(String hosData)
	{
	//Convert the input string to a JSON object
	 JsonObject hosObject = new JsonParser().parse(hosData).getAsJsonObject();
	//Read the values from the JSON object
	 String License = hosObject.get("license").getAsString();
	 String tnumber = hosObject.get("tnumber").getAsString();
	 String enumber = hosObject.get("enumber").getAsString();
	 String facilities = hosObject.get("facilities").getAsString();
	 String rooms = hosObject.get("rooms").getAsString();
	 
	 String output = hospitalService.updateHospital(License,tnumber,enumber,facilities,rooms);
	return output;
	}
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteHospital(String hosData)
	{
	//Convert the input string to an XML document
	 Document doc = Jsoup.parse(hosData, "", Parser.xmlParser());

	//Read the value from the element <itemID>
	 String emergancyNum = doc.select("emergancyNum").text();
	 String output = hospitalService.deleteHospital(emergancyNum);
	return output;
	}
	

}
