<%@page import="event.eventDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="event.eventDto"%>
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
String srch = request.getParameter("searchWord");
eventDao dao = new eventDao();
ArrayList<eventDto> list = dao.searchData(srch);
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
	
	
		<tr>
			<%	if(list.isEmpty()){%>
				<div style="text-align: center; font-size: 20pt; color: gray;">
					'<%=srch %>'에 대한 검색 결과가 없습니다
				</div>
			<%}else{
				for(int i=0;i<list.size();i++){
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
					if((i+1)%3==0){%>
						</tr><tr>	
					<%}
					%>
				<%
				}
				
			}
				%>
	
		</tr>
</table>
</body>
</html>
