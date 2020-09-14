<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.Schedule"%>
<%@ page import="model.ScheDAO"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
<script>
$(function() {
	  $( "#datepicker" ).datepicker({
	    dateFormat: 'yy.mm.dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });
	  $('#timepicker_S').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '8',
		    maxTime: '11:50pm',
		    startTime: '8:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	  $('#timepicker_E').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '8',
		    maxTime: '11:50pm',
		    startTime: '8:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: true
		});
	});

</script> 
</head>
<style>
a:hover {
	text-decoration: none;
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
<%
			int idx = 0;
			if (request.getParameter("idx") != null) {
				idx = Integer.parseInt(request.getParameter("idx"));
			}
			if (idx == 0) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 일정입니다.')");
				script.println("location.href = 'scheList.jsp'");
				script.println("</script>");
			}
			ScheDAO db = new ScheDAO();
			Schedule sche = db.getSche(idx);
		%>
		
	
	<div style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">일정 관리</div>
		<i style="margin-left:15px" class="fas fa-bars fa-2x"></i>
	</div>
	<hr>
	
	<div class="calView">
		<form action="scheModify?idx=<%=idx %>" method="post" name="writeform">
			<div class="form-group">
            	<input type="text" name="title"  placeholder="* 일정명" class="form-control" value="<%=sche.getTitle()%>">
	        </div>
	    	<div class="form-group">
	            <input type="text" name="busker" placeholder="공연자명(빈칸 시 작성자명)" class="form-control" value="<%=sche.getBusker()%>">
	        </div>
	        <div class="form-group" >
	            <input type="datetime" name="date" placeholder="* 공연 날짜" class="form-control" id="datepicker" value="<%=sche.getDate() %>" >
	        </div>
	        <div class="form-group">
		        <h5>공연시간</h5>
		        <input type="time" name="start" placeholder="* 시작 시간" class="form-control" id="timepicker_S" style="width:49%;display:inline;">
		        <input type="time" name="end" placeholder="* 종료 시간" class="form-control" id="timepicker_E" style="width:49%;display:inline;">
	        </div>
	        <div class="form-group">
	        	<input type="text" name="place" placeholder="* 공연 장소" class="form-control" style="width:300px;display:inline;float:left;" value="<%=sche.getPlace()%>"><a class="btn2" href="mapPopup.jsp">검색</a>
	        </div>
	        <div class="form-group">
	        	<input type="text" name="detail" placeholder="상세 주소" class="form-control" value="<%=sche.getDetail()%>">
	        </div>
	        <div class="form-group">
	            <input type="text" name="exp"  placeholder="공연 설명" class="form-control" value="<%=sche.getExp()%>">
	        </div>
	        <div class="form-group">
	        	<label for="open">
		        	<input type="radio" name="open" value="1" checked> 공개
		        	<input type="radio" name="open" value="0"> 비공개
	        	</label>
	        </div>
		    <div class="btnSet">
		    	<button type="submit" class="btn2" value="저장" >저장</button>
		    </div>
		</form>
	</div>
	
	<script src="../js/bootstrap.js"></script>

</body>
</html>
