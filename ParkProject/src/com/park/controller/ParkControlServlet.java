package com.park.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.park.dao.ParkDAO;

/**
 * Servlet implementation class ParkControlServlet
 */
@WebServlet({"/ParkControlServlet", "/ParkController.bo"})
public class ParkControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ParkControlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("테스,트중");
		String ac_id = request.getParameter("ac_id");
		ParkDAO dao = ParkDAO.getInstance();
		boolean result;
		try {
			result = dao.idCheck(ac_id);
			String json="{\"isValid\": \""+result+"\"}";
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out=response.getWriter();
			
			System.out.println(ac_id);
			System.out.println(json);
			out.print(json);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		doPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPro(request, response);
	}

	protected void doPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mode = request.getParameter("mode");
		
		ParkActionForward forward = null;
		IParkAction action = null;
		if(mode != null) {
			if(mode.equals("account.com")) {
				System.out.println("회원가입");
				action = new Account();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			} 
//			else if(mode.equals("idCheck.com")) {
//				
//				
//				action = new IdCheck();
//				try {
//					forward = action.execute(request, response);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				
//			} 
			else if(mode.equals("login.com")) {
				System.out.println("로그인");
				action = new login();
				
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(mode.equals("logout.com")) {
				System.out.println("로그아웃부분");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				HttpSession ses = request.getSession();
				ses.invalidate();
				response.setContentType("text/html; charset=utf-8");
				out.print("<script>");
				out.print("alert('로그아웃 하셨습니다');");
				out.print("location.href='./account/login.jsp';");
				out.print("</script>");
				
			} else if(mode.equals("boardList.com")) {
				System.out.println("글전체목록보기");
				action = new BoardList();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else if(mode.equals("boardWrite.com")){
				System.out.println("게시판 작성");
				action = new BoardWrite();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		} else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.print("<script>");
			out.print("alert('잘못된 요청입니다!');");
			out.print("location.href='index.jsp';");
			out.print("</script>");
		}
		
	}
}
