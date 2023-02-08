<%@include file="adminHeader.jsp" %>
<%@include file="../Footer.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/proceedOrder.css">
<style type="text/css">
body{
   background-color: #f0f5f1;
}
table {
    
	
	border-bottom: 1px solid black;
	font-size: 14px;
}
table tr th{
   padding: 10px 10px;
}
table tr td{
   padding: 10px 20px;
   background-color: #eae4ed;
}
table tr td:nth-child(even){
   background-color: #c1e7e8;
}
h1{
    margin-top: 80px;
    background-color: #f0f5f1;
}
</style>
</head>
<body>
    <h1>Message Recieved</h1>
    <table>
       <tr>
          <th>S NO</th>
          <th>Email</th>
          <th>Subject</th>
          <th>Message</th>
       </tr>
       <%
           
           Connection conn = ConnectionProvider.getConnection();
           try{
        	   Statement st = conn.createStatement();
        	   ResultSet rs = st.executeQuery("select * from message");
        	   while(rs.next())
        	   {
        	       %>
        		   <tr>
        	          <td><%=rs.getInt(1) %></td>
        	          <td><%=rs.getString(2) %></td>
        	          <td><%=rs.getString(3) %></td>
        	          <td><%=rs.getString(4) %></td>
        	       </tr>
        	   <%}
           }catch(Exception e){
        	   out.println(e);
           }
       %>
       
   </table>
</body>
</html>