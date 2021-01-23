<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko">
<%@ include file="../header.jsp"%>
<style>
</style>
<body>
	<div class="content container-fluid" >
		<p style="text-align:center;font-size:2em;font-weight:bold;margin-top:50px;">안녕하세요! 버스킹 커뮤니티 Fado 입니다!</p>
			<%
				if((userID!=null)&&(user.getPart().equals("normal"))){
			%>
		<div style="margin:0 auto;margin-top:30px;background:white;width:90%;border-radius:30px;padding:30px;">
			<p style="text-align:left;font-size:1.5em;font-weight:bold;">버스커 신청서</p>
			<form>
				<p><input type="hidden" name="id" class="form-control" value="<%=user.getId() %>"><%=user.getId() %></p>
				<input type="text" name="email" class="form-control" placeholder="이메일">
				<textarea name="intro" class="form-control" style="height:100px;resize: vertical;" placeholder="신청 사유"></textarea>
				<p>준비중입니다!</p>
				<!-- <button type="submit" class="btn2" style="background:rgb(52, 152, 219);">신청</button> -->
			</form>
			
		</div>
		<%
				}
			%>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>

</html>
