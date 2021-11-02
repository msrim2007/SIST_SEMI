<%@page import="review.reviewDto"%>
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
<title>Update Form</title>
</head>

<%
//num
String num=request.getParameter("num");
//페이지 번호 읽기
String currentPage=request.getParameter("currentPage");

//db에서 num에 해당하는 dto 읽기
reviewDao dao=new reviewDao();
reviewDto dto=dao.getData(num);
%>


<body>
<form action="review/updateaction.jsp" method="post" enctype="multipart/form-data" class="form-inline">
 
 <!-- hidden 처리 -->
  <input type="hidden" name="num" value="<%=num%>">
  <input type="hidden" name="currentPage" value="<%=currentPage%>">
 
  <table class="table table-bordered" style="width: 600px; margin-left: 50px; margin-top: 50px;">
  <caption style="margin-left: 280px;font-size: 1.5em;"><b>관람평</b></caption>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-film" style="margin-left: 30px;"></span></th>
    <td>
      <input type="radio" value="<%=dto.getMovie_num() %>">
    </td>
  </tr>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-list" style="margin-left: 30px; margin-top: 10px;"></span></th>
    <td>
      <input type="text" class="form-control" required="required" autofocus="autofocus" name="subject" 
        style="width: 300px;" value="<%=dto.getSubject()%>">
    </td>
  </tr>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-pencil" style="margin-left: 30px; margin-top: 130px;"></span></th>
    <td>
      <textarea style="width: 400px; height: 300px;"><%=dto.getContent() %></textarea>
    </td>
    
  </tr>
  
  <tr>
  <td colspan="2" align="center">
    <button type="submit" class="btn btn-danger">수정</button>
  </td>
  </tr>
  </table>
</form>
</body>
</html>