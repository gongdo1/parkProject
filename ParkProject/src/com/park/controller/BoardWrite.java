package com.park.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.ParkDAO;
import com.park.dto.BoardVO;

public class BoardWrite implements IParkAction {

	@Override
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int mbl_no = Integer.parseInt(request.getParameter("mbl_no"));
		String board_title = request.getParameter("board_title");
		String board_content = request.getParameter("board_content");
		String board_img = request.getParameter("board_img");
		String ac_id = request.getParameter("ac_id");
		
		ParkDAO dao = ParkDAO.getInstance();
		
		BoardVO bvo = new BoardVO(mbl_no, board_title, ac_id, board_content);
		System.out.println(bvo);
		response.setContentType("text/html; charset=utf-8;");
		System.out.println(bvo);
		try {
			PrintWriter out = response.getWriter();
			dao.insertBoard(bvo);
			out.println("<script>");
			out.println("alert('글 등록 완료!');");
			out.println("</script>");
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ParkActionForward forward = new ParkActionForward();
		forward.setRedirect(true); // 페이지 리다이렉트 
		forward.setPath("ParkController.bo?mode=boardList.com"); // 페이지 이동 될 주소 경로(리스트 페이지)
		
		return forward;
	}

}
