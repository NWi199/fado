<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
	<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
	<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
</head>
<style>
a:hover {
	text-decoration: none;
}
.content{
	max-width: 50%;height: 100%;
	margin: 0 auto;
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
<%
String userID = (String) session.getAttribute("id");
%>
<div class="content">
  <a href="userModify.jsp">정보수정</a>
</div>	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
