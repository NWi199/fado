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
.tableSet{
margin-left: 20px; margin-right: 20px; color: black;
}
.search {
background: rgb(52, 152, 219); margin-top: 50px; margin-left: 20px; margin-right: 20px;margin-bottom:30px; border-radius: 30px;
}

.insearch{
background: white; width: 90%; height: 60px; border-radius: 30px; font-size: 1.3em; margin-top: 10px; margin-bottom: 10px; border: 0; margin-left: 20px;
}
}

@media (min-width: 320px) and (max-width: 480px){ 
.tableSet{
color: black;
}
.search {
background: rgb(52, 152, 219); margin-top: 50px;margin-bottom:30px; border-radius: 30px;
}

	.insearch{
background: white; width:75%; height: 60px; border-radius: 30px; font-size: 1.3em; margin-top: 10px; margin-bottom: 10px; border: 0; margin-left: 20px;
}
}

</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<%
		BoardDAO db = new BoardDAO();
		ArrayList<Board> list = null;
	%>
	<div class="content container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="search">
					<input class="insearch" type="text" placeholder="통합검색">
					<button class="searchenter" type="submit">Enter</button>
				</div>
			</div>

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
</body>
</html>
