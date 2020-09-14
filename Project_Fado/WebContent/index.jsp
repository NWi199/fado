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
<script src="https://kit.fontawesome.com/64de5f242b.js" crossorigin="64de5f242b"></script>
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
	color: rgb(64, 64, 64);
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
	border-radius: 20px;
	box-shadow: 5px 5px 15px 10px gray;
}

.block1 {
	width:650px;
	height:500px;
	margin:20px 15px 0px 20px;
}
.block2{
	margin:20px auto;
	width:255px;
	height:500px;
}
.block2 h3 {
	font-size:1.5em;
	font-weight:bold;
}
.block3 {
margin-left:100px;
	background:grey;
}
.login {
width: 253px; margin: 0 auto; height: 200px; padding-top:20px; background:white;
border-radius: 30px;
}
.login a {
	color:black;
}
.chart{
width: 253px; margin: 0 auto; height:285px; text-align: center;background:white; padding-top:20px; padding-bottom:15px;margin-top:15px;
border-radius: 30px;
}
.chart a {
	color:black;
}
.table {
height: 200px; background: white;width:100%;padding-right:0px;float:right;
border-radius: 30px;
}
.table thead{
text-align:center;height:18px;font-size: 1.2em;width:100%;
}
.table td{
	width:100%;height:18px;float:left;
}
.table a{
	padding-left:20px;
}
.schadule{
	background:white; padding-top:20px;border-radius: 30px;
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
		<a class="above_menu" href="login/login.jsp">로그인</a>
		<a class="above_menu" href="login/join.jsp">회원가입</a>
		<%
			} else {
		%>
		<a class="above_menu" href="logoutGo">로그아웃</a>
		<a class="above_menu" href="profile/mypage.jsp">MyPage</a>
		<%
			}
		%>
		<a class="above_menu" href="">현재접속자</a>
	</div>
	<hr width="100%" color="grey"  style="margin: 0;border: solid 1px lightgray;">
	<div class="logo">
		<a href="index.jsp"><img src="image/logo3.PNG" alt="fado"></a>
	</div>
	<div class="nav">
		<ul id="main">
			<li><button class="btn" onclick="location.href='board/board.jsp'">Board</button>
			<!--
				<ul id="sub">
					<li><a class="btn" href="board/board_list.jsp?type=all">전체게시판</a></li>
					<li><a class="btn" href="board/board_list.jsp?type=free">자유게시판</a></li>
					<li><a class="btn" href="board/board_list.jsp?type=busk">버스커게시판</a></li>
				</ul>
				 -->
			</li>

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
			<div class="col-md-8 ">
				<div class="block1">
					<div class="play" style="height:350px; padding-bottom:20px; background:Black;">비디오</div>
					<div class="favorite" style="background: YELLOW; height:150px;">좋아하는 버스커</div>
				</div>

			</div>

			<div class="col-md-4" >
				<div class="block2">
				<div class="login">
					<%
                    	if(userID==null){
                    %>
					<div style="text-align:center;">
						<h3>로그인</h3>
						<button onclick="location.href='login/login.jsp'" style="width:200px;height:60px;margin:0 auto;margin-top:10px;">로그인</button>
						</div>
						<div style="marign:0 auto; padding:15px 25px 0px 25px;">
							<a style="float:left;" href="login/join.jsp">회원가입</a>
							<a style="float:right;" href="login/search.jsp">정보찾기</a>
						</div>

					<%
                    }else{
                %>
					<div style="padding-top: 30px;">
						<div>
							<h3><%=user.getName() %>님
							</h3>
							<%=user.getEmail() %>
						</div>
						<div>
							<a href="profile/mypage.jsp" class="btn2">MyPage</a> <a
								href="logoutGo" class="btn2">로그아웃</a>
						</div>

					</div>

					<%
                    }
                %>
				</div>
				<div class="chart">
						<h3>실시간차트</h3>
						<div style="font-size:1.2em;float:left;padding-left:40px;text-align:left;">
							<%
                   		BoardDAO db = new BoardDAO();
	                    ArrayList<Board> list = db.getPop("all", 7);
						for(int i=0; i<list.size(); i++){
							out.print(i+1);
							out.print(". ");
                   		%>
						<a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a><br />
						<%
						}
						%>
						</div>
				</div>
				</div>
			</div>


			<div class="col-md-4" style="background:green;margin:0px auto;padding:0px auto;">
					<table class="table">
						<thead>
							<tr>
								<th><a href="board/board_list.jsp?type=all">전체 게시판<i class="fas fa-angle-right"></i></a></th>
							</tr>
						</thead>

						<tbody>
							<%
                       		list = db.getPop("all", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
							<tr>
								<td>
								<a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
							</tr>
							<%
							}
                        %>

						</tbody>

					</table>

			</div>
			<div class="col-md-4" style="background:green;margin:0px auto;padding:0px auto;">
					<table class="table">
						<thead>
							<tr>
								<th><a href="board/board_list.jsp?type=free">자유 게시판<i class="fas fa-angle-right"></i></a></th>
							</tr>
						</thead>

						<tbody>
							<%
                       		list = db.getPop("free", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
							<tr>
								<td>
								<a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
							</tr>
							<%
							}
                        %>

						</tbody>

					</table>
			</div>
			<div class="col-md-4" style="background:green;margin:0px auto;padding:0px auto;">
					<table class="table">
						<thead>
							<tr>
								<th><a href="board/board_list.jsp?type=busk">버스커게시판<i class="fas fa-angle-right"></i></a></th>
							</tr>
						</thead>

						<tbody>
							<%
                       		list = db.getPop("busk", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
							<tr>
								<td>
								<a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"> <%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
							</tr>
							<%
							}
                        %>

						</tbody>

					</table>
			</div>


		<div class="col-md-5">
			<div class="schedule">
				<h2>Schedule > </h2>
				<h1>Today</h1>
				<ul>
				<%
					ScheDAO schedb = new ScheDAO();
					String eDate = "2020-07-20";
					ArrayList<Schedule> slist = schedb.getList(eDate);
					for(int i=0;i<slist.size();i++){
				%>
						<li><%=slist.get(i).getTitle() %></li>

				<%
					}
				%>
				</ul>
				<h1>Tomorrow</h1>
				<ul>
				<%
					eDate = "2020-07-21";
					slist = schedb.getList(eDate);
					for(int i=0;i<slist.size();i++){
				%>
						<li><%=slist.get(i).getTitle() %></li>

				<%
					}
				%>
				</ul>
			</div>
		</div>
		<div class="col-md-7">
			<div class="list" style="background: grey;">플레이리스트</div>
		</div>
		</div>


	</div>

	<script>

        var slideIndex = 0;
    showSlides();

    function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
           slides[i].style.display = "none";
        }
        slideIndex++;
        if (slideIndex > slides.length) {slideIndex = 1}
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";
        dots[slideIndex-1].className += " active";
        setTimeout(showSlides, 2000); // Change image every 5 seconds
    }
</script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="js/jcryption.3.1.0.js"></script>

</body>
</html>
