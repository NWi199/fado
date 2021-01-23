<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=yes" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js"
	crossorigin="64de5f242b"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="shortcut icon" type="image⁄x-icon" href="image/favicon.png">

</head>

<style>
a{
	color:black;
}
h3 {
	font-size: 1.5em;
	font-weight: bold;
}
iframe {
  z-index: 1;
  top: 0;
  left: 0;
  position: absolute;
  width: 100%;
  height: 100%;
}

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

.table {
	height: 200px;
	background: white;
	width: 100%;
	padding-right: 0px;
	float: right;
	border-radius: 30px;
}

.table thead {
	text-align: center;
	height: 18px;
	font-size: 1.15em;
	width: 100%;
}

.table td {
	width: 100%;
	height: 18px;
	float: left;
}

.table a {
	padding-left: 20px;
}

.video {
	
  width: 100%;
  background-color: #f0f0f0;
}

.video-container {
  position: relative;
  width: 100%;
  height: auto;
  padding-top: 70%;
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
	}

	.play {width:100%;height:530px;padding-bottom:20px;background:Black;margin-top:20px;margin-left:20px;margin-bottom:20px;}
	.favorite {background: YELLOW;width:100%; height: 150px;margin-left:20px;margin-bottom:20px;}
	.login {width: 90%;height: 170px;margin-top:20px;margin-left:10px;padding-top:20px;background:white;border-radius:30px;}
	.chart {width:90%;height:345px;text-align:center;background:white;padding-top:10px;padding-bottom:15px;margin-top:20px;margin-left:10px;border-radius:30px;}
	.boardSet{margin-right:20px;color:black;padding-left:40px;padding-right:40px;}
	.sche{width:100%;background:white;min-height:250px;border-radius:30px;margin-left:20px;margin-bottom:20px;padding-top:15px;padding-bottom:15px;padding-left:30px;}
	.list{min-height:250px;background:white;border-radius: 30px;margin-bottom:20px;margin-right:20px;padding-top: 10px;padding-bottom: 15px;padding-left:20px;}
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	
	.content {
		margin: 0 auto;
		margin-top: 30px;
		background-color: rgb(174, 211, 229);
		width: 100%;
		height: 100%;
	}
	
	.play{width:100%;padding-bottom:20px;background:Black;margin-top:20px;margin-bottom:10px;}
	.favorite {background:YELLOW;width:100%;height: 150px;margin-bottom:20px;}
	.login {width:100%;height:170px;margin-top:20px;padding-top:20px;background:white;border-radius:30px;}
	.chart {width:100%;height:345px;text-align:center;background:white;padding-top:5px;padding-bottom:15px;margin-top:20px;border-radius:30px;}
	.boardSet{margin-top:20px;color:black;}
	.sche{width:100%;background:white;min-height:250px;border-radius:30px;margin-top:20px;margin-bottom:20px;padding-top:15px;padding-bottom:15px;padding-left:30px;}
	.list{min-height:250px;background:white;border-radius:30px;margin-bottom:20px;padding-top: 10px;padding-bottom: 15px;padding-left:20px;}
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
		<a class="above_menu" href="login/login.jsp">로그인</a> <a
			class="above_menu" href="login/join.jsp">회원가입</a>
		<%
			} else {
		%>
		<a class="above_menu" href="logoutGo">로그아웃</a> <a class="above_menu"
			href="profile/mypage.jsp?otherID=<%=user.getId() %>">MyPage</a>
		<%
			}
		%>
	</div>
	<hr width="100%"
		style="margin: 0; border: solid 1px lightgray;">
	<div class="logo">
		<a href="index.jsp"><img src="image/logo3.PNG" alt="fado"></a>
	</div>
	<div class="nav">
		<ul id="main">
			<li><button class="btn" onclick="location.href='board/board.jsp'">Board</button>		
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='schedule/schedule.jsp'">Schedule</button></li>
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='#'">PlayList</button></li>
				<li style="margin-left: 30px;"><button class="btn"
						onclick="location.href='notice/notice.jsp'">Notice</button></li>
		</ul>
	</div>
</div>

<div class="mo container-fluid"> 
	<div id="nav">
		<ul class="menu">
			<li><i class="fas fa-bars fa-2x" style="display:inline;float:left;margin-top:10px;color:rgb(174, 211, 229);"></i>
			<ul class="sub">
			<%
			if (userID == null) {
		%>
				<li><a href="login/login.jsp">로그인</a>
				<li><a href="login/join.jsp">회원가입</a>	
					<%
			} else {
		%>
			<li><a href="logoutGo">로그아웃</a>
				<li><a href="profile/mypage.jsp">MyPage</a>	
				<%
			}
		%>
				<li><a href="board/board.jsp">Board</a>		
			<li><a href="schedule/schedule.jsp">Schedule</a></li>
			<li><a href="#">PlayList</a></li>
			<li><a href="notice/notice.jsp">Notice</a></li>
			</ul>
			</li>
		</ul>
	</div>
	
	<div class="logo">
		<a href="index.jsp"><img src="image/logo3.PNG" alt="fado"></a>
	</div>
	<hr width="100%"
		style="margin: 0; border: solid 1px lightgray;">
</div>
</header>


