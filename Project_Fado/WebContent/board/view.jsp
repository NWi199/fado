<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<%@ include file = "../header.jsp" %>
<style>
	.btn2 {background: rgb(52, 152, 219); width:60px; height:30px;text-align:center;}
	.board {width:80%; }

@media (min-width: 320px) and (max-width: 480px){ 
	.board {width:100%; }
}
</style>
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
			
			String typeName = null;
			String type = null;
			
			if (board.getType() != null) {
				type=board.getType();
				if(type.equals("all"))
					typeName = "전체게시판";
				else if(type.equals("free"))
					typeName = "자유게시판";
				else if(type.equals("busk"))
					typeName = "버스커게시판";
			}
			
			
		%>
	<div class="content">
		<div class="board container-fluid">
			<div style="background:white; text-align: left; padding:30px;border-radius: 20px;margin-top:50px;margin-bottom:30px;">
				<div style="font-size:1.1em;margin-bottom:10px;"><a href="board_list.jsp?type=<%=board.getType() %>"><%=typeName %> ></a></div>
				
				<div style="margin-bottom:10px;">
					<div style="font-size:2em;font-weight:bold;width:100%;"><%=board.getTitle() %></div>
					<div class="dw" style="margin-bottom:10px;font-size:0.9em;width:100%;"><a href="../profile/mypage.jsp?otherID=<%= board.getUserName() %>"><%= board.getUserID() %></a> &nbsp; &nbsp; <%= board.getDate() %> &nbsp; 조회 : <%= board.getHit()+1 %> </div>
				</div>
				<div style="min-height:200px;margin-bottom:20px;padding:20px;font-size:1.1em;"><%= board.getContent() %></div>
			</div>
			<div class="btnSet" style="margin-bottom:40px;">
			<a href = "board_list.jsp?type=<%= board.getType() %>" class="btn2 pull-right" style="margin-left:10px;">목록</a>
					<%
					//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(board.getUserID())){ 
					%>
						<a href="update.jsp?idx=<%= idx %>" class="btn2 pull-right" style="margin-left:10px;">수정</a>
						<a href="boardDelete?idx=<%= idx %>" class="btn2 pull-right" style="margin-left:10px;">삭제</a>
					<%					

						}
					%>
		</div>
		<div style="margin-top:70px;">
			<%
				ArrayList<Comment> comlist = db.com_list(board.getIdx());
				String name=null;
				if((board.getCom_open()!=0)&&(comlist.size()!=0)){
				for(int i=0; i<comlist.size(); i++){
					if(board.getUserID().equals(comlist.get(i).getUser_id()))  name="작성자";
					else name=comlist.get(i).getUser_name();
			%>
			<div class="comment" style="background:white; text-align: left;padding:30px;border-radius:20px;margin-bottom:10px;">
				<div style="margin-left:10px;font-size:1.2em;font-weight:bold;display:inline;"><%=name %>(<%=comlist.get(i).getUser_id() %>)</div>
				<div style="margin-top:5px;float:right;display:inline;"> <%=comlist.get(i).getModifytime() %></div>
				<div style="margin-top:5px;"><%=comlist.get(i).getComment() %></div>
				<% if(userID.equals(comlist.get(i).getUser_id())){ %>
				<div style="float:right;">
					<a href="#">수정</a>
					<a href="commentDelete?idx=<%= comlist.get(i).getId() %>">삭제</a>
				</div>
				<% } %>
			</div>
			<%
				}
				if(userID!=null){
			%>
			<div style="font-size:1.5em;font-weight:bold;margin-bottom:10px;margin-left:20px;">댓글 작성</div>
			<form action="commentWrite" method="post">
				<div id="comment_box">
					<textarea class="form-control" name="comment" id="comment" placeholder="내용" style="width:100%;height:120px;"></textarea>
					
					<input type="submit" class="btn2 pull-right" value="작성" style="margin-top:10px;">
					
					 <input type="hidden" name="boardIDX" value="<%=board.getIdx() %>">
					 <input type="hidden" name="userID" value="<%=userID %>">
					 <input type="hidden" name="userName" value="<%=user.getName() %>">
				</div>
			</form>
			<%
						}
				}
			%>
		</div>
					
		</div>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
