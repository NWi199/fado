<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="model.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/64de5f242b.js" crossorigin="64de5f242b"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>
<title>fado</title>
</head>
<style>
a{
	color:black;
	text-decoration: none;
}
a:hover {text-decoration: none; }

.logo {
	font-size: 4em;
	padding-top: 30px;
	text-align: center;
}

	.above {
		width: 50%;
		height: 50px;
		padding-top: 15px;
		padding-bottom: 5px;
		text-align: right;
		margin: 0 auto;
	}
	.above_menu {
		padding-right: 15px;
		font-size: 0.95em;
		color: black;
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


.btn {
	width: 120px;
	height: 50px;
	color: rgb(64, 64, 64);
	text-align: center;
	background: rgb(224, 224, 224);
	display: inline-block;
	border-radius: 30px;
	font-size: 1.2em;
	font-weight: bold;
}

.btn2 {
	background: rgb(52, 152, 219);
	width: 60px;
	height: 30px;
	color: white;
	border-radius: 30px;
	display: inline-block;
	font-size: 0.9em;
	border:0;
}

.btn:hover {
	background: rgb(52, 152, 219);
	color: white;
}
@media (min-width: 768px) {
	.mo {display:none;}
	
	.content {
		margin: 0 auto;
		margin-top: 30px;
		background-color: rgb(174, 211, 229);
		width: 60%;
		height: 100%;
		border-radius: 20px;
		box-shadow: 5px 5px 15px 10px gray;
		padding-bottom:30px;
	}
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	
	.content {
		margin: 0 auto;
		margin-top: 30px;
		background-color: rgb(174, 211, 229);
		width: 100%;
		height: 100%;
		padding-bottom:30px;
	}
}
#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:1.1em;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:rgb(174, 211, 229); }

</style>

<header>
<%
			UserDAO userdb = new UserDAO();
			String userID = (String) session.getAttribute("id");
			User user = userdb.info(userID);
		%>
		<div class="pc container-fluid">
	<div class="above">
		<%
			if (userID == null) {
		%>
		<a class="above_menu" href="../login/login.jsp">로그인</a> <a
			class="above_menu" href="../login/join.jsp">회원가입</a>
		<%
			} else {
		%>
		<a class="above_menu" href="logoutGo">로그아웃</a> <a class="above_menu"
			href="../profile/mypage.jsp">MyPage</a>
		<%
			}
		%>
	</div>
	<hr width="100%"
		style="margin: 0; border: solid 1px lightgray;">
	<div class="logo">
		<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado"></a>
	</div>
	<div class="nav">
		<ul id="main">
			<li><button class="btn" onclick="location.href='../board/board.jsp'">Board</button>		
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='../schedule/schedule.jsp'">Schedule</button></li>
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='#'">PlayList</button></li>
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='#'">Notice</button></li>
		</ul>
	</div>
</div>

<div class="mo container-fluid"> 
	<div id="nav">
		<ul class="menu" >
			<li><i class="fas fa-bars fa-2x" style="display:inline;float:left;margin-top:10px;color:rgb(174, 211, 229);"></i>
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
				<li><a href="../board/board.jsp">Board</a>		
			<li><a href="../schedule/schedule.jsp">Schedule</a></li>
			<li><a href="#">PlayList</a></li>
			<li><a href="#">Notice</a></li>
			</ul>
			</li>
		</ul>
	</div>
</div>
</header>