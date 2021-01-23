<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
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
.btn {background-color:lightgray;border-radius:50px;margin-top:30px;width:200px;height:100px;font-size:1.5em;font-weight:bold;text-align:center;}
.content {width: 100%; height: 100%; margin-top: 5%;}
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
			<div style="display: inline; font-weight: bold; font-size:1.5em;">회원 정보 찾기</div>
			<hr>
		<div class="login container-fluid">
			<div style="margin-top:50px;">
				<div class="row">
				<div class="col-md-6">
					<button type="button" class="btn" style="" onclick="location.href='idSearch.jsp'">아이디 찾기</button>
				</div>
				<div class="col-md-6">
					<button type="button" class="btn" style="" onclick="location.href='pwChange.jsp'">비밀번호 변경</button>
				</div>
				</div>
			</div>
			</div>
		</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
</body>
</html>