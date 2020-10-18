<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js"
	crossorigin="64de5f242b"></script>
</head>

<style>
a{
	color:black;
}
.above {
	width: 960px;
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

.content {
	margin: 0 auto;
	margin-top: 30px;
	background-color: rgb(174, 211, 229);
	width: 960px;
	height: 100%;
	border-radius: 20px;
	box-shadow: 5px 5px 15px 10px gray;
}

h3 {
	font-size: 1.5em;
	font-weight: bold;
}

.block3 {
	margin-left: 100px;
	background: grey;
}


.login a {
	color: black;
}

.chart {
	
}

.chart a {
	color: black;
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

.schadule {
	background: white;
	padding-top: 20px;
	border-radius: 30px;
}
.video {
  width: 100%;
  background-color: #f0f0f0;
}

.video-container {
  position: relative;
  width: 100%;
  height: auto;
  padding-top: 50%;
}

iframe {
  z-index: 1;
  top: 0;
  left: 0;
  position: absolute;
  width: 100%;
  height: 100%;
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
		<a class="above_menu" href="login/login.jsp">로그인</a> <a
			class="above_menu" href="login/join.jsp">회원가입</a>
		<%
			} else {
		%>
		<a class="above_menu" href="logoutGo">로그아웃</a> <a class="above_menu"
			href="profile/mypage.jsp">MyPage</a>
		<%
			}
		%>
	</div>
	<hr width="100%" color="grey"
		style="margin: 0; border: solid 1px lightgray;">
	<div class="logo">
		<a href="index.jsp"><img src="image/logo3.PNG" alt="fado"></a>
	</div>
	<div class="nav">
		<ul id="main">
			<li><button class="btn"
					onclick="location.href='board/board.jsp'">Board</button></li>
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='schedule/schedule.jsp'">Schedule</button></li>
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='#'">PlayList</button></li>
			<li style="margin-left: 30px;"><button class="btn"
					onclick="location.href='#'">Notice</button></li>
		</ul>
	</div>
</header>

<body>
	<div class="content">
		<div class="row">
			<div class="col-md-8">
					<div class="play"
						style="width:100%;height: 350px; padding-bottom: 20px; background: Black; margin-top:20px; margin-left:20px; margin-bottom:10px;">
						<div class="video">
						    <div class="video-container">
						      <iframe width="100%" height="100%" src="https://www.youtube.com/embed/eitDnP0_83k?controls=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
						    </div>
						</div>
					</div>
					<div class="favorite" style="background: YELLOW;width:100%; height: 150px;margin-left:20px;margin-bottom:20px;">좋아하는
						버스커</div>
			</div>

			<div class="col-md-4">
					<div class="login" style="width: 90%;height: 170px;margin-top:20px;margin-left:10px;padding-top: 20px;background: white;border-radius: 30px;">
						<%
							if (userID == null) {
						%>
						<div style="text-align: center;">
							<button onclick="location.href='login/login.jsp'" class="btn2"
								style="width: 70%; height: 70px; margin: 0 auto; margin-top: 10px;border-radius: 20px;font-size:1.2em;font-weight:bold;">로그인</button>
						</div>
						<div style="text-align:center;marign: 0 auto; padding: 15px 25px 0px 25px;"><a href="login/join.jsp">회원가입</a>&nbsp;|&nbsp;<a>회원정보찾기</a></div>

						<%
							} else {
						%>
						<div style="text-align: center;">
							<div>
								<h3><%=user.getName()%>님
								</h3>
								<%=user.getEmail()%>
							</div>
							<div style="padding-top:20px;">
								<button onclick="location.href='profile/mypage.jsp'" class="btn2" style="width:100px;font-weight:bold;">MyPage</button>
								<button onclick="location.href='logoutGo'" class="btn2" style="width:100px;font-weight:bold;">로그아웃</button>
							</div>

						</div>

						<%
							}
						%>
					</div>
					<div class="chart" style="width: 90%;height: 315px;text-align: center;background: white;padding-top: 5px;padding-bottom: 15px;margin-top: 20px;margin-left:10px;border-radius: 30px;">
						<h3>실시간차트</h3>
						
						<div
							style="font-size: 1.15em; float: left; padding-left: 40px; text-align: left; padding-top: 10px;">
							<%
								BoardDAO db = new BoardDAO();
								ArrayList<Board> list = db.getPop("all", 10);
								for (int i = 0; i < list.size(); i++) {
									out.print(i + 1);
									out.print(". ");
							%>
							<a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a><br />
							<%
								}
							%>
						</div>
					</div>
				</div>

			<div style="margin-left:20px;margin-right:20px;color:black;">
			<div class="col-md-4" >
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
							<td><a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>

			</div>
			<div class="col-md-4"
				style="">
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
							<td><a href="board/view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>
			</div>
			<div class="col-md-4"
				style="">
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
									<%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
						</tr>
						<%
							}
						%>

					</tbody>

				</table>
			</div>
			</div>

			<div class="col-md-5">
				<div class="sche" style="width:100%;background:white;border-radius: 30px;margin-left:20px;margin-bottom:20px;padding-top:15px;padding-bottom: 15px;padding-left:30px;">
					<a href="schedule/schedule.jsp" style="font-size:1.8em;font-weight: bold;">Schedule &nbsp;&nbsp;<i class="fas fa-angle-right"></i></a>
					
					<div style="">
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
									String eDate = year+"-"+month+"-"+day;
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
									eDate = year+"-"+month+"-"+(day+1);
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
				<div class="list" style="width:100%;background:white;border-radius: 30px;margin-bottom:20px;margin-right:20px;padding-top: 10px;padding-bottom: 15px;padding-left:20px;">
					<a href="#" style="font-size:1.8em;font-weight: bold;">PlayList &nbsp;&nbsp;<i class="fas fa-angle-right"></i></a>
					<hr align="center" style="border: dashed 1px rgb(174, 211, 229);margin:0 auto;width:95%;">
					<div>준비중이에요</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jcryption.3.1.0.js"></script>

</body>
</html>
