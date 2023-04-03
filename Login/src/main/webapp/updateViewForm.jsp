
<%@ include file="Connection.jsp" %>
<%
	
	int number = Integer.parseInt(request.getParameter("idx"));

	try{
		String sql = "SELECT * FROM testbd where idx = ?";		
		pstmt = conn.prepareStatement(sql);		
		
		pstmt.setInt(1, number);
		rs = pstmt.executeQuery();
		
		
	}catch(Exception e){
		e.printStackTrace();		
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
	if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
	
%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	if(rs.next()){ 
		int idx = rs.getInt("idx");
		String title = rs.getString("title");
		String detail = rs.getString("detail");
		Date time = rs.getDate("time");
		String userid = rs.getString("userid");
		int useridx = rs.getInt("useridx");
		int amen = rs.getInt("amen");
	%>
	<form action="updateViewAction.jsp" method="get" accept-charset="utf-8">
		제목: <input type="text" name="title" value="<%= title %>"> <br>
		내용: <textarea rows="30" cols="70" name="detail"> <%= detail%></textarea>
		<input type="hidden" value="<%= idx %>" name="idx">
		<input type="hidden" value="<%= session.getAttribute("user_id") %>" name="userid">
		<input type="hidden" value="<%= session.getAttribute("user_idx") %>" name="useridx">
		<button>글 수정</button>
	</form>
	<%} %>
</body>
</html>