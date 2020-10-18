<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ko">
<style>
	.btn2 {
		background: rgb(52, 152, 219); width:60px;height:30px;
	}
	
</style>
<%@ include file = "../header.jsp" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
		<div class="container" style="margin:0 auto;width:80%;">
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
	        			
	        				<td><div id="summernote" class="form-control" name="content" id="content" placeholder="내용"></div></td>
	        			</tr>
	        		</tbody>
	        	</table>
	        </form>
	        <button class="btn2" onclick="history.back();" style="float:right;display:inline;">취소</button>
	   </div>   
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script>
      $('#summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 100
      });
    </script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</body>
</html>
