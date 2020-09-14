<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.UserDAO"%>
<%@ page import="model.User"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/64de5f242b.js" crossorigin="64de5f242b"></script>
<title>fado</title>
</head>
<style>
a:hover {
	text-decoration: none;
}

.above {
	width: 960px;
	height: 50px;
	padding-top: 15px;
	padding-bottom: 5px;
	text-align: right;
	margin : 0 auto;
}

.above_menu {
	padding-right: 15px;
	font-size: 0.95em;
	color: black;
}

.logo {
	font-size: 4em;
	padding-top: 30px;
	text-align: center;
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

#main li {
	position: relative;
	display: inline;
}

#sub {
	position: absolute;
	display: none;
	top: 30px;
	left: 0;
}

#sub li {
	display: inline-block;
	text-align: center;
	font-size: 0.95em;
}

#main li:hover #sub {
	display: block;
}

.btn {
	width: 120px;
	height: 50px;
	color: black;
	text-align: center;
	background: rgb(224, 224, 224);
	display: inline-block;
	border-radius: 30px;
	font-size: 1.2em;
	font-weight:bold;
	
}

.btn2 {
	background: rgb(52, 152, 219);
	width: 60px;
	height: 30px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
}

.btn:hover {
	background: rgb(52, 152, 219);
	color: white;
}
.content {
	margin: 0 auto;
	margin-top: 30px;
	background-color: rgb(174, 211, 229);
	width: 960px;
	height: 100%;
	box-shadow: 5px 5px 15px 10px gray;
	border-radius: 20px;
}
</style>
<header style="width: 100%; height: 100%;">
	<div class="above">
		<%
			UserDAO userdb = new UserDAO();
			String userID = (String) session.getAttribute("id");
			User user = userdb.info(userID);
			if (userID == null) {
		%>
		<a class="above_menu" href="../login/login.jsp">로그인</a> 
		<a class="above_menu" href="../login/join.jsp">회원가입</a>
		<%
			} else {
		%>
		<a class="above_menu" href="../logoutGo">로그아웃</a> 
		<a class="above_menu" href="../profile/mypage.jsp">MyPage</a>
		<%
			}
		%>
		<a class="above_menu" href="">현재접속자</a>
	</div>
	<hr width="100%" color="grey"  style="margin: 0;border: solid 1px lightgray;">
	<div class="logo">
		<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado"></a>
	</div>
	<div class="nav">
		<ul id="main">
			<li><button class="btn" onclick="location.href='../board/board.jsp'">Board</button>
			<!-- 
				<ul id="sub">
					<li><a class="btn" href="board/board_list.jsp?type=all">전체게시판</a></li>
					<li><a class="btn" href="board/board_list.jsp?type=free">자유게시판</a></li>
					<li><a class="btn" href="board/board_list.jsp?type=busk">버스커게시판</a></li>
				</ul>
				 -->
			</li>
				
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='../schedule/schedule.jsp'">Schedule</button></li>
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='#'">PlayList</button></li>
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='#'">Notice</button></li>
		</ul>
	</div>
</header>
