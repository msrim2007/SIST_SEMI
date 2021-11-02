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

<title>Insert title here</title>
</head>
<body>
<%
//db선언
eventDao dao = new eventDao();

//전체 리스트 가져오기
ArrayList<eventDto> list = dao.getAllDatas();

%>
<table style="width:900px;">
	<caption><b style="color: ">제휴/할인</b></caption>
		<tr>
			<%	
				for(int i=0; i<list.size();i++){
					//i번째 dto얻기
					eventDto dto = list.get(i);
					%>
					<td>
						<a href="content.jsp?num=<%=dto.getEvent_num()%>">
						<img alt="" src="event_img/<%=dto.getImg()%>" style="width: 280px; height: 180px; border= 1px solid gray; margin: 5px; border-radius: 30px;" >
						<br>
						</a>
						<br>
								<%=dto.getSubject() %>
						<span style="color: gray; font-size: 9pt" >
					
							<br>
							<%=dto.getTerm() %>
						</span>
					</td>
					<%
					if((i+1)%3==0){%>
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
