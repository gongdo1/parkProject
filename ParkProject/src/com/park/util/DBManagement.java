package com.park.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManagement {
	private static Connection con;
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		con = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/parkproject",
	            "root","1234");
		
		if(con != null) {
			System.out.println("데이터 베이스에 연결되었습니다.");
		}
		return con;
		
	}
}
