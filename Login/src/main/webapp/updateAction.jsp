<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="Connection.jsp" %>

 <%
	try{
		String sql = "UPDATE test SET userid = ?, passwd = ? where idx = ?";
		
		
		pstmt = conn.prepareStatement(sql);
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd"); 
		int idx = Integer.parseInt(request.getParameter("user_idx")); 
		
		pstmt.setString(1, userid);
		pstmt.setString(2, passwd);
		pstmt.setInt(3, idx);
		pstmt.executeUpdate();
		
		session.setAttribute("user_pass", passwd);
		session.setAttribute("user_id", userid);
		session.setAttribute("user_idx", idx);
		
		
		%>
		<script>
			alert("회원정보 변경완료");
		</script>
		<%
		response.sendRedirect("main.jsp");

		
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("loginForm.jsp");
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
%>