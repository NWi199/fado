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
	width: 40%;
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
			<div style="display: inline; font-weight: bold; font-size:1.5em;">회원 정보 찾기 - 비밀번호 변경</div>
			<hr>
		<div class="login container-fluid">
			<form name='f' action='pwChange.jsp' method='post'>
				<p style="font-size:1.5em;font-weight:bold;text-align:left;">아이디를 입력해주세요</p>
				<input class="form-control" type="text" style="width:90%;height:50px;font-size:1.2em;display:inline;" name="id" id="id" value="<% if(request.getParameter("id") != null ) { %><%=request.getParameter("id")%><% }  %>">
				<input class="form-control" type="submit" style="width:8%;height:50px;display:inline;" value="Enter">
			</form>
			
			<%
				User user = new User();
				UserDAO db = new UserDAO();
				
				String id = request.getParameter("id");
				
				user = db.info(id);
				if(user.getId()!=null){
			%>
			<div style="background:white;margin-top:50px;">
					<p></p>
					<form name="f" action="pwChange" method="post"
						onsubmit="return checkValue();">
						<table class="table">
							<tbody style="margin:0 auto;">
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="pw" AUTOCOMPLETE="OFF"
										class="form-control"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" name="pw2" AUTOCOMPLETE="OFF"
										class="form-control"></td>
								</tr>
							</tbody>
						</table>
						<button type="submit" class="btn2" style="background:rgb(52, 152, 219);">완료</button>
						<input type="hidden" name="id" id="id" value="<%=user.getId() %>">
					</form>
				</div>
				<%
				}
				%>
		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript">
		// 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
               //비밀번호 입력여부 체크
            if (f.pw.value == "") {
                alert("비밀번호를 입력하지 않았습니다.")
                f.pw.focus();
                return false;
            }
            if (f.pw.value == f.id.value) {
                alert("아이디와 비밀번호가 같습니다.")
                f.pw.focus();
                return false;
            }
            //비밀번호 길이 체크(4~8자 까지 허용)
            if (f.pw.value.length<4 || f.pw.value.length>12) {
                alert("비밀번호를 4~12자까지 입력해주세요.")
                f.pw.focus();
                f.pw.select();
                return false;
            }
            //비밀번호와 비밀번호 확인 일치여부 체크
            if (f.pw.value != f.pw2.value) {
                alert("비밀번호가 일치하지 않습니다")
                f.pw1.value = ""
                f.pw1.focus();
                return false;
            }
		}

	</script>
</body>
</html>