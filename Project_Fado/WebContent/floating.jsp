<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<style>
 #quick_bg {margin:0 auto;text-align:center;position:relative;}
 #quick {position:absolute;z-index:2;top:15px;width:100px;right:0px;}
 #container {position:relative;}
</style>
<body>
<div id="quick_bg">
					<div id="quick">
						<a href="write.jsp"><i class="fas fa-plus-circle fa-5x" style="color:rgb(52, 152, 219);"></i></a>
					</div>
				</div>
				
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<script>
	var quick_menu = $('#quick');
	var quick_top = 380;

	quick_menu.css('top', $(window).height() );
	$(document).ready(function(){
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top +"px" }, 100 ); 
	$(window).scroll(function(){
	quick_menu.stop();
	quick_menu.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 300 );
	});
	});</script>
</body>
</html>