<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="writeAction.jsp">
		제목: <input type="text" name="title"> <br>
		내용: <textarea rows="30" cols="70" name="detail"></textarea>
		<input type="hidden" value="<%= session.getAttribute("user_id") %>" name="userid">
		<input type="hidden" value="<%= session.getAttribute("user_idx") %>" name="useridx">
		<button>글 저장</button>
	</form>
</body>
</html>