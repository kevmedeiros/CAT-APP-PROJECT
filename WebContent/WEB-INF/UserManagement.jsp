<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

<%
	String User_ID = (String) request.getAttribute("User_ID");	// receiving value from servlet
	
	// out.print(" " + User_ID);
		
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/catapp"
     user="root"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from users where User_ID = "<%=User_ID%>";
</sql:query>


<div id="New_Window_content" style="margin:auto;">
	<div style="margin:auto; width:700px; background-color: AntiqueWhite; padding: 50px;
		margin-top:50px;
		margin-bottom:50px;
-webkit-box-shadow: 0 0 6px 4px black;
   -moz-box-shadow: 0 0 6px 4px black;
        box-shadow: 0 0 16px 4px black;">
        <head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
			<title>Authorization</title>

			<!-- Bootstrap core CSS -->
			<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
			<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

		</head>
    	<h3 style="text-align: center;" class = "text-danger"><b>
    	Authorization and Password Reset</b></h2><br>
    	Authorization: ${Authorization}
      <c:forEach var="row" items="${result.rows}">  
    	<form action="${pageContext.request.contextPath}/ManageAction" Mehtod="post">
    		<b>Username: </b><c:out value="${row.User_ID}"/></b><p></p>
    		<input type="hidden" name="User_ID" value="${row.User_ID}">
    		<b>Name: Emily White</b><p></p>
    		<c:choose>
    			<c:when test="${row.Approved == 'Yes'}">
        			<c:set var="checked" scope="session" value="checked"/> 
    			</c:when>    
    			<c:otherwise>
    				<c:set var="checked" scope="session" value=""/> 
    			</c:otherwise>
			</c:choose>
    		
  			<input type="checkbox" name="Authorization" value="Yes_authorizing" ${checked}><b>Authorization</b></label><p></p>
			<input type="checkbox" name="Change_password" value="Change_password"><b>Change Password</b><p></p>
			
    		<b>New Password: </b><input type="password" name="Passowrd_1" ></input> 
    		<b>&nbsp; &nbsp; Repeat Password: </b><input type="password" name="Password_2" ></input><p></p>
    		
    		<b>Phone Number: </b><c:out value="${row.Phone_Number}"/><p></p>
    		<b>E-mail address: </b><c:out value="${row.Email}"/><p></p>
    		<b>Supervisor Username: </b><c:out value="${row.Supervisor_ID}"/><p></p>
    		<b>Supervisor Name: </b><c:out value="${row.Supervisor_First_Name}"/> 
    				<c:out value="${row.Supervisor_Last_Name}"/><p></p>
    		<b>Supervisor Phone number: </b><c:out value="${row.Supervisor_Phone_Number}"/><p></p>
    		<b>Supervisor Email: </b><c:out value="${row.Supervisor_Email}"/><p></p>
    		<p style="margin:auto; text-align:center">
    		<input type="submit" class="btn btn-primary" value ="Save"></input>
  
  
  
  			<a href="${pageContext.request.contextPath}/Admin">
  			<input type="button" class="btn btn-danger" value ="Cancel"></input></a></p>
  		</form>
      </c:forEach>  
    </div>
</div>	
	
	
	
	
</body>
</html>