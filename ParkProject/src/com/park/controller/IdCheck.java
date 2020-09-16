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
		boolean result = dao.idCheck(ac_id);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		String json="{\"isValid\": \""+result+"\"}";
		
		out.print(json);
	
		
		return null;
	}

}
