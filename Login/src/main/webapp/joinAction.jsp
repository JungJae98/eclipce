<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="Connection.jsp" %>
<%
	try{
		String sql = "INSERT INTO test (userid, passwd) VALUES(?,?)";
		
		pstmt = conn.prepareStatement(sql);
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		pstmt.setString(1, userid);
		pstmt.setString(2, passwd);
		pstmt.executeUpdate();
		response.sendRedirect("loginForm.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("loginForm.jsp");
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	
<body>

	
</body>
</html>