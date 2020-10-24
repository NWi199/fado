<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<title>fado</title>
<link type="text/css" rel="stylesheet" href="../css/bootstrap.css">
<script src="https://kit.fontawesome.com/64de5f242b.js" crossorigin="64de5f242b"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>


.content {width: 100%; height: 100%; margin-top: 5%;}
@media (min-width: 768px) {
	.login {
	width: 40%;
	text-align: center;
	margin: 0 auto;
	padding-top: 50px;
	}
	.btn2 {
	color: white;
	border-radius: 30px;
	display: inline-block;
	border: 0px;
	background: grey; width: 120px; height: 40px; font-size: 1.3em; margin-top: 20px;margin-right: 10px;
	}
	.table{margin:0 auto;width:80%;border:none;}
	
	
}

@media (min-width: 320px) and (max-width: 480px){ 
	.login {
		width: 100%;
		text-align: center;
		margin: 0 auto;
		padding-top: 50px;
	}
	.btn2 {
	color: white;
	border-radius: 30px;
	display: inline-block;
	border: 0px;
	background: grey; width: 120px; height: 40px; font-size: 1.1em; margin-top: 20px;margin-right: 10px;
	}
	.table{margin:0 auto;width:100%;border:none;}

}
</style>
<body oncontextmenu='return false' ondragstart='return false'>
	<div class="content">
		<div class="login container-fluid">
			<div class="logo">
				<a href="../index.jsp"><img src="../image/logo3.PNG" alt="fado"></a>
			</div>
				<div style="background:white;margin-top:50px;">
					<p></p>
					<form name="f" action="joinGo" method="post"
						onsubmit="return checkValue();">
						<table class="table"
							style="">
							<tbody style="margin:0 auto;">
								<tr>
									<td>아이디</td>
									<td><input type="text" name="id" class="form-control"
										style="display: inline;"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" name="pw" AUTOCOMPLETE="OFF"
										class="form-control"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td><input type="password" name="pw2" AUTOCOMPLETE="OFF"
										class="form-control"></td>
								</tr>
								<tr>
									<td>이메일</td>
									<td><input type="text" name="email" class="form-control"
										style="display: inline;"></td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type="text" name="name" class="form-control"></td>
								</tr>
								<tr>
									<td>활동지역</td>
									<td colspan="2"><select class="form-control" name="sido1" id="sido1"
										style="width: 100%;"></select> <select class="form-control" name="gugun1"
										id="gugun1" style="width: 100%;"></select></td>
								</tr>
								<tr>
									<td>자기소개</td>
									<td colspan="4"><textarea name="intro" class="form-control" style="height:100px;resize: vertical;"></textarea>
								</tr>                     
							</tbody>
						</table>
						<button type="button" class="btn2">중복확인</button>
						<button type="submit" class="btn2" style="background:rgb(52, 152, 219);">완료</button>
						<button type="button" class="btn2" onclick="location.href='joinResult.jsp'">result</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
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

	<script type="text/javascript">

        // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	var regex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
        	//아이디 입력여부 검사
            if (f.id.value == "") {
                alert("아이디를 입력하지 않았습니다.")
                f.id.focus();
                return false;
            }
            //아이디 유효성 검사 (영문소문자, 숫자만 허용)
           for (var i = 0; i < document.f.id.value.length; i++) {
                ch = document.f.id.value.charAt(i)
                if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
                    alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
                    document.f.id.focus();
                    document.f.id.select();
                    return false;
                }
            }
            //아이디에 공백 사용하지 않기
            if (document.f.id.value.indexOf(" ") >= 0) {
                alert("아이디에 공백을 사용할 수 없습니다.")
                document.f.id.focus();
                document.f.id.select()
                return false;
            }
            //아이디 길이 체크 (4~12자)
           if (document.f.id.value.length<4 || document.f.id.value.length>12) {
                alert("아이디를 4~12자까지 입력해주세요.")
                document.f.id.focus();
                document.f.id.select();
                return false;
            }
               //비밀번호 입력여부 체크
            if (document.f.pw.value == "") {
                alert("비밀번호를 입력하지 않았습니다.")
                document.f.password.focus();
                return false;
            }
            if (f.pw.value == f.id.value) {
                alert("아이디와 비밀번호가 같습니다.")
                document.f.pw.focus();
                return false;
            }
            //비밀번호 길이 체크(4~8자 까지 허용)
            if (document.f.pw.value.length<4 || document.f.pw.value.length>12) {
                alert("비밀번호를 4~12자까지 입력해주세요.")
                document.f.pw.focus();
                document.f.pw.select();
                return false;
            }
            //비밀번호와 비밀번호 확인 일치여부 체크
            if (document.f.pw.value != document.f.pw2.value) {
                alert("비밀번호가 일치하지 않습니다")
                document.f.pw1.value = ""
                document.f.pw1.focus();
                return false;
            }
     
            if (document.f.email.value == "") {
                alert("이메일을 입력하지 않았습니다.")
                document.email.focus();
                return false;
            }
            if (regex.test(document.f.email.value) == false) {
                alert("잘못된 이메일 형식입니다.");
                document.f.email.value=""
                document.f.email.focus();
                return false;
            }
     
            for (var i = 0; i < document.f.email.value.length; i++) {
                chm = document.f.email.value.charAt(i)
                if (!(chm >= '0' && chm <= '9') && !(chm >= 'a' && chm <= 'z')&&!(chm >= 'A' && chm <= 'Z')) {
                    alert("이메일은 영문 대소문자, 숫자만 입력가능합니다.")
                    document.f.email.focus();
                    document.f.email.select();
                    return false;
                }
            }
     
            if (document.f.name.value == "") {
                alert("닉네임을 입력하지 않았습니다.")
                document.f.name.focus();
                return false;
            }
     
            if(document.f.name.value.length<2){
                alert("닉네임을 2자 이상 입력해주십시오.")
                document.f.name.focus();
                return false;
            }
            if(document.f.intro.value== ""){
                alert("자기소개를 입력해주십시오.");
                document.f.intro.focus();
                return false;
          }
   
          if(document.f.intro.length>100){
                alert("자기소개는 100자 이내입니다.");
                document.f.intro.focus();
                return false;
          }
        }
    </script>
</body>
</html>