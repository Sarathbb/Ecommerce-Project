<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="Header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="CSS/home-style.css">
<style type="text/css">
body{
   background-color: #f0f5f1;
   min-height: 100vh;
}
table tr th{
   background-color: #2874f0;
}

table tr td{
   padding: 20px 70px;
   background-color: #eae4ed;
}
table tr td:nth-child(even){
   background-color: #c1e7e8;
}
table tr td a:hover{
    font-size: 15px;
    color: red;
}
footer{
      width: 100%;
      background-color: #172337;
      color: #ffffff;
      display: flex;
      justify-content: center;
      padding: 10px 0;
      margin-top: 10px;
      
   }
</style>
</head>
<body>
   <h1>Home</h1>
   <%
      String msg = request.getParameter("msg");
      if("added".equals(msg))
      {
   %>
        <h3>Product added successfully!</h3>
   <%} %>
   <%
     
      if("exist".equals(msg))
      {
   %>
       <h3>Product already added in your cart! Quantity incresed!</h3>
   <%} %>
   <%
      
      if("invalid".equals(msg))
      {
   %>
       <h3>Somthing went wromg!Please try again</h3>
   <%} %>
   <table>
     <tr>
       <th>ID</th>
       <th>NAME</th>
       <th>CATEGORY</th>
       <th>PRICE</th>
       <th>ADD TO CART</th>
     </tr>
     <%
     Connection conn = ConnectionProvider.getConnection();
     try{
     
    	 Statement stmt = conn.createStatement();
    	 ResultSet rs = stmt.executeQuery("select * from product where active = 'active'");
    	 while(rs.next())
    	 {%>
    		 <tr>
    	       <td><%=rs.getInt(1) %></td>
    	       <td><%=rs.getString(2) %></td>
    	       <td><%=rs.getString(3) %></td>
    	       <td><%=rs.getInt(4) %></td>
    	       <td><a href="addToCartAction.jsp?id=<%=rs.getInt(1) %>">Add to cart</a></td>
    	     </tr>
    	 <% 
    	 }
    	 }
     catch(Exception e)
    	 {
    		 out.print(e);
    	}
     %>
   </table>
   <footer>
       <h2>All rights Received</h2>
   </footer>
</body>
</html>