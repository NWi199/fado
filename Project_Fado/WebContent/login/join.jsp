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
	width: 60px;
	height: 30px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
}
	.login {
	width:40%; text-align: center; margin: 0 auto;padding-top:50px;}
</style>
<%@ include file = "../header.jsp" %>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="content">
	<div class="login container">
	<h3>회원가입</h3>
         <form action="joinGo" method="post" name="myForm">
             <div style="background-color: white;">
                <div class="form-group">
                    <input type="text" name="email" AUTOCOMPLETE="OFF" placeholder="* 이메일" class="form-control" style="display:inline;">
                    <button class="btn2" style="width:80px;display:inline; border:0px;" >중복확인</button>
                </div>
                 <div class="form-group">
                     <input type="password" name="pw" AUTOCOMPLETE="OFF" placeholder="* 비밀번호" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" name="pw2" AUTOCOMPLETE="OFF" placeholder="* 비밀번호확인" class="form-control">
                </div>
                <div class="form-group">
                	<input type="text" name="name" placeholder="* 닉네임" class="form-control" style="display:inline;">
                	<button class="btn2" style="width:80px;display:inline; border:0px;">중복확인</button>
                </div>
               
                <div class="form-group">
                    <select name="place">
                    	
                    </select>
                </div>
 
               </div>
                <button type="submit" class="btn2" style="width:80px;" >회원가입</button>
               
        </form>
	</div>
</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	<script type="text/javascript">
        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	var f = document.myForm;

            if(!f.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(!f.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            if(document.pw.value != document.pw2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            }

            if(!document.name.value){
                alert("닉네임을 입력하세요.");
                return false;
            }
            
            if(!document.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            
        }
    </script>
   </body>
</html>