<body>
	<div class="content container-fluid">
		<div class="row">
			<div class="col-md-8">
						<div class="play">
						    <div class="video-container">
						      <iframe width="100%" height="100%" src="https://www.youtube.com/embed/eitDnP0_83k?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						    </div>
						</div>
			</div>
		

			<div class="col-md-4">
					<div class="login">
						<%
							if (userID == null) {
						%>
						<div style="text-align: center;">
							<button onclick="location.href='login/login.jsp'" class="btn2"
								style="width:70%; height:70px; margin:0 auto;margin-top:10px;border-radius: 20px;font-size:1.2em;font-weight:bold;">로그인</button>
						</div>
						<div style="text-align:center;marign:0 auto;padding:15px 25px 0px 25px;"><a href="login/join.jsp">회원가입</a>&nbsp;|&nbsp;<a href="profile/userSearch.jsp">회원정보찾기</a></div>

						<%
							} else {
						%>
						<div style="text-align:center;">
							<div>
								<h3><%=user.getName()%>님
								</h3>
								<%=user.getEmail()%>
							</div>
							<div style="padding-top:20px;">
								<button onclick="location.href='profile/mypage.jsp?otherID=<%=userID %>'" class="btn2" style="width:100px;font-weight:bold;">MyPage</button>
								<button onclick="location.href='logoutGo'" class="btn2" style="width:100px;font-weight:bold;">로그아웃</button>
							</div>

						</div>

						<%
							}
						%>
					</div>
					<div class="chart">
						<h3>실시간차트</h3>
						<div style="font-size:1.15em;float:left;padding-left:40px;text-align:left;padding-top:12px;">
							<%
								BoardDAO db = new BoardDAO();
								ArrayList<Board> list = db.getPop("all", 10);
								for (int i = 0; i < list.size(); i++) {
									out.print(i + 1);
									out.print(". ");
							%>
							<a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n", "<br>")%></a><br />
							<%
								}
							%> 
						</div>
					</div>
				</div>

			<div class="boardSet col-md-12">
				<div class="row">
			<div class="col-md-4">
				<table class="table">
					<thead>
						<tr >
							<th><a href="board/board_list.jsp?type=all">전체 게시판 &nbsp;&nbsp;<i
									class="fas fa-angle-right"></i></a></th>
						</tr>
					</thead>
					
					<tbody>
						<%
							list = db.getPop("all", 4);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>

			</div>
			<div class="col-md-4">
				<table class="table">
					<thead>
						<tr>
							<th><a href="board/board_list.jsp?type=free">자유 게시판 &nbsp;&nbsp;<i
									class="fas fa-angle-right"></i></a></th>
						</tr>
					</thead>

					<tbody>
						<%
							list = db.getPop("free", 4);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>
			</div>
			<div class="col-md-4">
				<table class="table">
					<thead>
						<tr>
							<th><a href="board/board_list.jsp?type=busk">버스커게시판 &nbsp;&nbsp;<i
									class="fas fa-angle-right"></i></a></th>
						</tr>
					</thead>

					<tbody>
						<%
							list = db.getPop("busk", 4);
							for (int i = 0; i < list.size(); i++) {
						%>
						<tr>
							<td><a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>">
									<%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>
			</div>
			</div>
		</div>
			<div class="col-md-5">
				<div class="sche">
					<a href="schedule/schedule.jsp" style="font-size:1.8em;font-weight:bold;">Schedule &nbsp;&nbsp;<i class="fas fa-angle-right"></i></a>
					<div>
						<h2>Today</h2>
							<ul>
								<%
								// 오늘 날짜로 달력 취득
								Calendar currentCal = Calendar.getInstance();
								// 현재 '년'을 취득
								int year = currentCal.get(Calendar.YEAR);
								// 현재 '월'을 취득(0월 부터 11월 까지)
								int month = currentCal.get(Calendar.MONTH);
								// 현재 '일'을 취득
								int day = currentCal.get(Calendar.DATE);
									ScheDAO schedb = new ScheDAO();
									String eDate = year+"-"+(month+1)+"-"+(day);
									ArrayList<Schedule> slist = schedb.getList(eDate);
									if(slist.size()>0){
										for (int i = 0; i < slist.size(); i++) {
								%>
								<li><%=slist.get(i).getTitle()%></li>
								<%
										}
									}
									else{
										
								%>
								<li>공연이 없어요</li>
								<%		
									}
								%>
							</ul>
						<h2>Tomorrow</h2>
							<ul>
								<%
									eDate = year+"-"+(month+1)+"-"+(day+1);
									slist = schedb.getList(eDate);
									if(slist.size()>0){
										for (int i = 0; i < slist.size(); i++) {
								%>
								<li><%=slist.get(i).getTitle()%></li>
		
								<%
										}
									}
									else{
										
								%>
								<li>공연이 없어요</li>
								<%		
									}
								%>
							</ul>
					</div>
					
				</div>
			</div>
			<div class="col-md-7">
				<div class="list">
					<a href="#" style="font-size:1.8em;font-weight: bold;">PlayList &nbsp;&nbsp;<i class="fas fa-angle-right"></i></a>
					<img alt="준비중이에요">
				</div>
			</div>
		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jcryption.3.1.0.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>
</body>
</html>
