<%@page import="movies.MoviesDto"%>
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
				alert(data.likes);
				tag.next().text(data.likes);
				tag.next().next().animate({"font-size":"20px"},1000,function(){
					$(this).css("font-size","0px");
				});
			}
		});
	});
});
</script>

<body>
<%
//로그인상태 확인후 방명록입력폼 나타내기
String loginok=(String)session.getAttribute("loginok");

reviewDao dao=new reviewDao();

//페이징
int totalCount; 
int totalPage;  
int startPage; 
int endPage;  
int start;  
int perPage=10;  
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

<%-- <%
if(loginok!=null){ //로그인중 %>
	<jsp:include page="reviewform.jsp"/>
	<hr align="left" width="700">
<%} 
%> --%>

<!-- 관람평 출력 -->
<div>
<button type="button" onclick="location.href='review/reviewform.jsp'" class="btn btn-default">작성</button>
<%
for(reviewDto dto:list){	
	//signdao에서 이름 얻기
	SignDao sdao=new SignDao();
	String name=sdao.getName(dto.getMyid());
	
	//moviedto
	MoviesDto mdto=new MoviesDto();
	%>
	<table class="table table-bordered" style="width: 600px; margin-top: 30px; margin-left: 100px;">
   
<!-- 번호 -->
    <tr>
      <td rowspan="5">
        <b><%=dto.getNum() %></b>
      </td>
    </tr>
    
<!-- 영화 -->
    <tr>
      <%-- <td><%=mdto.getMovie_num() %></td> --%>  
    </tr>
    
<!-- 글제목,공감 -->
    <tr>
      <td><b><%=dto.getSubject() %></b>
      <span class="likes" style="cursor: pointer; position: absolute; left: 700px;" num="<%=dto.getNum()%>">공감</span>
	  <span class="getlikes" style="position: absolute; left: 730px;"><%=dto.getLikes() %></span>
      <span class="glyphicon glyphicon-thumbs-up" style="color: magenta; font-size: 0px; float: right; "></span>
      </td>
    </tr>
    
<!-- 글내용 -->
    <tr>
      <td><%=dto.getContent().replace("\n", "<br>") %></td>  
    </tr>
    
<!-- 작성자,작성일 -->
    <tr>
      <td>
      <span style="margin-left: 340px;"><%=name %> (<%=dto.getMyid() %>)</span>&nbsp;&nbsp;|&nbsp;&nbsp;
       
      <span><%=sdf.format(dto.getWriteday()) %></span>
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
	    	  <a href="index.jsp?main=review/updateform.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black;">수정</a>  	  
	    	  | <a href="review/delete.jsp?num=<%=dto.getNum() %>&currentPage=<%=currentPage %>" style="color: black;">삭제</a>
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
    <ul class="pagination">
      <%
      if(startPage>1){%>
    	  <li>
    	    <a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=startPage-1%>">이전</a>
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
    	    <a href="index.jsp?main=review/reviewlist.jsp?currentPage=<%=endPage+1%>">다음</a>
    	  </li>
      <%}
      %>
    </ul>
  </div>
</body>
</html>