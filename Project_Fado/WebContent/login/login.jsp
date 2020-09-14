<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">

<style>
.btn2 {
	background: rgb(52, 152, 219);
	width: 60px;
	height: 30px;
}

.login {
	margin: 0 auto;
	text-align: center;
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>

	<div class="content">
		<div class="login">
			<div class="logo">
				<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado"></a>
			</div>
			<h1 style="text-align: center; font-size:3em; padding-bottom: 20px; font-weight:bold;">로그인</h1>
			<div
				style="background:white;">
				<form name="myForm" action="loginGo" method="post">
					<table class="table" style="margin:0 auto; " >
						<tbody>
							<tr>
								<td rowspan="2"><button type="submit" class="btn2"
										style="width: 70px; height: 50px; display: inline;">로그인</button></td>
								<td colspan="2"><div class="form-group"><input type="text" name="id"
									placeholder="아이디" class="form-control"></div></td>
							</tr>
							<tr>
								<td colspan="2"><div class="form-group"><input type="password" name="pw"
									AUTOCOMPLETE="OFF" placeholder="비밀번호" class="form-control"></div></td>
							</tr>
							<tr>
								<td></td>
								<td><button class="btn2" style="width: 80px;"
										onclick="location.href='join.jsp'">회원가입</button></td>
								<td><button class="btn2" style="width: 80px;">정보찾기</button></td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
</body>
</html>