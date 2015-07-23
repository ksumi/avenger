package com.lovo.cq.shopping10_1.common;

import java.sql.*;

public class DbUtil {

	private PreparedStatement pstmt = null;

	private Connection con = null;

	public DbUtil() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/shoppingbook?user=root&password=123456&characterEncoding=GB2312");;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Connection getCon() {
		return con;
	}

	public void close() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

public static void main(String[] args) {
	DbUtil dbaccess = new DbUtil();
	dbaccess.close();
}
}