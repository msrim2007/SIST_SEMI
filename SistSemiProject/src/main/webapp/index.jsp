<%@page import="Sign.SignDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
//프로젝트 경로구하기
String root=request.getContextPath();

%>
<head>
	<meta charset="UTF-8" name='viewport' content='width=device-width, initial-scale=1.0'>
	
	<!-- TITLE -->
	<title>영화 예매 웹사이트</title>

	<!-- jQuery -->
    <script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
   	
    <!-- CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="tmplt/js/KobisOpenAPIRestService.js"></script>
	
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
    <%
    request.setCharacterEncoding("utf-8");
    
    String main="./layout/main.jsp";
    if (request.getParameter("main") != null) {
    	main = request.getParameter("main");
    } else {
    	main = "./layout/main.jsp";
    }
    
    boolean isLogin = false;
    %>
</head>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="header__logo">
                        <a href="./index.jsp?main=layout/main.jsp">
                            <b style="font-size: x-large;">SIST MOVIE</b>
                        </a>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="header__nav">
                        <nav class="header__menu mobile-menu">
                            <ul>
                                <li class="active"><a href="./index.jsp?main=layout/main.jsp">Home</a></li>
                                <li><a href="./categories.html">영화 예매 <span class="arrow_carrot-down"></span></a>
                                    <ul class="dropdown">
                                        <li><a href="./index.jsp?main=movie/movieList.jsp">영화 목록</a></li>
                                        <li><a href="./index.jsp?main=reserve/reservation.jsp">예매</a></li>
                                    </ul>
                                </li>
                                <li><a href="./index.jsp?main=review/reviewlist.jsp">후기</a></li>
                                <li><a href="./index.jsp?main=event/eventlist.jsp">이벤트</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="col-lg-2">
                    <div class="header__right">
                    	<a style="display: display;" href="./index.jsp?main=admin/adminConfig.jsp" class="search-switch"><span class="glyphicon glyphicon-cog"></span></a>
                        <a href="./index.jsp?main=sign/signup/signupform.jsp"><span class="icon_profile"></span></a>
                        <!-- 로그인,로그아웃 버튼 부분 시작 -->
                        <span>
                        <%
                        //로그인중인지..세션값 얻기
                        String loginok=(String)session.getAttribute("loginok");

                        //아이디 얻기
                        String myid=(String)session.getAttribute("myid");

                        //db로부터 가입한 이름 얻기
                        SignDao dao=new SignDao();
                        String name=dao.getName(myid);

                        if(loginok==null){%>
                        <button type="button" class="btn btn-success" style="width: 55px; height: 30px;"
                        onclick="location.href='index.jsp?main=sign/login/loginform.jsp'">LOG IN</button>
                        <%}else{%>
                        <button type="button" class="btn btn-danger" style="width: 55px height: 30px;"
                        onclick="location.href='sign/login/logoutaction.jsp'">LOG OUT</button>
                        <%}
                        %>
                        </span>
                        <!-- 로그인,로그아웃 버튼 부분 끝-->
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </header>
    <!-- Header End -->

    <!-- Main Section -->
    <div class="container">
    	<div>
    		<jsp:include page="<%= main %>"></jsp:include>
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