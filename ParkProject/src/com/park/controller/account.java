package com.park.controller;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.ParkDAO;
import com.park.dto.AccountVO;
import com.park.util.EncryptStr;

public class account implements IParkAction {

	@Override
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		String ac_id = request.getParameter("ac_id");
		String ac_pw = request.getParameter("ac_pw");
		String ac_name = request.getParameter("ac_name");
		int ac_phone = Integer.parseInt(request.getParameter("ac_phone"));
		String ac_email = request.getParameter("ac_email");
		String ac_gender = request.getParameter("ac_gender");
		String ac_birth = request.getParameter("ac_birth");
		
		EncryptStr es = new EncryptStr();
		String encPw = es.encryptionStr(ac_pw);
		
		ParkDAO dao = ParkDAO.getInstance();
		AccountVO account = new AccountVO(ac_id, encPw, ac_name, ac_phone, ac_email, ac_gender, ac_birth);
		response.setContentType("text/html; charset=utf-8"); // 인코딩 설정
	    System.out.println(ac_id);
	    PrintWriter out = response.getWriter();
		try {
			dao.insertAccount(account);
			out.print("<script>alert('회원가입 성공'); location.href='account/login.jsp'</script>");
		} catch (SQLException e) {
			out.print("<script>alert('회원가입 실패'); location.href='history.back();'</script>");
			e.printStackTrace();
		}
		return null;
	}

}
