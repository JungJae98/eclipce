<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 완료</h1>

<%= session.getAttribute("user_id") %>
<%= session.getAttribute("user_idx") %>

<form action="logoutAction.jsp" method="post">
	<button>로그아웃</button>
</form>
<form action="updateForm.jsp" method="post">
	<button>정보수정</button>
</form>
<form action="boarder.jsp" method="post">
	<button>게시판</button>
</form>
</body>
</html>