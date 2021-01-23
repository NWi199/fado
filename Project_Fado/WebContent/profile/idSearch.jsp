<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js" crossorigin="64de5f242b"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
a:hover{
	text-decoration:none;
}
.logo {
	margin-left: 10%;
	font-size: 4em;
	padding-top: 100px;
}
.content {width: 100%; height: 100%; margin-top: 5%;}
.btn2{
	background: rgb(52, 152, 219);
	width: 150px;
	height: 60px;
	color: white;
	border-radius: 20px;
	display: inline-block;
	font-size: 1.2em;
	border:0;	
	
}
@media (min-width: 768px) {
	.login {
	width: 60%;
	text-align: center;
	margin: 0 auto;
	padding-top: 50px;
	}
		
}
@media (min-width: 320px) and (max-width: 480px){ 
	.login {
		width: 100%;
		text-align: center;
		margin: 0 auto;
		padding-top: 50px;
	}
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
	<a style="display: inline;" class="logo" href="../index.jsp"><img src="../image/logo3.PNG" alt="fado"></a>
			<div style="display: inline; font-weight: bold; font-size:1.5em;">회원 정보 찾기 - 아이디 찾기</div>
			<hr>
		<div class="login container-fluid">
			<form name='f' action='idSearch.jsp' method='post'>
				<p style="font-size:1.5em;font-weight:bold;text-align:left;">이메일을 입력해주세요</p>
				<input class="form-control" type="text" style="width:90%;height:50px;font-size:1.2em;display:inline;" name="email" id="email" value="<% if(request.getParameter("email") != null ) { %><%=request.getParameter("email")%><% }  %>">
				<input class="form-control" type="submit" style="width:8%;height:50px;display:inline;" value="Enter">
			</form>
			
			<%
			User user = new User();
			UserDAO db = new UserDAO();
			
			String email = request.getParameter("email");
			
			user = db.idSearch(email);
			if(user.getId()!=null){
			%>
			<i class="fas fa-angle-double-down fa-4x" style="margin-top:70px;"></i>
			<p style="font-size:3em;font-weight:bold;text-align:center;margin-top:40px;margin-bottom:40px;"><%=user.getId() %></p>
			<div class="btnSet">
				<button class="btn2" type="button" onclick="location.href='pwChange.jsp'">비밀번호 변경</button>
				<button class="btn2" type="button" onclick="location.href='../login/login.jsp'" style="margin-left:10px;">로그인</button>
			</div>
			<%
				}
			%>
			</div>
		
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
</body>
</html>