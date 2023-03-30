<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
<%
try{
	String sql = "INSERT INTO test (title, detail, time, userid, useridx) VALUES(?,?,NOW(),?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	String title = request.getParameter("title");
	String detail = request.getParameter("detail");
	int idx = (int) session.getAttribute("user_idx");
	String userid = (String) session.getAttribute("user_id");
	
	pstmt.setString(1, title);
	pstmt.setString(2, detail);
	pstmt.setInt(3, idx);
	pstmt.setString(4, userid);

	pstmt.executeUpdate();
	response.sendRedirect("loginForm.jsp");
	
	
	%>
	<script>
		alert("회원정보 삭제완료");
	</script>
	<%
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