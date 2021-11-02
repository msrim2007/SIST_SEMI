<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mysql.cj.xdevapi.JsonParser"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>

	<!-- TITLE -->
	<title>INDEX</title>

	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   
    <!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- JS -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="tmplt/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="tmplt/css/style.css" type="text/css">
    
    <style type="text/css">
    	.boxoffice {
    		position: relative;
    		left: 5%;
    		top: 100px;
    		width: 100%;
    		height: 600px;
    		text-align: center;
    	}
    	
    	button {
    		margin: 50px;
    	}
    </style>
    
    <%
    // 날짜 포맷
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    String day = sdf.format(new Date());
    String now = day;
    if (request.getParameter("day") != null) {
    	day = request.getParameter("day");
    }
    %>
</head>

<body>
	<div class="container">
		<div class="boxoffice">
			<h1><b style="color: white;">관리자 페이지</b></h1><br><br><br><br>
			<button class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/dailyBoxoffice.jsp'">일별 박스오피스 가져오기</button>
			<button class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/weekBoxoffice.jsp'">주간 박스오피스 가져오기</button>
			<button class="btn btn-info btn-lg" onclick="location.href='index.jsp?main=admin/allMovie.jsp'">영화 목록 가져오기</button>
			<br><br><br>
			<h2><b style="color: white;">날짜 선택</b></h2>
			<input type="date" id="daily" value="<%= day %>">
		</div>
		
		<script type="text/javascript">
			$("#daily").change(function(){
				var date1 = new Date($("#daily").val());
				var date2 = new Date();
				if (date1 > date2){
					alert("잘못된 날짜입니다.");
				} else {
					$("#result").html($("#daily").val());
					location.href = "index.jsp?main=admin/dailyBoxoffice.jsp?day=" + $("#daily").val();
				}
			});
		</script>
		
		<div id="result">
		
		</div>
	</div>
	
	
	
	<!-- Js Plugins -->
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/jquery.nice-select.min.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>
</body>

</html>