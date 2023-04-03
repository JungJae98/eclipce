  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>

 <%
	try{
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String sql = "UPDATE testbd SET title = ?, detail = ?  where idx = ?";
		
		
		pstmt = conn.prepareStatement(sql);
		String title = request.getParameter("title");
		String detail = request.getParameter("detail"); 
		int idx = Integer.parseInt(request.getParameter("idx")); 
		
		
		pstmt.setString(1, title);
		pstmt.setString(2, detail);
		pstmt.setInt(3, idx);
		pstmt.executeUpdate();
		
		
		response.sendRedirect("viewForm.jsp?number="+idx); 
 
		
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("boarder.jsp");
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