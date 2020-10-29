<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.BoardDAO"%>
<%@ page import="model.Board"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../header.jsp"%>
<style>
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

.searchenter{
background: rgb(52, 152, 219); font-size: 1.2em; font-weight: bold; border: 0; width: 50px; height: 60px;
}

@media (min-width: 768px) {
	.mo {display:none;}
	.tableSet{
	margin-left: 20px; margin-right: 20px; color: black;
	}
	.search {
	background: rgb(52, 152, 219); margin-top: 50px; margin-left: 20px; margin-right: 20px;margin-bottom:30px; border-radius: 30px;
	}
	
	.insearch{
	background: white; width: 90%; height: 60px; border-radius: 30px; font-size: 1.3em; margin-top: 10px; margin-bottom: 10px; border: 0; margin-left: 20px;
	}
	.write{width:1050px;;height:40px;background:rgb(52, 152, 219);color:white;font-size:1.3em;font-weight:bold;border:0px;border-radius:10px;margin-left:20px;margin-bottom:30px;}
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	.tableSet{color: black;}
	.search {background: rgb(52, 152, 219);width:100%; margin-top: 50px;margin-bottom:30px; border-radius: 30px;}
	.insearch{background: white; width:70%; height: 60px; border-radius: 30px; font-size: 1.3em; margin-top: 10px; margin-bottom: 10px; border: 0; margin-left: 20px;}
	.write{width:100%;height:40px;background:rgb(52, 152, 219);color:white;font-size:1.3em;font-weight:bold;border:0px;border-radius:10px;margin-bottom:30px;}
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<%
		BoardDAO db = new BoardDAO();
		ArrayList<Board> list = null;
	%>
	<div class="content container-fluid" > 
		<div class="row">
			<div class="col-md-12">
				<form class="search" name="f" method="post" action="search_list.jsp">
					<input class="insearch" type="text" name="word" placeholder="통합검색" value="<% if(request.getParameter("word") != null ) { %><%=request.getParameter("word")%><% }  %>">
					<button class="form-control btn2" type="submit" style="border:0px;font-size:1.1em;">enter</button>
					<input class="form-control" type="hidden" name="col" value="none">
				</form>
			</div>
			<%
				if (userID != null) {
			%>
				<div class="col-md-12">
					<button type="button" class="write" onclick="location.href='write.jsp'">글쓰기</button>
				</div>
				<%
				}else{
					
				}
			%>
	
			<div class="tableSet">
				<div class="col-md-4">
					<table class="table">
						<thead>
							<tr>
								<th><a href="board_list.jsp?type=all">전체 게시판
										&nbsp;&nbsp;<i class="fas fa-angle-right"></i>
								</a></th>
							</tr>
						</thead>
						<tbody>
							<%
								list = db.getPop("all", 4);
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><a href="view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<div class="col-md-4" >
					<table class="table">
						<thead>
							<tr>
								<th><a href="board_list.jsp?type=free">자유 게시판
										&nbsp;&nbsp;<i class="fas fa-angle-right"></i>
								</a></th>
							</tr>
						</thead>
						<tbody>
							<%
								list = db.getPop("free", 4);
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><a href="view.jsp?idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replace("\n", "<br>")%></a></td>
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
								<th><a href="board_list.jsp?type=busk">버스커게시판
										&nbsp;&nbsp;<i class="fas fa-angle-right"></i>
								</a></th>
							</tr>
						</thead>

						<tbody>
							<%
								list = db.getPop("busk", 4);
								for (int i = 0; i < list.size(); i++) {
							%>
							<tr>
								<td><a href="view.jsp?idx=<%=list.get(i).getIdx()%>">
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
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script>
	var quick_menu = $('#quick');
	var quick_top = 300;

	quick_menu.css('top', $(window).height() );
	$(document).ready(function(){
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 100 ); 
	$(window).scroll(function(){
	quick_menu.stop();
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 300 );
	});
	});</script>
</body>
</html>
