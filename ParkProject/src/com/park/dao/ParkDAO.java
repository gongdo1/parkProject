package com.park.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.park.dto.AccountVO;
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
}
