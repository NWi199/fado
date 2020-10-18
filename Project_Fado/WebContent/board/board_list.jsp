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
	#followquick { position:absolate; top:180px; right:50%;margin-left:500px;}
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
	<div class="content">
		<div class="board container"
			style="width: 80%; text-align: center; margin: 0 auto; padding-top: 50px;">
			<h1
				style="text-align: center; font-size: 1.8em; padding-bottom: 20px;font-weight:bold;"><%= typeName %></h1>
			<div class="row">
				<table class="table" style="background-color: white;text-align:center;">
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
							<td style="width:60px;"><%=list.get(i).getUserID() %></td>
							<td style="width:300px;"><a href="view.jsp?idx=<%= list.get(i).getIdx() %>"><%= list.get(i).getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("\n","<br>") %></a></td>
							<td style="width:120px;"><%=list.get(i).getDate() %></td>
							<td style="width:30px;"><%=list.get(i).getHit() %></td>
						</tr>
						<%
						}
                   %>
					</tbody>
				</table>
				<div id="followquick">
여기에 퀵메뉴 내용 넣기
</div>
				<div class='aside_menu' style="margin-bottom:100px;">
  <form name='frm' method='GET' action='./board_list.jsp'>
    <ASIDE style='float: left;'>
      <SELECT class="selectpicker"name='col'> <!-- 검색 컬럼 -->
        <OPTION value='none'>전체 목록</OPTION>
        <OPTION value='rname'>닉네임</OPTION>
        <OPTION value='title'>제목</OPTION>
        <OPTION value='content'>내용</OPTION>
        <OPTION value='title_content'>제목+내용</OPTION>
      </SELECT>
      <input type='text' name='word' value='' style="width:250px;">
      <button type='submit'>검색</button>
      </ASIDE>
      </form>
      </div>
				<%
				if (userID != null) {
			%>
				<button class="btn2 pull-right" onclick="location.href='write.jsp'" style="display:inline;">작성</button>
				<%
				}else{
				}
			%>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script>
	//follow quick menu
	$(window).scroll(function(){
	var scrollTop = $(document).scrollTop();
	if (scrollTop < 180) {
	 scrollTop = 180;
	}
	$("#followquick").stop();
	$("#followquick").animate( { "top" : scrollTop });
	});

	</script>
</body>
</html>
