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

<%@ include file="../header.jsp"%>
<style>
	.btn2{width:120px;font-weight:bold;height:50px;font-size:1.1em;}
	.intro{background:white;width:90%;border-radius:100px;margin:0 auto;margin-top:50px;margin-bottom:50px;}
	.option{margin-top:30px;text-align:center;padding-bottom:50px;}
	.name{padding-top:70px;width:100%;text-align:center;font-size:2em;font-weight:bold;}
	.place{width:90%;background:white;margin-top:30px;padding:20px;margin-left:60px;}
.exp{margin:0 auto;margin-top:30px;padding:20px;width:90%;height:200px;text-align:left;font-size:1.1em;border:1px solid lightgray;border-radius:30px;}
	
@media (min-width: 320px) and (max-width: 480px){ 
	.exp{margin:0 auto;margin-top:30px;padding:20px;width:90%;height:200px;text-align:left;font-size:1.1em;border:1px solid lightgray;border-radius:30px;}

}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="content">
	<div class="row">
		<div class="col-md-12"> 
			<div class="intro">
				<%
							String otherID = null;
							if (request.getParameter("otherID") != null) {
								otherID = request.getParameter("otherID");
							}
							User other = userdb.info(otherID);
							System.out.println(other.getName());
							if(other.getExp()==null){
								other.setExp("자신을 소개해주세요");
							}
							
							if(other.getPart().equals("busker")) {
					%>
						<p class="name"><i class="fas fa-music"></i>&nbsp;&nbsp;<%=other.getName() %></p>
					<%}else{ %>
						<p class="name"><%=other.getName() %></p>
					<%} %>
					
						<p class="exp"><%=other.getExp() %></p>
					
						<div class="option">
							<%
								if(other.getId().equals(userID)){
							%>
							<button onclick="location.href='deleteGo'" class="btn2">회원탈퇴</button>
							<button onclick="location.href='../profile/userModify.jsp'" class="btn2">정보수정</button>
							<%
								}else{
								
								}
							%>
						</div>
			</div>
						
		</div>
		
	</div>
	
</div>	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
