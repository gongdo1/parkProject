package com.park.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.ParkDAO;

public class IdCheck implements IParkAction {

	@Override
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String ac_id = request.getParameter("ac_id");
		ParkDAO dao = ParkDAO.getInstance();
		dao.idCheck(ac_id);
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.print("{\"isValid\": \"true\"}");
		out.print("{\"isValid\": \"false\"}");
		System.out.println(ac_id);
	
		
		return null;
	}

}
