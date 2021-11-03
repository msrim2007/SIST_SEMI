<%@page import="event.eventDto"%>
<%@page import="java.util.ArrayList"%>
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
form.form1{
	float: right;
}

</style>
<title>Insert title here</title>
</head>

<body>
<%
//db선언
eventDao dao = new eventDao();

//전체 리스트 가져오기
ArrayList<eventDto> list = dao.getAllDatas();


%>
<form method="post" action="index.jsp?main=event/search.jsp"  class="form1">
	<div class="col-lg-4">
		<input type="text" class="form-control pull-right" placeholder="Search" name="searchWord" style="width: 150px;"  />
		
	</div>
	<button class="btn btn-default btn1" type="submit" style="margin-left: 0px;">
		<span class="glyphicon glyphicon-search"></span>
		</button>
</form>
<table style="width:900px; text-align: center;">
	<caption><b  style="color:black; font-size: 18pt; margin: 20px;">제휴할인</b></caption>
	
		<tr>
			<%	
				for(int i=8; i>=0;i--){
					//i번째 dto얻기
					eventDto dto = list.get(i);
					%>
					<td>
						<br>
						<a href="index.jsp?main=event/content.jsp?num=<%=dto.getEvent_num()%>">
						<img alt="" src="event/event_img/<%=dto.getImg()%>" style="width: 280px; height: 180px; border= 1px solid gray; margin: 15px; border-radius: 30px;" >
						<br>
						</a>
						<br>
								
						<div style="text-align: center;">
						<%=dto.getSubject() %>
						<span style="color: gray; font-size: 9pt" >
					
							<br>
							<%=dto.getTerm() %>
						</span>
						</div>
					</td>
					<%
					if(i%3==0){%>
						</tr><tr>	
					<%}
					%>
				<%
				}
				%>
		</tr>
</table>

</body>

</html>
