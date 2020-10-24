<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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
<script src="https://kit.fontawesome.com/64de5f242b.js"
	crossorigin="64de5f242b"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
.btn2 {
	background: rgb(52, 152, 219);
	width: 80px;
	height: 40px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
	border: 0px;
}
	td{
		height:50px;
		font-size:1.2em;
	}
	.head{
		width:30%;
		background:rgb(202, 002, 522);
		font-weight:bold;
	}
	
	
	@media (min-width: 768px) {
	
	.table{width:30%;margin:0 auto;border:solid 2px black;}
	
}

@media (min-width: 320px) and (max-width: 480px){ 
	.table{width:90%;margin:0 auto;border:solid 2px black;}
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content" style="width:100%;height:100%;text-align: center;margin: 0 auto;">
	<div class="logo">
		<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado" style="margin-top:5%;padding-top:50px;"></a>	
	</div>
	<div style="font-size:2.5em;font-weight:bold;margin-top:20px;">회원가입 성공</div>
	<div style="font-size:1.8em;font-weight:bold;margin-top:40px;">환영합니다 !! "닉네임"님 </div>
	<div style="margin-top:40px;">
		<table class="table" style="">
			<tbody>
				<tr>
					<td class="head">아이디</td>
					<td>clanz12</td>
				</tr>
				<tr>
					<td class="head">닉네임</td>
					<td>NWi</td>
				</tr>
				<tr>
					<td class="head">이메일</td>
					<td>tsupapa12@naver.com</td>
				</tr>
				<tr>
					<td class="head">활동 지역</td>
					<td>충청남도 아산시</td>
				</tr>
			</tbody>
		</table>
		<div class="btnSet" style="margin-top:20px;font-size:1.1em;">
			<button type="button" class="btn2" onclick="location.href='../index.jsp'">홈으로</button>
			<button type="button" class="btn2" onclick="location.href='login.jsp' ">로그인</button>
		</div>
		
	</div>
	</div>
</body>
</html>