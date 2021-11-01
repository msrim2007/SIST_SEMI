<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="mysql.db.DbConnect"%>
<%@page import="java.sql.Connection"%>
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

    <!-- 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

<body>
	<%
	DbConnect db = new DbConnect();
	
	Connection conn = db.getConnection();
	
	PreparedStatement pstmt = null; 
	
	String sql = "INSERT INTO test (num) VALUES(null)";
	
	try{
	pstmt = conn.prepareStatement(sql);
	
	pstmt.execute();
	}catch(Exception e){
		e.getMessage();
	}finally{
		db.dbClose(pstmt, conn);	
	}
	%>
</body>

</html>