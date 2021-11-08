<%@page import="movies.MoviesDto"%>
<%@page import="movies.MoviesDao"%>
<%@page import="Sign.SignDao"%>
<%@page import="review.reviewDto"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="review.reviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
table {
	font-size: 1.2em;
}
</style>

<title>Review List</title>
</head>

<script type="text/javascript">
$(function() {
	
	/* 공감수 증가 */
    $("span.likes").click(function() {
		
		var num=$(this).attr("num");
		var tag=$(this);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"review/ajaxlikes.jsp",
			data:{"num":num},
			success:function(data){
				tag.next().text(data.likes);
				tag.next().animate({"font-size":"17px"},500,function(){
					$(this).css("font-size","1em");
				});
			}
		});
	});
});
</script>

<body>
<%
//로그인상태,dao
String loginok=(String)session.getAttribute("loginok");
reviewDao dao=new reviewDao();

//페이징
int totalCount; 
int totalPage;  
int startPage; 
int endPage;  
int start;  
int perPage=3;  
int perBlock=5;  
int currentPage;
int no;  

//총 개수
totalCount=dao.getTotalCount();

//현재 페이지 번호
if(request.getParameter("currentPage")==null){
	currentPage=1;
} else{
	currentPage=Integer.parseInt(request.getParameter("currentPage"));
}

//총페이지 개수
totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

//각 블럭의 시작페이지
startPage=(currentPage-1)/perBlock*perBlock+1;

endPage=startPage+perBlock-1;

if(endPage>totalPage)
	endPage=totalPage;

//각 페이지에서 불러올 시작번호
start=(currentPage-1)*perPage;

//각페이지에서 필요한 게시글
List<reviewDto> list=dao.getList(start, perPage);

//각 글앞에 붙일 시작번호
no=totalCount-(currentPage-1)*perPage;

//날짜
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>     


<!-- 관람평 출력 -->
<div class="container" align="center">

<!-- 로그인시 작성버튼 생성 -->
<% if(loginok!=null) { %>
<button type="button" onclick="location.href='review/reviewform.jsp'" class="btn btn-outline-light"
   id="btnadd">작성</button>
 <% } 
 %>

<%
for(reviewDto dto:list){	
	//signdao에서 이름 얻기
	SignDao sdao=new SignDao();
	String name=sdao.getName(dto.getMyid());
	
	MoviesDao mdao=new MoviesDao();
	String movie=mdao.getTitle(dto.getMovie_num());
	%>
	<table class="table table-bordered" style="width: 800px; margin-top: 20px;">
   
<!-- 영화 포스터,이름 -->
    <tr>
      <td rowspan="7" style="width: 120px; text-align: center;">
      
         <a href="index.jsp?main=movie/movieDetail.jsp?movie_num=<%=dto.getMovie_num()%>">
           <img alt="" src="./tmplt/img/<%= dto.getMovie_num() %>.jpeg" width="100px" height="140px">
         </a>
        <b style="color: white;"><%=movie %></b>
      </td>
    </tr>
    
<!-- 글제목,공감 -->
    <tr style="height: 40px;"> 
      <td style="color: white;"><b><%=dto.getNum() %>.  <%=dto.getSubject() %></b>      
      </td>
    </tr>
      
<!-- 글내용 -->
    <tr>
      <td style="color: white;"><%=dto.getContent().replace("\n", "<br>") %></td>  
    </tr>
    
<!-- 작성자,작성일 -->
    <tr style="height: 40px;">
      <td>  
      <span class="likes glyphicon glyphicon-thumbs-up" style="color: white; cursor: pointer; font-size: 1.2em; color: #ffffe0;" num="<%=dto.getNum()%>"></span>
      <span class="getlikes" style="color: white;"><%=dto.getLikes() %></span>   
      <span style="float: right; color: white;"><%=sdf.format(dto.getWriteday()) %></span>
      <span style="float: right; color: white;"><%=name %> (<%=dto.getMyid() %>)&nbsp;&nbsp;|&nbsp;&nbsp;</span>
      </td>   
    </tr>
    
<!-- 수정,삭제 버튼 -->
         <%
        //로그인한 아이디 세션에서 얻기
        String myid=(String)session.getAttribute("myid");
        
        //로그인한 아이디와 글쓴아이디가 같을 경우에만 삭제,수정
	      if(loginok!=null && dto.getMyid().equals(myid)){ %>
	      <tr>
	        <td colspan="2" align="center">
	    	  <a href="index.jsp?main=review/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: yellow;">수정 | </a>  	  
	    	  <a href="review/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: yellow;">삭제</a>
	    	</td>
         </tr> 
	     <% }
        %>    
  </table>
<%}
%>
</div>


<!-- 페이징 처리 -->
<div style="width: 600px; text-align: center;" class="container">
    <ul class="pagination jistify-content-center">
      <%
      if(startPage>1){%>
    	  <li>
    	    <a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=startPage-1%>">《</a>
    	  </li>
      <%}      
      for(int p=startPage;p<=endPage;p++){
    	  if(p==currentPage){%>
    		<li class="active">
    		<a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=p%>"><%=p %></a>
    		</li>  
    	  <%} else{ %>
    		  <a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=p%>"><%=p %></a>
    		  <%}
      }      
      if(endPage<totalPage){%>
    	  <li>
    	    <a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=endPage+1%>">》</a>
    	  </li>
      <%}
      %>
    </ul>
  </div>
  
<!-- Js Plugins -->
    <script src="tmplt/js/KobisOpenAPIRestService.js"></script>
	<script src="tmplt/js/jquery-3.3.1.min.js"></script>
	<script src="tmplt/js/bootstrap.min.js"></script>
	<script src="tmplt/js/player.js"></script>
	<script src="tmplt/js/mixitup.min.js"></script>
	<script src="tmplt/js/jquery.nice-select.min.js"></script>
	<script src="tmplt/js/jquery.slicknav.js"></script>
	<script src="tmplt/js/owl.carousel.min.js"></script>
	<script src="tmplt/js/main.js"></script>
  
</body>
</html>