<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
</head>
<style>
.btn2 {
	width: 60px;
	height: 30px;
	color: white;
	text-align: center;
	background: rgb(52, 152, 219);
	border-radius: 30px;
	display: inline;
	font-size: 0.9em;
}

.logo {
	margin-left: 10%;
	font-size: 4em;
	padding-top: 100px;
}
.calView{
	width:450px;
	height:100%;
	margin: 0 auto;
	text-align:center;
	margin-top:80px;
	font-size:1.3em;
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>

	<div style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size: 1.5em;">일정
			관리</div>
		<div style="display: inline;; margin-left: 10px;">
			<button type="button" onclick="location.href='../profile/mypage.jsp'">MyPage</button>
			<button type="button" onclick="location.href='schedule.jsp'">Schedule</button>
		</div>
	</div>
	<hr>

	<div class="calView">
		<form method="post" name="writeform" action="scheWrite">
		<div class="form-group" >
            	<div style="font-size:0.8em;">
            	공연날짜<input type="date" name="date" class="form-control" AUTOCOMPLETE="OFF" style="display:inline;width:350px;" >
            	</div>
        </div>
    	<div class="form-group" style="font-size:0.8em;">
            	일정명<input type="text" name="title" class="form-control" style="display:inline;width:350px;" >
        </div>
        <div class="form-group">
           	<div style="font-size:0.8em;">
           	시작시간<input type="time" name="start" class="form-control" AUTOCOMPLETE="OFF" style="display:inline;width:350px;">
           	</div>
        	<div style="font-size:0.8em;">
        	종료시간<input type="time" name="end" class="form-control" AUTOCOMPLETE="OFF" style="display:inline;width:350px;">
        	</div>
        </div>
        <div class="form-group" style="font-size:0.8em;">
        	공연장소 <input type="text" name="place" class="form-control" style="width:300px;display:inline;float:left;"><a class="btn2" href="mapPopup.jsp">검색</a>
        	<i></i>
        </div>
        <div class="form-group" style="font-size:0.8em;">
       		상세주소<input type="text" name="detail" class="form-control" style="display:inline;width:350px;" >
        </div>
        <div class="form-group" style="font-size:0.8em;">
            공연설명<textarea name="exp" class="form-control"style="display:inline;width:350px;" ></textarea>
        </div>
        <div class="form-group" style="font-size:0.8em;">
        	<label for="open">
        	<input type="radio" name="open" value="1" checked> 공개
        	<input type="radio" name="open" value="0"> 비공개
        	</label>
            
        </div>
	    <div class="btnSet">
	    	<button type="submit" class="btn2">저장</button>
			<button type="button" class="btn2">취소</button>
	    </div>
        </form>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>

</html>