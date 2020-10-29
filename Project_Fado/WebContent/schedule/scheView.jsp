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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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
.nav {
		margin-top: 30px;
}
.nav ul {
	width: 100%;
	list-style: none;
	text-align: center;
	margin: 0;
	padding: 0;
}
.btn2 {
	background: rgb(52, 152, 219);
	width: 60px;
	height: 40px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
	border:0px;
}
.day{display:inline-block;font-size:3em;color:black;}
@media (min-width: 768px) {
	.mo {display:none;}
	table {
		table-layout: fixed;
		width:120px;
	}
	.calView{
		width:30%; margin: 0 auto; text-align: center; margin-top: 20px;background:white;margin-bottom:50px;
	}
	.exp{text-align:left;margin:0 auto;margin-top: 22px;margin-bottom:30px;padding:20px;width:400px;height:200px;border:1px solid lightgray;border-radius:20px;}
	
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	table {
		table-layout: fixed;
		width:30px;
	}
	.calView{
		width:80%; margin: 0 auto; text-align: center; margin-top: 20px;background:white;margin-bottom:50px;
	}
	.exp{text-align:left;margin:0 auto;margin-top: 22px;margin-bottom:30px;padding:20px;width:300px;height:200px;border:1px solid lightgray;border-radius:20px;}
}

#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:1.1em;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:rgb(174, 211, 229); }

</style>
<header>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>
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
	
	<div class="pc" style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">일정 관리</div>
		<div style="display: inline;margin-left:10px;">
			<button type="button" onclick="location.href='../profile/mypage.jsp'">MyPage</button>
			<button type="button" onclick="location.href='schedule.jsp'">Schedule</button>
		</div>
	</div>
	
	<div class="mo">
		<div id="nav">
		<ul class="menu" >
			<li><i class="fas fa-bars fa-2x" style="display:inline;float:left;margin-left:20px;color:rgb(174, 211, 229);"></i>
			<ul class="sub">
			<%
			if (userID == null) {
		%>
				<li><a href="../login/login.jsp">로그인</a>
				<li><a href="../login/join.jsp">회원가입</a>	
					<%
			} else {
		%>
			<li><a href="logoutGo">로그아웃</a>
				<li><a href="../profile/mypage.jsp">MyPage</a>	
				<%
			}
		%>
		<li><a href="../index.jsp">Home</a></li>
				<li><a href="../board/board.jsp">Board</a>		
			<li><a href="../schedule/schedule.jsp">Schedule</a></li>
			<li><a href="#">PlayList</a></li>
			<li><a href="#">Notice</a></li>
			</ul>
			</li>
		</ul>
	</div>
		<div style="font-weight: bold; font-size:1.5em;text-align:center;margin-top:20px;">일정 관리</div>
	</div>
	<hr>
	
</header>
<body oncontextmenu='return false' ondragstart='return false'>

	<div class="calView">
			<div style="font-size: 3em; display: inline; color: black;font-weight:bold"><%=sche.getDate() %></div>
		<div style="margin-top:22px;">
			<div style="font-size: 1.9em; color:black; font-weight:bold"><%=sche.getTitle() %></div>
			<div style="font-size: 1.3em; color:black; font-weight:bold"><%=sche.getStart() %> ~ <%=sche.getEnd() %></div>
			<div style="font-size: 1.4em; color:black; font-weight:bold"><%=sche.getBusker() %></div>
		</div>
		<div style="margin-top:30px;">
			
			<div style="margin-top: 22px;font-size:1.2em;">[ 공연 장소  ]<br></div>
			<p style="font-size:1.1em;margin-top: 10px;font-size:1.3em;font-weight:bold;"><%=sche.getPlace() %></p>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac20883815fd8d97f4c6123a45c085a7&libraries=services"></script>
			<script>
			</script>
		</div>
		
		<div ><%=sche.getDetail() %></div>
		<div class="exp"><%=sche.getExp() %></div>
		<div style="display:inline;font-size:1.1em;">
			<%
			if(userID!=null && user.getPart().equals("busker")) {
			%>
			<button class="btn2" type="button" onclick="location.href='scheList.jsp'">목록</button>
			<button class="btn2" type="button" onclick="location.href='scheUpdate.jsp?idx=<%=sche.getId() %>'">수정</button>
			<button class="btn2" type="button"  onclick="location.href='scheDelete?idx=<%=sche.getId() %>'">삭제</button>
			<%
			}else{
			%>
				<button class="btn2" type="button" onclick="location.href='schedule.jsp'">목록</button>
			<%
			}
			%>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

</body>
</html>
