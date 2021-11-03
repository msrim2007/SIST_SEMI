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
			url:"guest/ajaxlikes.jsp",
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
reviewDao dao=new reviewDao();

//페이징
int totalCount;  //총글수
int totalPage;  //총페이지수
int startPage;  //각 블럭의 시작 페이지
int endPage;  //각 블럭의 마지막 페이지
int start;  //각 페이지의 시작 번호
int perPage=10;  //한페이지에 보여질 글의 개수
int perBlock=5;  //한 페이지에 보여지는 페이지 개수
int currentPage; //현재페이지
int no;  //넘버값

//총 개수
totalCount=dao.getTotalCount();

//현재 페이지 번호 읽기..단 null일 경우(페이지 없을 경우) 1페이지 설정
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

//각페이지에서 필요한 게시글 가져오기..dao에서 만들었음
List<reviewDto> list=dao.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총글이 20개일 경우 1페이지 20, 2페이지 15부터
//출력해서 1씩 감소하면서 출력할것
no=totalCount-(currentPage-1)*perPage;

//날짜
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>


<!-- 관람평 출력 -->
<div>

<%
for(reviewDto dto:list){
	
	%>
	<table class="table table-bordered" style="width: 600px;">
   
<!-- 영화제목 -->
    <tr>
      <td>
        <b><%=dto.getMovie_num() %></b>
      </td>
    </tr>
    
<!-- 글제목 -->
    <tr>
      <td><%=dto.getSubject() %></td>
    </tr>
    
<!-- 글내용 -->
    <tr>
      <td><%=dto.getContent().replace("\n", "<br>") %></td>  
    </tr>
    
<!-- 작성자,작성일,공감 -->
    <tr>
      <td>
      <span><%=dto.getUser_num() %></span>
      <span><%=sdf.format(dto.getWriteday()) %></span>
      <span class="num" num="<%=dto.getNum() %>">공감</span>
      <span class="likes"><%=dto.getLikes() %></span>
      </td>   
    </tr>
      
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