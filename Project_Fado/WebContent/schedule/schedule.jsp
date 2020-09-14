<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.Schedule"%>
<%@ page import="model.ScheDAO"%>
<%@ page import="model.UserDAO"%>
<%@ page import="model.User"%>
<%
Schedule sche = new Schedule();
ScheDAO db = new ScheDAO();
String eDate = null;
  // 오늘 날짜로 달력 취득
  Calendar currentCal = Calendar.getInstance();
  Calendar todayCheck_currentCal = Calendar.getInstance();
 String[] calHeader = { "일", "월", "화", "수", "목", "금", "토" };
  // request 객체로 부터 넘어온 값이 있으면 처리
  if(request.getParameter("year") != null){
   currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
  }
  if(request.getParameter("month") != null){
   currentCal.set(Calendar.MONTH, Integer.parseInt(request.getParameter("month")));
  }
    
  // 날을 1일로 셋팅
  currentCal.set(Calendar.DATE, 1);
  
  // 1일의 '요일'을 취득
  int oneDayNum = currentCal.get(Calendar.DAY_OF_WEEK);
  // 현재달의 최대 일 수
  int monthMaxNum = currentCal.getActualMaximum(Calendar.DAY_OF_MONTH);
  // 현재달의 주 수
  int weekSize = currentCal.getActualMaximum(Calendar.WEEK_OF_MONTH);
  // 현재 '년'을 취득
  int year = currentCal.get(Calendar.YEAR);
  // 현재 '월'을 취득(0월 부터 11월 까지)
  int month = currentCal.get(Calendar.MONTH);
  // 현재 '일'을 취득
  int day = currentCal.get(Calendar.DATE);
  //int day = currentCal.get(Calendar.DAY_OF_MONTH);

%>
<!DOCTYPE html>
<html lang="ko">
<script>
 function goMonth(month){
  var form = document.calendarHiddenForm;

  if( (<%=year%> <= 1970) && (month == -1) ){
   alert("1970년 1월 1일 이후로 검색해 주세요.");
   return;
  }
  if(month==-1){
   form.year.value = <%=year-1%>;
   form.month.value = 11;
  }else if(month==12) {
   form.year.value = <%=year+1%>;
   form.month.value = 0;
  }else{
   form.year.value = <%=year%>;
   form.month.value = month;
  }

  form.action="schedule.jsp";
  form.target = "_self";
  form.submit();
 }
</script>
<style>
th{text-align:center;}
</style>
<%@ include file="../header.jsp"%>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
		<div class="board container"
			style="width: 80%; text-align: center; margin: 0 auto; padding-top: 50px;">
			<h1
				style="text-align: center; font-size:3em; padding-bottom: 20px; font-weight:bold;">공연 일정</h1>
			<div class="place"
				style="background-color: rgb(52, 152, 219); width: 100%; height: 40px; display: inline-block;">
				<select name="type" id="type"
					style="width: 20%; margin-top: 10px; float: left;">
					<option value="충청남도">충청남도</option>
					<option value="전라남도">전라남도</option>
					<option value="경기도">경기도</option>
				</select> <select name="type2" id="type2"
					style="width: 20%; margin-top: 10px; float: left;">
					<option value="아산시">아산시</option>
					<option value="순천시">순천시</option>
					<option value="수원시">수원시</option>
				</select>
			</div>

			<div style="background-color: white; margin-top: 20px;margin-bottom:20px">
				<div style="padding-top: 20px;">
					<a style="font-size: 3.5em; display: inline;color:black;" href="javascript:goMonth(<%=month-1%>);"><i class="fas fa-angle-left"></i></a>
				<div style="font-size: 3.5em; display: inline;font-weight:bold;"><%=year%>. <%=month+1 %> 
				</div>
				<a style="font-size: 3.5em; display: inline;color:black;" href="javascript:goMonth(<%=month+1%>);"><i class="fas fa-angle-right "></i></a>
				</div>
				<%
					for (int i = 1; i < 32; i++) {
						eDate = Integer.toString(year) + "-" + Integer.toString(month+1) + "-" + Integer.toString(i);
						ArrayList<Schedule> list = db.getList(eDate);
						if (list.size() != 0) {
				%>
				<div style="text-align: center; margin: 0 auto; width: 500px">
					<div style="font-size: 1.5em; float: left;font-weight:bold;"><%=i%>일
					</div>
					<div class="row">
						<table class="table" style="text-align:center;">
							<thead style="background:lightgrey;">
								<tr >
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">팀명</th>
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">시간</th>
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">장소</th>
								</tr>
							</thead>
							<tbody>
								<%
									for (int j = 0; j < list.size(); j++) {
								%>
								<tr>
									
									<td style="width:120px;font-size:1.1em"><%=list.get(j).getBusker()%></td>
									<td style="width:160px;"><%=list.get(j).getStart()%> ~ <%=list.get(j).getEnd()%></td>
									<td style="width:220px;font-size:1.1em"><%=list.get(j).getPlace()%></td>
									<td style="width:30px;"><a href="scheView.jsp?idx=<%=list.get(j).getId()%>"><i class="fas fa-angle-right "></i></a></td>
								</tr>
								
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<%
						}else{
							
						}
					}
				
					if(userID!=null && user.getPart().equals("busker")) {
				%>
					<button class="btn2" onclick="location.href='scheList.jsp'">추가</button>
				<%
				
					}
						
				%>
				
				
			</div>
			<!-- ◀ / ▶ 에 해당하는 폼 -->
<form name="calendarHiddenForm" method="post">
 <input type="hidden" name="year" value="" />
 <input type="hidden" name="month" value="" />
</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>
