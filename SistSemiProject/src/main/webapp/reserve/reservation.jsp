<%@page import="movies.MoviesDto"%>
<%@page import="movies.MoviesDao"%>
<%@page import="java.util.ArrayList"%>
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
		div.container {
			width: auto;
			height: 60%;
		}
	
		div.select-movie {
			float: left;
			margin-right: 5%;
			border: 1px solid #ccc;
			width: 40%;
			height: 600px;
			border-radius: 5%;
			padding: 0;
		}
		
		div.select-theater {
			float: left;
			margin-right: 5%;
			border: 1px solid #ccc;
			width: 30%;
			height: 600px;
			border-radius: 5%;
		}
		
		div.select-date {
			float: left;
			border: 1px solid #ccc;
			width: 20%;
			height: 600px;
			border-radius: 5%;
		}
		
		div.scroll {
			height: 90%;
			overflow: auto;
		}
		
		/* 스크롤바 설정*/
		div.scroll::-webkit-scrollbar{
		    width: 6px;
		}
		
		/* 스크롤바 막대 설정*/
		div.scroll::-webkit-scrollbar-thumb{
		    height: 10%;
		    background-color: rgba(255,255,255,1);
		    /* 스크롤바 둥글게 설정    */
		    border-radius: 10px;    
		}
		
		/* 스크롤바 뒷 배경 설정*/
		div.scroll::-webkit-scrollbar-track{
		    background-color: rgba(0,0,0,0);
		}
	</style>
</head>

<body>
	<div class="container" align="center" style="margin-top: 20px;">
		<%
		ArrayList<MoviesDto> list = new MoviesDao().getAllDatas();
		int movie_cnt = 1;
		%>
		<h2 style="margin-bottom: 5%;"><b style="color: white;">예매 하기</b></h2>
		<div class="select-movie" align="center">
			<h3><b style="color: magenta;">SELECT MOVIE</b></h3><br>
			<div class="scroll">
				<table class="table" style="font-size: 12pt;">
					<thead class="thead-light">
						<tr>
							<th>#</th><th>영화</th><th>장르</th>
						</tr>
					</thead>
					<tbody style="color: white;">
					<%for (MoviesDto i : list) {%>
						<tr>
							<td><%= movie_cnt++ %></td>
							<td><%= i.getKr_title() %></td>
							<td><%= i.getGenre() != null ? i.getGenre() : "-" %></td>
						</tr>
					<%} %>
					<tr>
						<td colspan="3">스크롤 테스트</td>
					</tr>
					<tr>
						<td colspan="3">스크롤 테스트</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<%
		
		%>
		<div class="select-theater" align="center">
			<h3><b style="color: magenta;">SELECT THEATER</b></h3>
			
			
		</div>
			
		<div class="select-date" align="center">
			<h3><b style="color: magenta;">SELECT DATE</b></h3>
			
		</div>
		
		<button class="btn btn-info btn-lg" id="selectSeat" style="margin-top: 10px;">좌석 선택</button>
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