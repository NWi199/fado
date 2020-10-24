<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<style>
	.btn2 {
		background: rgb(52, 152, 219); width:60px;height:30px;
	}
	.board{margin:0 auto;width:80%;}
	@media (min-width: 320px) and (max-width: 480px){ 
	.board {width:100%; }
	}
</style>
<%@ include file = "../header.jsp" %>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
		<div class="board container-fluid">
	        <form action="boardWrite" method="post">
	        	<table class="table" style="background:white;text-align:center;margin-top:50px;">
	        		<tbody>
	        			<tr>
	        				<td><select class="form-control" name="type" id="type">
	                           <option value="free">자유게시판</option>
	                           <option value="busk">버스커게시판</option>
            				</select></td>
	        			</tr>
	        			<tr>
	        				<td><input type="text" class="form-control" name="title" id="title" placeholder="제목"></td>
	        			</tr>
	        			<tr>
	        			
	        				<td><textarea class="form-control" name="content" id="content" placeholder="내용" style="min-height:200px;"></textarea></td>
	        			</tr>
	        		</tbody>
	        	</table>
	        	 <button class="btn2" onclick="history.back();" style="float:right;display:inline;">취소</button>
	        <button class="btn2" type="submit" style="float:right;display:inline;">작성</button>
	        </form>
	       
	   </div>   
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</body>
</html>
