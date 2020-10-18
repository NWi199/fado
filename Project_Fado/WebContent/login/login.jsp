<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
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
	width: 180px;
	height: 40px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
	border:0;
	font-size:1.1em;display:inline;
	margin-top:30px;
}
.login {
	margin: 0 auto;
	text-align: center;
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>

	<div class="content" style="witdh:100%;height:100%;margin-top:5%;">
		<div class="login">
			<div class="logo">
				<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado" style=""></a>
			</div>
			<div style="background-image:url('')">
			<div style="background:white;margin-top:50px;">
				<form name="myForm" action="loginGo" method="post">
					<table class="table" style="margin:0 auto;width:30%;border:none;" >
						<tbody style="margin:0 auto;">
							<tr >
								<td rowspan="2" style="width:200px;"><button type="submit" style="width:150px;height:120px;display: inline;background:gray;color:white;font-weight:bold;border-radius:10px;border:0px;font-size:1.3em;">로그인</button></td>
								<td colspan="2"><input style="margin-top:10px;" type="text" name="id" placeholder="아이디" class="form-control"></td>
							</tr>
							<tr>
								<td colspan="2"><input style="margin-top:10px;" type="password" name="pw" AUTOCOMPLETE="OFF" placeholder="비밀번호" class="form-control"></td>
							</tr>
						</tbody>
					</table>
					<button type="button" class="btn2" onclick="location.href='join.jsp' ">회원가입</button>
					<button type="button" class="btn2" style="margin-left:30px;">정보찾기</button>
				</form>
			</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
</body>
</html>