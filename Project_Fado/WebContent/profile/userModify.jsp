<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
	<%@ page import="java.io.PrintWriter"%>
	<%@ page import="model.UserDAO" %>
<%@ page import="model.User" %>
<%@ page import="java.util.*" %>
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

UserDAO userdb = new UserDAO();
String userID = (String) session.getAttribute("id");
User user = userdb.info(userID);
			//로그인 안한 경우
			if (userID == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href = '../login/login.jsp'");
				script.println("</script>");
			}
			
		%>
<div class="content">
  <div style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">회원 정보 수정</div>
		<i style="margin-left:15px" class="fas fa-bars fa-2x"></i>
	</div>
	<hr>
	
	<div class="picture"></div>
	<div class="modi">
	<form action="modifyGo" method="post" name="myForm">
             <div style="background-color: white;">
                <div class="form-group">
                    <%=user.getId() %>
                    <!-- <button class="btn2" style="width:80px;">중복확인</button> -->
                </div>
                <div class="form-group">
                	<input type="text" name="name" placeholder="닉네임" class="form-control" value="<%=user.getName() %>">
                	<!--<button class="btn2" style="width:80px;">중복확인</button> -->
                </div>
                <div class="form-group">
                     <input type="password" name="pw" AUTOCOMPLETE="OFF" placeholder="비밀번호" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" name="pw2" AUTOCOMPLETE="OFF" placeholder="비밀번호확인" class="form-control">
                </div>
                <div class="form-group">
                    <input type="text" name="email" placeholder="이메일" class="form-control" value="<%=user.getEmail() %>">
                    
                </div>
 
               </div>
                <button type="submit" class="btn2" style="width:80px;" >수정</button>
               <a href="DeleteGo" class="btn2" >탈퇴</a>
        </form>
	
	</div>
</div>	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
