<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="joinAction.jsp" method="post">
	<table>
		<tr>
			<td>ID</td>
			<td><input type="text" name="userid" maxlength="15"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name="passwd" maxlength="15"></td>
		</tr>
	</table>
	&nbsp;<button>가입</button>&nbsp;&nbsp;
	<button type="reset">취소</button>
</form>
</body>
</html>