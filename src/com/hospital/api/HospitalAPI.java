package com.hospital.api;
import com.hospital.api.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import com.hospital.Hospital;

@WebServlet("/HospitalAPI")
public class HospitalAPI extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	public HospitalAPI() {
	}
	
	Hospital hospital = new Hospital();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String output = hospital.insertItem(request.getParameter("name"), request.getParameter("license"),
				request.getParameter("telephone"), request.getParameter("emergancy"),request.getParameter("facilities"),request.getParameter("rooms"));

		response.getWriter().write(output);
	}

	@Override
	private static Map getParasMap(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		try {
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ? scanner.useDelimiter("\\A").next() : "";
			scanner.close();

			String[] params = queryString.split("&");
			for (String param : params) {

				String[] p = param.split("=");
				map.put(p[0], p[1]);
			}
		} catch (Exception e) {
		}
		return map;
	}

	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map paras = getParasMap(request);

		String output = hospital.updateItem(paras.get("hidHospitalIDSave").toString(), paras.get("name").toString(),
				paras.get("license").toString(), paras.get("telephone").toString(), paras.get("emergancy").toString(),paras.get("facilities").toString(),paras.get("rooms").toString());

		response.getWriter().write(output);
	}

	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map paras = getParasMap(request);

		String output = hospital.deleteItem(paras.get("license").toString());

		response.getWriter().write(output);
	}

}
