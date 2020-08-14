package com.park.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.park.dao.ParkDAO;
import com.park.dto.AccountVO;
import com.park.util.EncryptStr;

public class login implements IParkAction {

	@Override
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그인액션");
		
		String ac_id = request.getParameter("ac_id");
		String ac_pw = request.getParameter("ac_pw");
		
		EncryptStr es = new EncryptStr();
		String encpw = es.encryptionStr(ac_pw);
		ParkDAO dao = ParkDAO.getInstance();
		
		AccountVO login = dao.login(ac_id, encpw);
		HttpSession ses = request.getSession();
		ses.setAttribute("login", login);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (login != null) {
			out.print("<script>");
			out.print("alert('로그인에 성공했습니다');");
			out.print("location.href='./index.jsp';");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('회원 정보가 없습니다 확인 후 다시 로그인 해주세요!');");
			out.print("location.href='account/login.jsp';");
			out.print("</script>");
		}
		return null;
	}

}
