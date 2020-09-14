<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">

<style>
	.btn2 {
		background: rgb(52, 152, 219); width:60px;height:30px;
	}
	.board {
	width:80%; text-align: center; margin: 0 auto;padding-top:50px;}
</style>
<%@ include file = "../header.jsp" %>
<body oncontextmenu='return false' ondragstart='return false'>
<div class="content">
	<div class="board container">
        <form action="boardWrite" method="post">
        <div class="row" >
			<table border="1" class="table" style="width:100%;background-color:white;">
				<tbody >
					<tr>
						<td >제목</td>
						<td colspan="2" align=left><input type="text" class="form-control" name="title" id="title" placeholder="제목"></td>
						<td style="width:150px;"><select class="form-control" name="type" id="type">
                           <option value="free">자유게시판</option>
                           <option value="busk">버스커게시판</option>
            </select></td>
					
            	</tr>
					<tr>
			 			<td colspan="4" align=left style="min-height: 200px;">
			 			<textarea style="height:200px;" class="form-control" name="content" id="content" placeholder="내용"></textarea></td>
					</tr>
				</tbody>
			</table>
			</div>
				<button type="submit" class="btn2" style="float:right;">등록</button>
        </form>
        <button class="btn2" onclick="history.back();" style="float:right;display:inline;">취소</button>
        </div>
        
    </div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
