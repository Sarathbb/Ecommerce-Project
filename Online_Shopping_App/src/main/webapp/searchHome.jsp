<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="Header.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/home-style.css">
<style type="text/css">
body{
   background-color: #f0f5f1;
   min-height: 100vh;
}
table{
	width: 90%;
	margin-bottom: 10px;
}
table tr td{
   padding: 20px 70px;
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
table tr th a:hover{
    font-size: 15px;
    color: red;
}
table tr td a:hover{
    font-size: 15px;
    color: red;
}
.nothing-msg{
   margin-top: 150px;
}
footer{
      width: 100%;
      background-color: #172337;
      color: #ffffff;
      display: flex;
      justify-content: center;
      padding: 10px 0;
      margin-top: 10px;
      position: absolute;
      bottom: 0;
      
   }
</style>
</head>
<body>
   <h1>Home</h1>
   <table >
     <tr>
       <th>ID</th>
       <th>NAME</th>
       <th>CATEGORY</th>
       <th>PRICE</th>
       <th>ADD TO CART</th>
     </tr>
     <%
     String search = request.getParameter("search");
     int flag = 0;
     Connection conn = ConnectionProvider.getConnection();
     try{
    	 Statement stmt = conn.createStatement();
    	 ResultSet rs = stmt.executeQuery("select * from product where name like '%"+search+"%' or category like '%"+search+"%' and active ='active'");
    	 while(rs.next())
    	 {
    		 flag = 1;
    	 %>
    		 <tr>
    	       <td><%=rs.getInt(1) %></td>
    	       <td><%=rs.getString(2) %></td>
    	       <td><%=rs.getString(3) %></td>
    	       <td><%=rs.getString(4) %></td>
    	       <td><a href="addToCartAction.jsp?id=<%=rs.getInt(1) %>">Add to cart</a></td>
    	     </tr>
    	 <%}
    	 
     }catch(Exception e){
    	 
     }
     %>
   </table>
   <%
     if(flag == 0)
	 {%>
		 <h1 class="nothing-msg">Nothing to Show !Please try again</h1>
	 <%}
   %>
   <footer>
       <h2>All rights Received</h2>
   </footer>
</body>
</html>