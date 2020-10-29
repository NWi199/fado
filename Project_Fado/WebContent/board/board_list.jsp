<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.BoardDAO"%>
<%@ page import="model.Board"%>
<!DOCTYPE html>
<html lang="ko">
<script>
$('.selectpicker').selectpicker();
</script>
<%@ include file="../header.jsp"%>
<style>
	th{
		background:lightgray;
		 text-align: center;
	}
	.board{
		width: 80%; text-align: center; margin: 0 auto; padding-top: 50px;
	}
	.type{text-align: left; float:left; font-size: 1.8em; padding-bottom: 20px;font-weight:bold;display:inline;width:90%;}
	
@media (min-width: 768px) {
	.mo{display:none;}
	.write{float:right;display:inline;font-size:1.3em;font-weight:bold;width:120px;height:40px;width:10%;}
	.selectpicker{width:20%;display:inline-block;}
	.insearch{display:inline-block;width:60%;}
	.searchenter{display:inline-block;width:10%;}
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc{display:none;}
	.write{float:right;margin-right:50px;display:inline;}
	.selectpicker{width:100%;}
	.insearch{display:inline-block;width:70%;}
	.searchenter{display:inline-block;width:10%;}
}
</style>
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
	<div class="content container-fluid">
	
		<div class="board">
			<div style="width:100%">
				<div class="type"><%= typeName %></div>
			<%
				if (userID != null) {
			%>
				<%@ include file="../floating.jsp"%>
				<%
				}
			%>
			</div>
			 
			<div class="sear" style="width:100%;margin-bottom:20px">
				<form class="search" name="f" method="post" action="search_list.jsp">
				      <SELECT class="form-control selectpicker" name='col' style=""> <!-- 검색 컬럼 -->
				        <OPTION value='none'>전체 목록</OPTION>
				        <OPTION value='name'>닉네임</OPTION>
				        <OPTION value='title'>제목</OPTION>
				        <OPTION value='content'>내용</OPTION>
				        <OPTION value='both'>제목+내용</OPTION>
				      </SELECT>
				      <input type="text" class="form-control insearch" name='word' value="<% if(request.getParameter("word") != null ) { %><%=request.getParameter("word")%><% }  %>">
				      <button class="searchenter btn2" type="submit" style="">검색</button>
		      		</form>
				
			</div>
				
			
			<div class="row">
				<table class="pc table" style="background-color: white;text-align:center;">
					<thead>
						<tr>
							<th style="width:30px;">No.</th>
							<th style="width:100px;">작성자</th>
							<th style="width:300px;">제목</th>
							<th style="width:180px;">작성일</th>
							<th style="width:60px;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<% 
                    	BoardDAO db = new BoardDAO();
	                    ArrayList<Board> list = db.getList(type);
						for(int i=0; i<list.size(); i++){
					%>
						<tr>
							<td style="width:30px;"><%=list.get(i).getIdx() %></td>
							<td style="width:60px;"><a href="../profile/mypage.jsp?otherID=<%=list.get(i).getUserID() %>"><%=list.get(i).getUserName() %></a></td>
							<td style="width:300px;font-weight:bold;"><a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
							<td style="width:120px;"><%=list.get(i).getDate() %></td>
							<td style="width:30px;"><%=list.get(i).getHit() %></td>
						</tr>
						<%
						}
                   %>
					</tbody>
				</table>
				<table class="mo table" style="background-color: white;text-align:center;">
			
					<tbody>
						<%
						for(int i=0; i<list.size(); i++){
					%>
						<tr>
							<td>
								<div style="text-align:left;font-size:1.1em;font-weight:bold;"><a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></div>
								<div style="text-align:left;"><a href="../profile/mypage.jsp?otherID=<%=list.get(i).getUserID() %>"><%=list.get(i).getUserName()%></a> | <%=list.get(i).getDate() %> | 조회수:<%=list.get(i).getHit() %></div>
							</td>
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
