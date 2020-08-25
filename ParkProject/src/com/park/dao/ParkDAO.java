package com.park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.park.dto.AccountVO;
import com.park.dto.BoardVO;
import com.park.util.DBManagement;

public class ParkDAO {
	private static ParkDAO instance = null;
	
	private ParkDAO () {}
	
	public static ParkDAO getInstance() {
		if(instance == null) {
			return new ParkDAO();
		}
		
		return instance;
	}
	
	public boolean insertAccount(AccountVO vo) throws SQLException {
		boolean result = false;
		Connection con = DBManagement.getConnection();
		String sql = "insert into parkproject.account (Ac_id, Ac_pw, Ac_name, Ac_phone, Ac_email,"
				+ "Ac_gender, Ac_birth) values (?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, vo.getAc_id());
		pstmt.setString(2, vo.getAc_pw());
		pstmt.setString(3, vo.getAc_name());
		pstmt.setInt(4, vo.getAc_phone());
		pstmt.setString(5, vo.getAc_email());
		pstmt.setString(6, vo.getAc_gender());
		pstmt.setString(7, vo.getAc_birth()); 
		
		result = pstmt.execute();
		pstmt.close();
		con.close();
		
		return result;	
	}
	
	public AccountVO login(String ac_id, String ac_pw) throws SQLException {
		String query = "select * from parkproject.account where ac_id= ? and ac_pw= ?";
		Connection con = DBManagement.getConnection();
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setNString(1, ac_id);
		pstmt.setNString(2, ac_pw);
		ResultSet rs = pstmt.executeQuery();
		AccountVO login = null;
		if(rs.next()) {
			login = new AccountVO(rs.getString("ac_id"), rs.getString("ac_pw"), 
					rs.getString("ac_name"), rs.getInt("ac_phone"), rs.getString("ac_email"), 
					rs.getString("ac_gender"), rs.getString("ac_birth"));
		}
		System.out.println(ac_id);
		System.out.println(ac_pw);
		return login;
	}
	
	public boolean idCheck(String ac_id) throws SQLException {
		boolean result = false;
		Connection con = DBManagement.getConnection();
		
		if (con != null) {
		String query = "select * from parkproject.account where ac_id=?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, ac_id);
		ResultSet rs=pstmt.executeQuery();
						
		while(rs.next()) {
			result=true;
		}

		pstmt.close();
		con.close();
		rs.close();
		}
		return result;
	}
	
	// 가장 큰 board번호 가져오기
		public int maxBoard_no() throws ClassNotFoundException, SQLException {
			Connection conn = DBManagement.getConnection();
			String query = "select max(board_no) as maxbno from parkproject.board";
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			int maxbno = 0;
			if (rs.next()) {
				maxbno = rs.getInt("maxbno") + 1;
			}
			System.out.println(maxbno);
			return maxbno;
		}
	
	public int insertBoard(BoardVO bvo) throws SQLException, ClassNotFoundException {
		int result;
		Connection con = DBManagement.getConnection();
		String sql = "insert into parkproject.board(board_no, mbl_no, board_title, ac_id, board_content, board_img, board_a_no) values (?,?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, maxBoard_no());
		pstmt.setInt(2, bvo.getMbl_no());
		pstmt.setString(3, bvo.getBoard_title());
		pstmt.setString(4, bvo.getAc_id());
		pstmt.setString(5, bvo.getBoard_content());
		pstmt.setString(6, bvo.getBoard_img());
		pstmt.setInt(7, maxBoard_no());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		
		return result;
	}
	
	public List<BoardVO> viewBoard() throws SQLException {
		List<BoardVO> vo= new ArrayList<BoardVO>();
		Connection con = DBManagement.getConnection();
		String sql = "select * from parkproject.board order by board_no desc";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			vo.add(new BoardVO(rs.getInt("board_no"), rs.getInt("mbl_no"), rs.getString("board_title"),
					rs.getString("ac_id"), rs.getString("board_content"), rs.getInt("board_hits"),
					rs.getInt("board_recomm"), rs.getDate("board_write_date"), rs.getInt("board_active"),
					rs.getString("board_img"), rs.getInt("board_a_no"), rs.getInt("board_a_reply"),
					rs.getInt("board_a_reply_order")));
		}
		pstmt.close();
		rs.close();
		
		return vo;
		
	}
}
