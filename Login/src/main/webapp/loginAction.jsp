<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="Connection.jsp" %>

 <%
	try{
		String sql = "SELECT * FROM test WHERE userid = ? and passwd = ?";
		
		pstmt = conn.prepareStatement(sql);
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		pstmt.setString(1, userid);
		pstmt.setString(2, passwd);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			int idx = rs.getInt("idx");
			userid = rs.getString("userid");
			passwd = rs.getString("passwd");
		
			session.setAttribute("user_pass", passwd);
			session.setAttribute("user_id", userid);
			session.setAttribute("user_idx", idx);
			response.sendRedirect("main.jsp");
		}else{
			%>
			<script>
			alert('이게 안뜨네');
			</script>
			<%
			response.sendRedirect("loginForm.jsp");
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("loginForm.jsp");
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
%>
