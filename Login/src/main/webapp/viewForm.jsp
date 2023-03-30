<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
<%
	int number = Integer.parseInt(request.getParameter("number"));

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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="viewDelete.jsp">
		<table>
			<thead>
			<%
			if(rs.next()){ 
				int idx = rs.getInt("idx");
				String title = rs.getString("title");
				String detail = rs.getString("detail");
				Date time = rs.getDate("time");
				String userid = rs.getString("userid");
				int useridx = rs.getInt("useridx");
			%>
				<tr>
					<th><%= idx %></th>
					<th><%= title %> </th>
					<th><%= userid %></th>
					<th><%= time %></th>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="4"><%= detail %></td>
				</tr>
			</tbody>		
		</table>
		<% if (session.getAttribute("user_idx").equals(useridx)) { %>
		<input type="hidden" name = "idx" value="<%= idx%>">
		<button>글삭제</button>
		<% }%>		
	</form>
	<%
		} 
	%>
</body>
</html>