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

<%@ include file="../header.jsp"%>
<style>
th{text-align:center;}
.board {width:80%;margin:0 auto;padding-top:50px;text-align:center;}
.place {background: rgb(52, 152, 219); height:50px;padding-top:8px;padding-left:20px;}
.list{text-align:center; margin:0 auto; width:60%;}
@media (min-width: 768px) {
	.mo {display:none;}
}

@media (min-width: 320px) and (max-width: 480px){ 
.pc {display:none;}	
.board {width:100%;margin:0 auto;padding-top:50px;text-align:center;}
}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
		<div class="board container-fluid">
			<h1 style="text-align:center;font-size:3em;padding-bottom:20px;font-weight:bold;">공연 일정</h1>
				<div class="place">
					<i class="fas fa-map-marker-alt fa-2x" style="display:inline-block;color:white;padding-right:10px;"></i>
					<select class="form-control" name="sido1" id="sido1" style="width:150px;display:inline-block;"></select>
					<select class="form-control" name="gugun1" id="gugun1" style="width:120px;display:inline-block;"></select>
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
				<div class="list">
					<div style="font-size:1.5em; float:left;font-weight:bold;"><%=i%>일
					</div>
					<div class="row">
						<table class="pc table" style="text-align:center;">
							<thead style="background:lightgrey;">
								<tr >
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">팀명</th>
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">시간</th>
									<th style="text-align:center;font-weight:bold;font-size:1.15em;">장소</th>
									<th style="text-align:center;font-weight:bold;">자세히</th>
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
									<td style="width:80px;"><a href="scheView.jsp?idx=<%=list.get(j).getId()%>"><i class="fas fa-angle-right "></i></a></td>
								</tr>
								
								<%
									} 
								%>
							</tbody>
						</table>
						
						<table class="mo table" style="text-align:center;">
							<tbody>
								<%
									for (int j = 0; j < list.size(); j++) {
								%>
								<tr>
									<td>
										<div style="width:100%;font-size:1.2em;font-weight:bold;"><%=list.get(j).getBusker()%></div>
										<div><%=list.get(j).getStart()%> ~ <%=list.get(j).getEnd()%> <%=list.get(j).getPlace()%></div>
									</td>
									<td><a href="scheView.jsp?idx=<%=list.get(j).getId()%>"><i class="fas fa-angle-right "></i></a></td>
								</tr>
								
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				<%
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
	<script type="text/javascript">
$('document').ready(function() {
 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
   var area3 = ["대덕구","동구","서구","유성구","중구"];
   var area4 = ["광산구","남구","동구",     "북구","서구"];
   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
   var area6 = ["남구","동구","북구","중구","울주군"];
   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

 

 // 시/도 선택 박스 초기화

 $("select[name^=sido]").each(function() {
  $selsido = $(this);
  $.each(eval(area0), function() {
   $selsido.append("<option value='"+this+"'>"+this+"</option>");
  });
  $selsido.next().append("<option value=''>구/군 선택</option>");
 });

 

 // 시/도 선택시 구/군 설정

 $("select[name^=sido]").change(function() {
  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
  var $gugun = $(this).next(); // 선택영역 군구 객체
  $("option",$gugun).remove(); // 구군 초기화

  if(area == "area0")
   $gugun.append("<option value=''>구/군 선택</option>");
  else {
   $.each(eval(area), function() {
    $gugun.append("<option value='"+this+"'>"+this+"</option>");
   });
  }
 });


});
</script>
</body>
</html>
