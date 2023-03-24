<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updateAction.jsp" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="userid" maxlength="15" value="<%= session.getAttribute("user_id") %>"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd" maxlength="15" value="<%= session.getAttribute("user_pass") %>"></td>
		</tr>
	</table>
	<input type="hidden" name="user_idx" maxlength="15" value="<%= session.getAttribute("user_idx") %>">
	&nbsp;<button>정보수정</button>&nbsp;&nbsp;
</form>
<form action="deletUserAction.jsp">
<input type="hidden" name="user_idx" maxlength="15" value="<%= session.getAttribute("user_idx") %>">	
	<input type="hidden" name="user_idx" maxlength="15" value="<%= session.getAttribute("user_idx") %>">
	<button>회원탈퇴</button>
</form>
</body>
</html>