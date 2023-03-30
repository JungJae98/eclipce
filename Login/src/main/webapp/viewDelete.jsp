<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
<%	
try{
	String sql = "delete from testbd where idx = ?";
	
	pstmt = conn.prepareStatement(sql);
	int idx = Integer.parseInt(request.getParameter("idx"));

	
	pstmt.setInt(1, idx);
	pstmt.executeUpdate();
	
	response.sendRedirect("boarder.jsp");
	
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("boarder.jsp");
}finally{
	if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
	if(conn != null) try{conn.close();} catch(SQLException ex) {}
}
	

%>