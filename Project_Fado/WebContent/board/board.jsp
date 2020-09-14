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
</style>
<body oncontextmenu='return false' ondragstart='return false'>

	<div class="content">
		<div class="row" style="margin: 20px;">
			<div class="col-md-12" style="background: white;padding:30px;margin-top:20px;">
				<div style="display: inline-block;width:260px;background:pink;">
					<h4>실시간차트</h4>
					<div style="padding-left:30px;">
					<%
                   		BoardDAO db = new BoardDAO();
	                    ArrayList<Board> list = db.getPop("all", 7);
						for(int i=0; i<list.size(); i++){
							out.print(i+1);
							out.print(". ");
                %>
                
                
                
					<a style="text-align:left;" href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a><br />
					<%
						}
						%>
						</div>
				</div>
				<div style="display: inline-block;width:260px;margin-left:20px;background:pink;">
					<h4>주간인기글</h4>
					<div style="padding-left:30px;">
					<%
	                   list = db.getPop("all", 7);
						for(int i=0; i<list.size(); i++){
							out.print(i+1);
							out.print(". ");
                %>
					<a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a><br />
					<%
						}
						%>
					</div>
				</div>
				<div style="display: inline-block;width:260px;margin-left:20px;background:pink;">
					<h4>HOT게시글</h4>
					<div style="padding-left:30px;">
					<%
	                   list = db.getPop("all", 7);
						for(int i=0; i<list.size(); i++){
							out.print(i+1);
							out.print(". ");
                %>
					<a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a><br />
					<%
						}
						%>
						</div>
				</div>
			</div>
			<div class="col-md-12" style="background: blue;margin-top:20px;">
				<div style="background:white;width:900px;height:60px;border-radius: 30px;font-size:1.3em;margin-top:10px;margin-bottom:10px;">
					<input type="text" style="width:800px;">
					<i class="fas fa-search fa-2x"></i>
					
				</div>
			</div>
			<div class="col-md-4" style="margin: 0px auto; padding: 0px auto;">
				<table class="table">
					<thead>
						<tr>
							<th>전체 게시판 ></th>
						</tr>
					</thead>

					<tbody>
						<%
                       		list = db.getPop("all", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
						<tr>
							<td><a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
						</tr>
						<%
							}
                        %>

					</tbody>

				</table>

			</div>
			<div class="col-md-4" style="margin: 0px auto; padding: 0px auto;">
				<table class="table">
					<thead>
						<tr>
							<th>자유 게시판 ></th>
						</tr>
					</thead>

					<tbody>
						<%
                       		list = db.getPop("free", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
						<tr>
							<td><a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
						</tr>
						<%
							}
                        %>

					</tbody>

				</table>
			</div>
			<div class="col-md-4" style="margin: 0px auto; padding: 0px auto;">
				<table class="table">
					<thead>
						<tr>
							<th>버스커게시판 ></th>
						</tr>
					</thead>

					<tbody>
						<%
                       		list = db.getPop("busk", 4);
                       		for(int i=0; i<list.size(); i++){
                       %>
						<tr>
							<td><a href="board/view.jsp?idx=<%= list.get(i).getIdx() %>">
									<%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
						</tr>
						<%
							}
                        %>

					</tbody>

				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
