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
				int amen = rs.getInt("amen");
			%>
				<tr>
					<th>글번호: <%= idx %></th>
					<th>글제목: <%= title %> </th>
					<th>아이디: <%= userid %></th>
					<th>작성시간: <%= time %></th>
					<th>추천추: <%= amen %>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5"><%= detail %></td>
				</tr>
			</tbody>		
		</table>
		<% if (session.getAttribute("user_idx").equals(useridx)) { %>
		<input type="hidden" name = "idx" value="<%= idx%>">
		<button>글삭제</button>
		<% }%>		
	</form>
	<form action="updateViewForm.jsp">
		<% if (session.getAttribute("user_idx").equals(useridx) && amen == 0) {%>
		<!-- 제목과 글번호, 글내용 정도만 정리해서 보낸다. -->
		<input type="hidden" name = "idx" value="<%= idx%>">
		<input type="hidden" name="title" value="<%= title %>">
		<input type="hidden" name="detail" value="<%= detail %>">
		<button>수정</button>
		<%} %>
	</form>
	<form action="amenAction.jsp">
	<!-- idx는 글번호 amen은 추천 -->
		<input type="hidden" name = "idx" value="<%= idx%>">
		<input type="hidden" name = "amen" value="<%= amen%>">
		<button>추천</button>
	</form>
	<%
		} 
	%>
</body>
</html>