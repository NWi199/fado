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
	        <form name="f" action="boardWrite" method="post" onsubmit="return checkValue();">
	        	<table class="table" style="background:white;text-align:center;margin-top:50px;">
	        		<tbody>
	        			<tr>
	        				<td><select class="form-control" name="type" id="type" style="width:200px;">
	                           <option value="free">자유게시판</option>
	                           <option value="busk">버스커게시판</option>
            				</select>
		        
            				</td>
	        			</tr>
	        			<tr>
	        				<td><input type="text" class="form-control" name="title" id="title" placeholder="제목"></td>
	        			</tr>
	        			<tr>
	        				<td><textarea class="form-control" name="content" id="content" placeholder="내용" style="min-height:200px;"></textarea></td>
	        			</tr>
	        			<tr>
	        				<td>댓글 사용 여부&nbsp;&nbsp; <label for="open">
		        			<input type="radio" name="open" value="1" checked> O
		        			<input type="radio" name="open" value="0">X
		        			</label>
		        			</td>
	        			</tr>
	        		</tbody>
	        	</table>
	        <button class="btn2" type="button" onclick="history.back();" style="float:right;display:inline;margin-left:10px;">취소</button>
	        <button class="btn2" type="submit" style="float:right;display:inline;">작성</button>
	        </form>
	       
	   </div>   
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script type="text/javascript">

        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if (f.title.value == "") {
                alert("제목을 입력하지 않았습니다.")
                f.title.focus();
                return false;
            }
            if (f.content.value == "") {
                alert("내용을 입력하지 않았습니다.")
                f.content.focus();
                return false;
            }
        }
    </script>
</body>
</html>
