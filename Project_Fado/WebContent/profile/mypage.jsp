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
	.btn2{width:120px;padding-top:10px;font-weight:bold;height:40px;font-size:1.1em;}
	.intro{background:white;width:90%;height:200px;border-radius:100px;margin:0 auto;margin-top:50px;border:0px;}
	.option{margin-top:50px;margin-left:10px;width:200px;display:inline-block;text-align:center;}
	.exp{margin:20px;margin-left:50px;padding:20px;height:150px;width:500px;display:inline-block;text-align:left;font-size:1.1em;border:1px solid lightgray;border-radius:30px;}
	.name{margin-left:60px;margin-top:50px;width:150px;display:inline-block;text-align:center;}
	.place{width:90%;background:white;margin-top:30px;padding:20px;margin-left:60px;}
	@media (min-width: 768px) {
	
	}

@media (min-width: 320px) and (max-width: 480px){ 
	
	}
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="content">
	<div class="row">
		<div class="col-md-12"> 
			<table class="table intro">
				<tbody>
					<tr>
						<td class="name">
						<%
							String otherID = null;
							if (request.getParameter("otherID") != null) {
								otherID = request.getParameter("otherID");
							}
							User other = userdb.info(otherID);
							System.out.print(other.getId());
							if(other.getId().equals(userID)){
						%>
						<div style="font-size:2em;font-weight:bold;"><%=user.getName() %></div>
								<p style="margin-top:10px;color:blue;">팔로워 : 5</p> 
								<p style="margin-top:3px;color:blue;">팔로잉 : 5</p>
						<%	
							}else{
						%>
							<div style="font-size:2em;font-weight:bold;"><%=other.getName() %></div>
							<div  style="margin-top:10px;">
								<i class="far fa-heart fa-2x"  style="display:inline;"></i>
							<i class="far fa-thumbs-up fa-2x" style="display:inline;margin-left:20px;"></i>
							</div>
						<% 	} %>
					
						</td>
						<td class="exp">
							<p>dfadgadfadfasdgadfa</p>
						</td>
						<td class="option">
							<%
								if(other.getId().equals(userID)){
							%>
							<table class="table">
								<tbody>
									<tr>
										<td><a href="#" class="btn2">게시글관리</a></td>
									<tr>
										<td><a href="#" class="btn2">정보수정</a></td>
									</tr>
								</tbody>
							</table>
							<%
								}else{
							%>
							<i class="fas fa-airplane"></i>
							<% } %>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-5">
			<div class="place" style="">
				<div style="font-size:1.3em;font-weight:bold;">활동 지역</div>
			</div>
		</div>
		<div class="col-md-7">
			<div class="favorite" style="margin-left:10px;width:90%;background:white;margin-top:30px;padding:20px;">
				<a href="#" style="font-size:1.3em;font-weight:bold;">좋아하는 버스커 ></a>
			</div>
		</div>
		<%
			if(other.getPart().equals("busker")){
		%>
		<div class="col-md-12">
			<div class="followers" style="margin-left:60px;width:90%;background:white;margin-top:30px;padding:20px;">
				<a href="#" style="font-size:1.3em;font-weight:bold;">팔로워 ></a>
			</div>
		</div>
		<%
			}
		%>
	</div>
	
</div>	
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
