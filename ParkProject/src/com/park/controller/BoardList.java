package com.park.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.park.dao.ParkDAO;
import com.park.dto.BoardVO;

public class BoardList implements IParkAction {

	@Override
	public ParkActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ParkDAO dao = ParkDAO.getInstance();
		List<BoardVO> lst = dao.viewBoard();
		request.setAttribute("boards", lst); // 실제 글 목록 : request 영역의 boards 속성에 저장
		
		ParkActionForward forward = new ParkActionForward();
		forward.setRedirect(false); // 포워딩 해야 함.
		forward.setPath("./board/boardList.jsp"); // 포워딩 할 경로
		
		return forward;
	}

}
