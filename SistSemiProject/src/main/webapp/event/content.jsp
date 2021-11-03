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

<title>Insert title here</title>
</head>
<%
String num = request.getParameter("num");
eventDao dao = new eventDao();
eventDto dto = dao.selectData(num);

%>
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
			<img alt="" src="event/event_img/<%=dto.getContent()%>" style="width: 500px; height: 1200px;">
			</div>
		</td>
	</tr>
	<tr>
		<td>
		<br>
		<br>
		<hr style="border: 1px solid white; width: 1000px;">
		<span style="margin-top: 15px; ">
			
			<button type="button" class="btn btn-danger" onclick="location.href='index.jsp?main=event/eventlist.jsp'">목록으로</button>
		</span>
		<hr style="border: 1px solid white; width: 1000px;">
		</td>
	</tr>
</table>


</script>
</body>
</html>