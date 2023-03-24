<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="Connection.jsp" %>
     
<%
try{
	String sql = "DELETE from test where idx= ?";
	
	
	pstmt = conn.prepareStatement(sql);
	int idx = Integer.parseInt(request.getParameter("user_idx")); 
	

	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
	
	out.println(session);
	session.invalidate();
	
	
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