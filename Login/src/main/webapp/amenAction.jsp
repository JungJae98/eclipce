  
<%@ include file="Connection.jsp" %>

 <%
	try{
		String sql = "UPDATE testbd SET amen = ? where idx = ?";
		
		
		pstmt = conn.prepareStatement(sql);
		int amen = Integer.parseInt(request.getParameter("amen"))+1;
		int idx = Integer.parseInt(request.getParameter("idx")); 
		
		pstmt.setInt(1, amen);
		pstmt.setInt(2, idx);
		pstmt.executeUpdate();
		
		String previousPageUrl = request.getHeader("Referer");
		
		response.sendRedirect("viewForm.jsp?number="+idx);

		
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("boarder.jsp");
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

</body>
</html>