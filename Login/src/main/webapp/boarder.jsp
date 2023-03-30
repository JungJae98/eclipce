<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@ include file="Connection.jsp" %>

 
<% 
 	try{
 		String sql = "SELECT * FROM testbd";	
 		pstmt = conn.prepareStatement(sql);	
 		rs = pstmt.executeQuery();		
 	}catch(Exception e){
 		e.printStackTrace();		
 	}finally{
 		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
 	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="writeForm.jsp" method="post">
	<table>
		<thead>
			<tr>
				<th>순서</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
		</thead>
		<tbody>
		<% while (rs.next()){%>
			<tr>
				<td><%= rs.getInt("idx")%></td>
				<td><a href="viewForm.jsp?number=<%= rs.getInt("idx")%>"><%= rs.getString("title")%></a></td>
				<td><%= rs.getString("userid")%></td>
				<td><%= rs.getDate("time")%></td>
			</tr>
		<%} %>
		</tbody>		
	</table>
	&nbsp;<button>글쓰기</button>&nbsp;&nbsp;
	<button type="reset">취소</button>
</form>
</body>
</html>