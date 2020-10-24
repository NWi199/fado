<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="model.Schedule"%>
<%@ page import="model.ScheDAO"%>
<%
	String userID = (String) session.getAttribute("id");
	Schedule sche = new Schedule();
	ScheDAO db = new ScheDAO();
	String eDate = null;
	// 오늘 날짜로 달력 취득
	Calendar currentCal = Calendar.getInstance();
	Calendar todayCheck_currentCal = Calendar.getInstance();
	String[] calHeader = {"일", "월", "화", "수", "목", "금", "토"};
	// request 객체로 부터 넘어온 값이 있으면 처리
	if (request.getParameter("year") != null) {
		currentCal.set(Calendar.YEAR, Integer.parseInt(request.getParameter("year")));
	}
	if (request.getParameter("month") != null) {
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js"
	crossorigin="64de5f242b"></script>
<script>
	function goCalendar() {
		var form = document.calendarTextBoxForm;

		if ((form.year.value == "")) {
			alert("'년'을 입력 주세요");
			return;
		}
		if (form.year.value < 1970) {
			alert("1970년 1월 1일 이후로 검색해 주세요.");
			return;
		}
		if ((form.month.value == "")) {
			alert("'월'을 입력 주세요");
			return; 
		}
		if ((form.month.value < 1) || form.month.value > 12) {
			alert("'월'을 올바르게 입력 주세요");
			return;
		}
		form.month.value = form.month.value - 1;
		form.action = "scheList.jsp";
		form.target = "_self";
		form.submit();
	}

	function goMonth(month) {
		var form = document.calendarHiddenForm;

		if ((
<%=year%>
	<= 1970) && (month == -1)) {
			alert("1970년 1월 1일 이후로 검색해 주세요.");
			return;
		}
		if (month == -1) {
			form.year.value =
<%=year - 1%>
	;
			form.month.value = 11;
		} else if (month == 12) {
			form.year.value =
<%=year + 1%>
	;
			form.month.value = 0;
		} else {
			form.year.value =
<%=year%>
	;
			form.month.value = month;
		}

		form.action = "scheList.jsp";
		form.target = "_self";
		form.submit();
	}
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
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

.fas {
	position: relative;
	display: inline-block;
	border-bottom: dotted 1px black;
}
.tooltip-content {
			visibility: hidden;
	width: 120px;
	background-color: black;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	transform: translate(-50%, -50%);
	bottom: 100%;
	left: 50%;
		}
		.tooltip-content::after {

        content: "";
	position: absolute;
	top: 100%;
	left: 50%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: black transparent transparent transparent;

    }
.fas:hover .tooltip-content { visibility: visible; }


@media (min-width: 768px) {
	.mo {display:none;}
	table {
		table-layout: fixed;
		width:120px;
	}
	.cal{
		width:1000px; margin: 0 auto; text-align: center; margin-top: 20px;background:white;
	}
	.day {font-size: 3.5em; display: inline; color: black;}
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	table {
		table-layout: fixed;
		width:30px;
	}
	.cal{
		width:90%; margin: 0 auto; text-align: center; margin-top: 20px;background:white;
	}
	.day{font-size: 3em; display: inline; color: black;float:left;}
}

#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:1.1em;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:rgb(174, 211, 229); }
</style>

<body oncontextmenu='return false' ondragstart='return false'>

	<div class="pc" style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">일정 관리</div>
		<div style="display: inline;;margin-left:10px;">
			<button type="button" onclick="location.href='../profile/mypage.jsp'">MyPage</button>
			<button type="button" onclick="location.href='schedule.jsp'">Schedule</button>
		</div>
	</div>
	
	<div class="mo">
		<div id="nav">
		<ul class="menu" >
			<li><i class="fas fa-bars fa-2x" style="display:inline;float:left;margin-top:10px;color:rgb(174, 211, 229);"></i>
			<ul class="sub">
			<%
			if (userID == null) {
		%>
				<li><a href="../login/login.jsp">로그인</a>
				<li><a href="../login/join.jsp">회원가입</a>	
					<%
			} else {
		%>
			<li><a href="logoutGo">로그아웃</a>
				<li><a href="../profile/mypage.jsp">MyPage</a>	
				<%
			}
		%>
				<li><a href="../board/board.jsp">Board</a>		
			<li><a href="../schedule/schedule.jsp">Schedule</a></li>
			<li><a href="#">PlayList</a></li>
			<li><a href="#">Notice</a></li>
			</ul>
			</li>
		</ul>
	</div>
		<div style="font-weight: bold; font-size:1.5em;text-align:center;">일정 관리</div>
	</div>
	<hr>
	
				
	<div class="cal">
			<div class="day">
				<a style=""
					href="javascript:goMonth(<%=month - 1%>);"><i
					class="fas fa-angle-left"></i></a>
				<div><%=year%>.
					<%=month + 1%>
				</div>
				<a
					href="javascript:goMonth(<%=month + 1%>);"><i
					class="fas fa-angle-right "></i></a>
			</div>
			<a href="scheInsert.jsp">추가</a>
			<div >
				<div class="row">
					<table class="table">
						<thead
							style="margin: 0 auto; background-color: gray; font-size: 1.3em;">
							<tr  >
								<%
									for (int i = 0; i < calHeader.length; i++) {
								%>
								<th style="text-align: center;"><%=calHeader[i]%></th>
								<%
									}
								%>
							</tr>
						</thead>
						<tbody style="text-align: left;">
							<%
								//int dayNum = 1;
								boolean dayCheck = false;

								// 현재 달의 주 수만큰 반복
								for (int i = 0; weekSize > i; i++) {
									out.println("<tr height='100'>");

									// 일주일이 7일 이니 7번 반복
									for (int j = 0; (7 > j); j++) {
										out.println("<td>");

										// 현재 달의 1을의 요일에 해당하는 곳부터 출력하기위함
										if (oneDayNum == j + 1 || dayCheck) {
											// 현재 달의 최대 일수일경우
											if (monthMaxNum >= day) {
												/// 일요일의 경우 글자색 '빨강'
												if (currentCal.get(Calendar.DAY_OF_WEEK) == 1) {
													// 일요일이면서 오늘일 경우 글자색은 '빨강', 글자 진하게 아니면 글자색만 '빨강'
													if (todayCheck_currentCal.equals(currentCal)) {
														out.println("<font color='red'><b>" + day + "</b></font>");
													} else {
														out.println("<font color='red'>" + day + "</font>");
													}
													currentCal.set(Calendar.DATE, ++day);
													dayCheck = true;
													// 토요일의 경우 글자색 '파랑'
												} else if (currentCal.get(Calendar.DAY_OF_WEEK) == 7) {
													// 토요일이면서 오늘일 경우 글자색은 '파랑', 글자 진하게 아니면 글자색만 '파랑'
													if (todayCheck_currentCal.equals(currentCal)) {
														out.println("<font color='blue'><b>" + day + "</b></font>");
													} else {
														out.println("<font color='blue'>" + day + "</font>");
													}
													currentCal.set(Calendar.DATE, ++day);
													dayCheck = true;
													// 일요일도 아니고 토요일도 아니면 기본속성 글자출력 
												} else {
													//  일요일도 아니고 토요일도 아닌데 오늘이면 글자진하게
													if (todayCheck_currentCal.equals(currentCal)) {
														out.println("<b>" + day + "</b>");
													} else {
														out.println(day);
													}
													currentCal.set(Calendar.DATE, ++day);
													dayCheck = true;
												}

											} else {
												out.println("&nbsp;");
											}
										} else {
											out.println("&nbsp;");
										}
										eDate = Integer.toString(year) + "-" + Integer.toString(month + 1) + "-"
												+ Integer.toString(day - 1);
										ArrayList<Schedule> list = db.getList(eDate);

										out.println("<hr style='margin-top: 0px;margin-bottom:5px;'>");

										for (int k = 0; k < list.size(); k++) {
											if (list.get(k).getWriter().equals(userID)) {
												out.println("<a href='scheView.jsp?idx=" + list.get(k).getId()
														+ "'><i class='fas fa-circle' style='color:yellow;'><div class='tooltip-content'>"+ list.get(k).getTitle() + "</div></i></a>");
											}
										}
										out.println("</td>");
									}
									out.println("</tr>");
								}
							%>
						</tbody>
					</table>
					<!-- ◀ / ▶ 에 해당하는 폼 -->
					<form name="calendarHiddenForm" method="post">
						<input type="hidden" name="year" value="" /> <input type="hidden"
							name="month" value="" />
					</form>
					<!-- TextBox 에 해당하는 폼 -->
					<form name="calendarTextBoxForm" method="post" style="margin-bottom:50px;">
						<input type="text" name="year" size="5" value="" maxlength="4" />
						년 <input type="text" name="month" size="3" value="" maxlength="2" />
						월 <input type="button" onclick="javascript:goCalendar();"
							value="이동" />
					</form>
				</div>
			</div>
		</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>

</body>
</html>
