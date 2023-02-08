<%@include file="Header.jsp" %>
<%--@include file="Footer.jsp" --%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/proceedOrder.css">
<style type="text/css">
table {
	
	border-bottom: 1px solid black;
}

body{
   background-color: #f0f5f1;
}
table tr th{
   background-color: #2874f0;
}
table tr td{
   padding: 10px 40px;
   background-color: #eae4ed;
}
table tr td:nth-child(even){
   background-color: #c1e7e8;
}
h1{
    margin-top: 80px;
    background-color: #f0f5f1;
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
   <h1>My Orders</h1>
   <table>
       <tr>
          <th>S NO</th>
          <th>PRODUCT NAME</th>
          <th>CATEGORY</th>
          <th>PRICE</th>
          <th>QUANTITY</th>
          <th>SUB TOTAL</th>
          <th>ORDER DATE</th>
          <th>EXPECTED DELIVERY DATE</th>
          <th>PAYMENT METHOD</th>
          <th>STATUS</th>
       </tr>
       <%
           int sno = 0;
           //String email = session.getAttribute("email").toString();
           Connection conn = ConnectionProvider.getConnection();
           try{
        	   Statement st = conn.createStatement();
        	   ResultSet rs = st.executeQuery("select * from product inner join cart on cart.product_id=product.id and email ='"+email+"' and address is not NULL and status = 'Processing'");
        	   while(rs.next())
        	   {
        	       sno++;%>
        		   <tr>
        	          <td><%=sno %></td>
        	          <td><%=rs.getString(2) %></td>
        	          <td><%=rs.getString(3) %></td>
        	          <td><%=rs.getString(4) %></td>
        	          <td><%=rs.getString(8) %></td>
        	          <td><%=rs.getString(10) %></td>
        	          <td><%=rs.getString(16) %></td>
        	          <td><%=rs.getString(17) %></td>
        	          <td><%=rs.getString(18) %></td>
        	          <td><%=rs.getString(20) %></td>
        	       </tr>
        	   <%}
           }catch(Exception e){
        	   out.println(e);
           }
       %>
       
   </table>
   <footer>
       <h2>All rights Received</h2>
   </footer>
</body>
</html>