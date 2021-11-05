<%@page import="event.eventDto"%>
<%@page import="event.eventDao"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">

.btn_wrap{

	margin: 60px 0;
    text-align: center;
}
.tolist{
	display: inline-block;
    box-sizing: border-box;
    border-radius: 4px;
    border: 1px solid #414141;
    font-size: 14px;
    color: #ffffff !important;
    text-align: center;
    background-color: #414141;
    cursor: pointer;
    height: 43px;
 	min-width: 100px;
 	 margin: 0 3px;
 	 height: 45px;
    line-height: 43px;
    padding: 0 18px;
}
.sideBanner {
 position:absolute;
 top:50%;
 margin-top:-50px;
 right:10px
}
</style>
<title>Insert title here</title>
</head>
<%
String num = request.getParameter("num");
eventDao dao = new eventDao();
eventDto dto = dao.selectData(num);

%>
<div class="sideBanner">
    <img alt="" src="event/event_img/top.png">
 </div>
<body>
<table>
	<tr>
		<td>
			<div>
				<b style="font-size: 18pt;"><%=dto.getSubject() %></b>
				<br>
				<span style="font-size: 8pt; color: gray; margin: auto;">
					<%=dto.getTerm() %>
				</span>
			</div>
			<hr>
		</td>
	</tr>
	<tr>
		<td >
			<div style="text-align: center;">
			<img alt="" src="event/event_img/<%=dto.getContent()%>" >
			</div>
		</td>
	</tr>
	<tr>
		<td>
		<br>
		<br>
		
		<div style="margin-top: 15px;" class="btn_wrap">
			
			<a href='index.jsp?main=event/eventlist.jsp' class="tolist">목록</a>
		</div>
		<hr style="border: 1px solid white; width: 1000px;">
		</td>
	</tr>
</table>


<script type="text/javascript">
var floatPosition = parseInt($(".sideBanner").css('top'))

//scroll 인식
$(window).scroll(function() {

 // 현재 스크롤 위치
 var currentTop = $(window).scrollTop();
 var bannerTop = currentTop + floatPosition + "px";

 //이동 애니메이션
 $(".sideBanner").stop().animate({
   "top" : bannerTop
 }, 500);
 
}).scroll();
$(".sideBanner").click(function() { $('html, body').animate({ scrollTop : 0 }, 400); return false; });
</script>

</body>
</html>