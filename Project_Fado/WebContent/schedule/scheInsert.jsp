<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.util.*"%>
	<%@ page import="model.UserDAO"%>
<%@ page import="model.User"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<style>
.btn2 {
	width: 15%;
	height: 30px;
	color: white;
	text-align: center;
	background: rgb(52, 152, 219);
	border-radius: 30px;
	display: inline;
	font-size: 0.85em;
	border:0px;
}

.logo {
	margin-left: 10%;
	font-size: 4em;
	padding-top: 100px;
}
.nav {
		margin-top: 30px;
}
.nav ul {
	width: 100%;
	list-style: none;
	text-align: center;
	margin: 0;
	padding: 0;
}
@media (min-width: 768px) {
	.mo {display:none;}
	table {
		table-layout: fixed;
		width:120px;
	}
	.calView{
		width:30%; margin: 0 auto; text-align: center; margin-top: 20px;background:white;margin-bottom:50px;
	}
	.exp{text-align:left;margin:0 auto;margin-top: 22px;margin-bottom:30px;padding:20px;width:400px;height:200px;border:1px solid lightgray;border-radius:20px;}
	
}

@media (min-width: 320px) and (max-width: 480px){ 
	.pc {display:none;}
	table {
		table-layout: fixed;
		width:30px;
	}
	.calView{
		width:100%; margin: 0 auto; text-align: center; margin-top: 20px;background:white;margin-bottom:50px;
	}
	.exp{text-align:left;margin:0 auto;margin-top: 22px;margin-bottom:30px;padding:20px;width:300px;height:200px;border:1px solid lightgray;border-radius:20px;}
}
#nav ul{ width:100%; margin:0; padding:0; }
#nav ul.menu li{ position:relative; float:left; width:100%; list-style-type:none; font-size:1.1em;}
#nav ul.menu li a{ display:block; width:100%; height:100%; line-height:50px; color:#000; font-weight:bold; text-decoration:none; }
#nav ul.menu li .sub a{ position:relative; float:left; display:block; width:100%; z-index:999; background:rgb(174, 211, 229); }

</style>
<header>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nav ul.sub").hide();
		$("#nav ul.menu li").click(function(){
			$("ul",this).slideToggle("fast");
		});
	});
</script>
<%		
			UserDAO userdb = new UserDAO();
			String userID = (String) session.getAttribute("id");
			User user = userdb.info(userID);
		%>
	
	<div class="pc" style="margin-top: 100px;">
		<a style="display: inline;" class="logo" href="../index.jsp"><img
			src="../image/logo3.PNG" alt="fado"></a>
		<div style="display: inline; font-weight: bold; font-size:1.5em;">일정 관리</div>
		<div style="display: inline;margin-left:10px;">
			<button type="button" onclick="location.href='../profile/mypage.jsp'">MyPage</button>
			<button type="button" onclick="location.href='schedule.jsp'">Schedule</button>
		</div>
	</div>
	
	<div class="mo">
		<div id="nav">
		<ul class="menu" >
			<li><i class="fas fa-bars fa-2x" style="display:inline;float:left;margin-left:20px;color:rgb(174, 211, 229);"></i>
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
		<li><a href="../index.jsp">Home</a></li>
				<li><a href="../board/board.jsp">Board</a>		
			<li><a href="../schedule/schedule.jsp">Schedule</a></li>
			<li><a href="#">PlayList</a></li>
			<li><a href="#">Notice</a></li>
			</ul>
			</li>
		</ul>
	</div>
		<div style="font-weight: bold; font-size:1.5em;text-align:center;margin-top:20px;">일정 추가</div>
	</div>
	<hr>
</header>

<body oncontextmenu='return false' ondragstart='return false'>
	<div class="calView">
		<form method="post" name="f" action="scheWrite" onsubmit="return checkValue();">
			<table class="table">
				<tbody>
					<tr>
						<td>공연날짜</td>
						<td colspan='2'><input type="date" name="date" id="date" class="form-control" AUTOCOMPLETE="OFF" style="width:100%" ></td>
					</tr>
					<tr>
						<td>일정명</td>
						<td colspan='2'><input type="text" name="title" id="title" class="form-control" style="width:100%" ></td>
					</tr>
					<tr>
						<td>공연시간</td>
						<td colspan='2'><input type="time" name="start" id="start" class="form-control" AUTOCOMPLETE="OFF" style="width:45%;display:inline;">&nbsp;~&nbsp;<input type="time" name="end" class="form-control" AUTOCOMPLETE="OFF" style="width:45%;display:inline;"></td>
					</tr>
					<tr>
						<td>버스커명</td>
						<td colspan='2'><input type="text" name="busker" id="busker" placeholder="공백 시 작성자 닉네임" class="form-control" style="width:100%" ></td>
					</tr>
					<tr>
						<td>공연장소</td>
						<td colspan='2'><input type="text" name="place" id="place" class="form-control" placeholder="ex)홍대 버스킹존" style="width:80%;float:left;"><button type="button" class="btn2" onclick="location.href='mapPopup.jsp'">검색</button></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td colspan='2'><input type="text" name="detail" id="detail" class="form-control" placeholder="ex)~시/도  ~구/군" style="width:100%;" ></td>
					</tr> 
					<tr>
						<td>공연설명</td>
						<td colspan='2'><textarea name="exp" class="form-control" id="exp" style="width:100%;"></textarea></td>
					</tr>
					<tr>
						<td>공개여부</td>
						<td colspan='2'><label for="open"><input type="radio" name="open" id="name" value="1" checked> 공개<input type="radio" name="open" value="0"> 비공개</label></td>
					</tr>
				</tbody>
			</table>
	    <div class="btnSet">
	    	<button type="submit" class="btn2">저장</button>
			<button type="button" class="btn2" onclick="location.href='scheList.jsp'">취소</button>
	    </div>
        </form>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script type="text/javascript">

        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
            if (f.date.value == "") {
                alert("날짜를 입력하지 않았습니다.")
                f.date.focus();
                return false;
            }
            if (f.title.value == "") {
                alert("일정명을 입력하지 않았습니다.")
                f.title.focus();
                return false;
            }
            if (f.start.value == ""||f.end.value == "") {
                alert("공연시간을 입력하지 않았습니다.")
                f.star.focus();
                return false;
            }
            if (f.place.value == "") {
                alert("공연장소를 입력하지 않았습니다.")
                f.place.focus();
                return false;
            }
            if (f.detail.value == "") {
                alert("상세주소를 입력하지 않았습니다.")
                f.detail.focus();
                return false;
            }
          if(f.exp.length>100){
                alert("설명은 100자 이내입니다.");
                f.exp.focus();
                return false;
          }
        }
    </script>
</body>

</html>