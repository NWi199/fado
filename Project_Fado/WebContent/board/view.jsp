<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.Board" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<style>
	.btn2 {
		background: rgb(52, 152, 219); width:60px;height:30px;
	}
	.board {
	width:80%; text-align: center; margin: 0 auto;padding-top:50px;}
</style>
<%@ include file = "../header.jsp" %>
<body>

<%
			int idx = 0;
			if (request.getParameter("idx") != null) {
				idx = Integer.parseInt(request.getParameter("idx"));
			}
			if (idx == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글 입니다.')");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
			BoardDAO db = new BoardDAO();
			Board board = db.getBD(idx);
			db.hit(idx, board.getHit());
			
		%>
	<div class="content">
		<div class="board container">
		<div class="row" >
			<table border="1" class="table" style="width:100%;background-color:white;">
				<tbody >
					<tr>
						<td style="width:20%;">제목</td>
						<td colspan="4" align=left><%= board.getTitle()%></td>
					</tr>
					<tr>
						<td style="width:20%;">작성일</td>
						<td colspan="2" align=left><%= board.getDate().substring(0, 11) + board.getDate().substring(11, 13) + "시" + board.getDate().substring(14, 16) + "분" %></td>
						<td> 조회수 </td>
						<td> <%= board.getHit()+1 %> </td>
					</tr>
					<tr>
			 			<td colspan="5" align=left style="min-height: 200px;"><%= board.getContent() %></td>
					</tr>
				</tbody>
			</table>
		
			<a href = "board_list.jsp?type=<%= board.getType() %>" class="btn2 pull-right">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(board.getUserID())){ 
				%>
						<a href="update.jsp?idx=<%= idx %>" class="btn2 pull-right">수정</a>
						<a href="boardDelete?idx=<%= idx %>" class="btn2 pull-right">삭제</a>
				<%					

					}
				%>
			
		</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
