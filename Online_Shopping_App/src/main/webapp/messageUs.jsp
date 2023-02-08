<%@include file="Header.jsp" %>
<%@include file="Footer.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
   display: flex;
   width: 100%;
   height: 100vh;
   flex-direction: column;
   align-items: center;
   background-color: #f0f5f1;
}
.form-box{
   display: flex;
   flex-direction: column;
}
h1 {
	 margin-top: 80px;
    background-color: #f0f5f1;
	font-family: sans-serif;
}
.input-sub {
	width: 500px;
	font-size: 18px;
	padding: 5px 2px;
	margin-top: 30px;
}
textarea {
	margin-top: 20px;
	font-size: 18px;
	padding: 3px 2px;
}
.input-but{
    width: 70px;
    height: 30px;
    margin-top: 20px;
    cursor: pointer;
}
</style>
</head>
<body>
  
    <h1>Message Us</h1>
    <%
        String msg = request.getParameter("msg");
        if("done".equals(msg))
        {%>
        	<h3>Message Send Successfully ! We will contact you later...</h3>
        <%}
        if("error".equals(msg))
        {%>
        	<h3>Message Send Failed!!!...</h3>
        <%}
    %>
    
    
    <form action="messageUsAction.jsp" method="post" class="form-box" >
       <input type="text" placeholder="Enter Subject" name="subject" class="input-sub" required="required">
       <textarea rows="8" cols="8" placeholder="Enter your Message" name="message" required="required"></textarea>
       <button type="submit" class="input-but">Send</button>
    </form>
  
</body>
</html>