<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
th {
	font-family: 'Nanum Myeongjo';
	font-size: 11pt;
}

td {
	font-family: 'Nanum Myeongjo';
	font-size: 11pt;
}

</style>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<%
//프로젝트 경로구하기
String root=request.getContextPath();

%>

<body>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title> 

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Nanum+Myeongjo:wght@800&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=root %>/tmplt/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=root %>/tmplt/css/style.css" type="text/css">
</head>

</head>

<body>

    <!-- Signup Section Begin -->
    <section class="signup spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Sign Up</h3>
                        <form action="signupaction.jsp" name="signfrm" method="post" class="form-inline"
                        onsubmit="return check(this)">
                            <table class="table table-boredered" style=" width:1000px; background-color: white;" >
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">이름</th>
                                <td style="background-color: white;">
                                <input type="text" name="name" placeholder="이름을 입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">아이디</th>
                                <td style="background-color: white;">
                                  <input type="text" name="id" class="form-control" readonly="readonly">
                                  <button type="button" id="btnIdcheck">중복확인</button>
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">비밀번호</th>
                                <td style="background-color: white;">
                                  <input type="password" name="pass1" placeholder="비밀번호를 입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">비밀번호 확인</th>
                                <td style="background-color: white;">
                                <input type="password" name="pass2" placeholder="비밀번호를 재입력해주세요." required="required">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">생년월일</th>
                                <td style="background-color: white;">
                                <input type="date" name="birth">
                                </td>
                              </tr>
                              
                              <tr>
                                <th style="width: 60px; height:30px; background-color: 	#F5F5F5;">전화번호</th>
                                <td style="background-color: white;"><input type="text" name="hp" placeholder="전화번호"></td>
                              </tr>
                              
                              <tr>
                              <th width="100px;" style="background-color: #F5F5F5;">이메일</th>
                              <td>
                                <input type="text" name="email1" class="form-control"
                                required="required" style="width: 80px;">
                                <b>@</b>
                                <input type="text" name="email2" class="form-control" id="email2" 
                                required="required" style="width: 140px;"> &nbsp;&nbsp;&nbsp;
                                <select style="width: 60px; height: 40px" id="selemail" class="form-control">
                                  <option value="-" selected="selected">직접입력</option>
                                  <option value="naver.com">네이버</option>
                                  <option value="gmail.com">구글</option>
                                  <option value="hanmail.net">다음</option>
                                </select>
                              </tr>
                              
                              <tr>
                              <td colspan="2" align="center">
                              <input type="submit" value="회원가입">
                              </td>
                              </tr>
                            </table>
                        </form>
                        <h5>Already have an account? <a href="#">Log In!</a></h5>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <h3>Login With:</h3>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                            </li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Signup Section End -->
    
    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="page-up">
            <a href="#" id="scrollToTopButton"><span class="arrow_carrot-up"></span></a>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="footer__nav">
                        <ul>
                            <li class="active"><a href="./index.html">Homepage</a></li>
                            <li><a href="./categories.html">Categories</a></li>
                            <li><a href="./blog.html">Our Blog</a></li>
                            <li><a href="#">Contacts</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                      Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                      <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>

                  </div>
              </div>
          </div>
      </footer>
      <!-- Footer Section End -->

      <!-- Search model Begin -->
      <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch"><i class="icon_close"></i></div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search model end -->

    <!-- Js Plugins -->
    <script src="<%=root %>/tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="<%=root %>/tmplt/js/bootstrap.min.js"></script>
	<script src="<%=root %>/tmplt/js/player.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.nice-select.min.js"></script>
	<script src="<%=root %>/tmplt/js/mixitup.min.js"></script>
	<script src="<%=root %>/tmplt/js/jquery.slicknav.js"></script>
	<script src="<%=root %>/tmplt/js/owl.carousel.min.js"></script>
	<script src="<%=root %>/tmplt/js/main.js"></script>

</body>
<script type="text/javascript">
$(function(){
	//이메일 선택 이벤트
	$("#selemail").change(function(){
		if($(this).val()=='-'){
			$("#email2").val('');  //지정된 메일 지우기
			$("#email2").focus();  //포커스 주기
		}else{
			$("#email2").val($(this).val());
		}
	});
	
	//아이디 입력 버튼 이벤트
	$("#btnIdcheck").click(function(){
		window.open("idsearch.jsp","","width=600px, height=200px,left-top=500px,top=100px");
	});
	
});

//check
function check(f) {
	
	if(f.id.value.length==0){
		alert("아이디 입력을 해주세요");
		return false;
	}
		
	if(f.pass1.value!=f.pass2.value){
		alert("비밀번호가 서로 다릅니다");
		f.pass1.value="";
		f.pass2.value="";
		return false; //action이 호출되지않는다
	}
}
</script>
</html>
</body>
</html>