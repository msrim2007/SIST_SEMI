<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="showing.ShowingDto"%>
<%@page import="showing.ShowingDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>
	<title>Document</title>
	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	<%
	request.setCharacterEncoding("utf-8");
	Timestamp show_date = Timestamp.valueOf(request.getParameter("showing_date") + " 00:00:00");
	
	ShowingDao dao = new ShowingDao();
	ShowingDto dto = new ShowingDto();
	
	dto.setMovie_num(request.getParameter("movie_num"));
	dto.setShowing_date(show_date);
	
	dao.insertShowing(dto);
	%>
</body>
	<script type="text/javascript">
		location.href = "index.jsp?main=admin/setShowing.jsp";
	</script>
</html>