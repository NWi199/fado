<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.Schedule"%>
<%@ page import="model.ScheDAO"%>
<%@ page import="model.UserDAO"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js"
	crossorigin="64de5f242b"></script>

</head>
<style>
a:hover {
	text-decoration: none;
}

.logo {
	margin-left: 10%;
	font-size: 4em;
	padding-top: 100px;
}
.calView{
	width:450px;
	height:100%;
	margin: 0 auto;
	text-align:center;
	margin-top:80px;
	font-size:1.3em;
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
<%
			int idx = 0;
			if (request.getParameter("idx") != null) {
				idx = Integer.parseInt(request.getParameter("idx"));
			}
			if (idx == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 일정입니다.')");
				script.println("location.href = 'scheList.jsp'");
				script.println("</script>");
			}
			ScheDAO db = new ScheDAO();
			Schedule sche = db.getSche(idx);
			
			UserDAO userdb = new UserDAO();
			String userID = (String) session.getAttribute("id");
			User user = userdb.info(userID);
		%>
		
	
	<div style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">일정 관리</div>
		<i style="margin-left:15px" class="fas fa-bars fa-2x"></i>
	</div>
	<hr>
	
	<div class="calView">
		<div>
			
			<div style="font-size: 3em; display: inline; color: black;"><%=sche.getDate() %></div>
		</div>
		<div style="margin-top:22px;">
			<div style="font-size: 1.8em; color:black; font-weight:bold"><%=sche.getTitle() %></div>
			<div style="font-size: 1.3em; color:black; font-weight:bold"><%=sche.getStart() %> ~ <%=sche.getEnd() %></div>
			<div style="font-size: 1.3em; color:black; font-weight:bold"><%=sche.getBusker() %></div>
		</div>
		<div style="text-align:left; margin-top: 22px;"> 공연 장소 : <%=sche.getPlace() %>  <i class="fas fa-angle-down fa-2x"></i></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac20883815fd8d97f4c6123a45c085a7&libraries=services"></script>
<script>
</script>
		<div ><%=sche.getDetail() %></div>
		<div style="margin-top: 22px;"><%=sche.getExp() %></div>
		<div style="display:inline;">
		
			<%
			if(userID!=null && user.getPart().equals("busker")) {
			%>
			<a href="scheUpdate.jsp?idx=<%=sche.getId() %>">수정</a>
			<a href="scheDelete?idx=<%=sche.getId() %>">삭제</a>
			<%
			}
			%>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

</body>
</html>
