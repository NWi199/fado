<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
	<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.BoardDAO"%>
<%@ page import="model.Board"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file = "../header.jsp" %>
<body oncontextmenu='return false' ondragstart='return false'>
<%
	String typeName = null;
	String type = null;
	if (request.getParameter("type") != null) {
		type=request.getParameter("type");
		if(type.equals("all"))
			typeName = "전체게시판";
		else if(type.equals("free"))
			typeName = "자유게시판";
		else if(type.equals("busk"))
			typeName = "버스커게시판";
			
	}
	
	

%>
<div class="content">
	<div class="board container" style="width:80%; text-align: center; margin: 0 auto;padding-top:50px;">
		<h1 style="text-align:center; font-size:1.8em; padding-bottom: 20px;"><%= typeName %></h1> 
		<div class="row">
			<table class="table" style="background-color:white;" >
				<thead>
                    <tr>
                    <th >No.</th>
                    <th >작성자</th>
					<th >제목</th>
					<th >글내용</th>
					<th >작성일</th>
					<th >조회수</th>
					</tr>
				</thead>
				<tbody>
                    <% 
                    	BoardDAO db = new BoardDAO();
	                    ArrayList<Board> list = db.getList(type);
						for(int i=0; i<list.size(); i++){
					%>
					<tr>
	                    <td><%=list.get(i).getIdx() %></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
						<td><a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getContent() %> </a>
						<td><%=list.get(i).getDate() %></td>
						<td><%=list.get(i).getHit() %></td>
					</tr>
                   <%
						}
                   %>
                </tbody>
			</table>
			<%
				if (userID != null) {
			%>
			<button class="btn2 pull-right" onclick="location.href='write.jsp'">작성</button>
			<%
				}else{
				}
			%>
		</div>
	</div>
</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
