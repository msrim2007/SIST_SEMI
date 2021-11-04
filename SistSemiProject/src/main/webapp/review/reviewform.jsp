<%@page import="movies.MoviesDto"%>
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
<title>Insert title here</title>
</head>
<body>  
    
<form action="reviewaction.jsp" method="post" class="form-inline">
  <table class="table table-bordered" style="width: 600px; margin-left: 50px; margin-top: 50px;">
  <caption style="margin-left: 280px;font-size: 1.5em;"><b>관람평</b></caption>
  
  <%
  MoviesDto mdto=new MoviesDto();
  %>
  
<!--   <tr>
    <th width="100"><span class="glyphicon glyphicon-film" style="margin-left: 30px;"></span></th>
    <td>
movie_num(int) 활용하기..for문..다른 곳도 다 고치기
      <select id="movie_num" class="form-control">
        <option value="20191061">듄</option>
        <option value="이터널스">이터널스</option>
        <option value="베놈2">베놈2</option>
        <option value="프리가이">프리가이</option>  
        <option value="007 노 타임 투 다이">007 노 타임 투 다이</option>
        <option value="강릉">강릉</option>        
      </select>
    </td>
  </tr> -->
   
  <tr>
    <th width="100"><span class="glyphicon glyphicon-list" style="margin-left: 30px; margin-top: 10px;"></span></th>
    <td>
      <input type="text" class="form-control" required="required" autofocus="autofocus" name="subject" style="width: 300px;">
    </td>
  </tr>
  
  <tr>
    <th width="100"><span class="glyphicon glyphicon-pencil" style="margin-left: 30px; margin-top: 130px;"></span></th>
    <td>
      <textarea style="width: 400px; height: 300px;" name="content" required="required" class="form-control"></textarea>
    </td>
  </tr>
  
  <tr>
  <td colspan="2" align="center">
    <button type="submit" class="btn btn-default">등록</button>
  </td>
  </tr>
  </table>
</form>
</body>
</html>