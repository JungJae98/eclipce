<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String driver = "org.mariadb.jdbc.Driver";
	String IP = "localhost";
	String PORT = "3306";
	String ID = "test";
	String PWD = "test";
	String DB_NAME = "test_db";
	
	String DB_URL = "jdbc:mariadb://" + IP + ":" + PORT + "/" +  DB_NAME;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(DB_URL, "test", "test");
		if (conn != null) {
			System.out.println("DB 접속 성공");
		}

	} catch (ClassNotFoundException e) {
		System.out.println("드라이버 로드 실패");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("DB 접속 실패");
		e.printStackTrace();
	}
%>