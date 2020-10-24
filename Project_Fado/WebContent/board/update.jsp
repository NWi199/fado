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
	@media (min-width: 320px) and (max-width: 480px){ 
	.board {width:100%;text-align: center; margin: 0 auto;padding-top:50px;}
	}
</style>
<%@ include file = "../header.jsp" %>
<body>

<%
			//로그인 안한 경우
			if (userID == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인을 하세요.')");
				script.println("location.href = '../login/login.jsp'");
				script.println("</script>");
			}
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
			Board board = new BoardDAO().getBD(idx);
			if (!userID.equals(board.getUserID())) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("location.href = 'board_list.jsp'");
				script.println("</script>");
			}
		%>
	<div class="content">
		<div class="board container-fluid">
			<form action="boardUpdate?idx=<%=idx%>" method="post">
			<div>
			<div class="row" >
           <table border="1" class="table" style="width:100%;background-color:white;">
           <tbody>
	        			<tr>
	        				<td><select class="form-control" name="type" id="type">
	                           <option value="free">자유게시판</option>
	                           <option value="busk">버스커게시판</option>
            				</select></td>
	        			</tr>
	        			<tr>
	        				<td><input type="text" class="form-control" name="title" id="title" placeholder="제목" value="<%=board.getTitle()%>"></td>
	        			</tr>
	        			<tr>
	        			
	        				<td><textarea class="form-control" name="content" id="content" placeholder="내용" style="min-height:200px;"><%=board.getContent()%></textarea></td>
	        			</tr>
	        		</tbody>
	        		
			</table>
			<div class="btnSet">
				<a class="btn2 pull-right" href='board.jsp'>취소</a>
					<%
					//글작성자 본인일시 수정 삭제 가능 
						if(userID != null && userID.equals(board.getUserID())){ 
					%>
							<button type="submit" class="btn2 pull-right">수정</button>
					<%					
	
						}
					%>
				
			</div>
			</div>
			</div>
			
        	</form>
		</div>
			
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
