<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>
<%@include file="adminHeader.jsp" %>
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
   width: 100%;
   background-color: #f0f5f1;
}
h1{
    margin-top: 80px;
    background-color: #f0f5f1;
}
h3{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
	font-style: italic;
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
table tr td a:hover{
    font-size: 15px;
    color: red;
}
</style>
</head>
<body>
   <h1>Orders Received</h1>
   <%
   String email = session.getAttribute("email").toString();
   String msg = request.getParameter("msg");
   if("cancel".equals(msg))
   {%>
	   <h3>Order Cancel Successfully!</h3>
   <%}
   if("delivered".equals(msg))
   {%>
       <h3>Successfully Updated!</h3>
     <%}
   if("invalid".equals(msg))
   {%>
       <h3>Somthing Went Wrong! Try again</h3>
     <%}
   %>
   
   
   
   
   <table>
       <tr>
          <th>MOBILE NUMBER</th>
          <th>PRODUCT NAME</th>
          <th>QUANTITY</th>
          <th>SUB TOTAL</th>
          <th>ADDRESS</th>
          <th>CITY</th>
          <th>STATE</th>
          <th>COUNTRY</th>
          <th>ORDER DATE</th>
          <th>EXPECTED DELIVERY DATE</th>
          <th>PAYMENT METHOD</th>
          <th>T-ID</th>
          <th>STATUS</th>
          <th>CANCEL ORDER</th>
          <th>ORDER DELIVERED</th>
       </tr>
       <% 
       Connection conn = ConnectionProvider.getConnection();
           try{
        	   Statement st = conn.createStatement();
        	   ResultSet rs = st.executeQuery("select * from product inner join cart on cart.product_id=product.id  and address is not NULL and status = 'Processing'");
        	   while(rs.next())
        	   {
        	      %>
        		   <tr>
        		      <td><%=rs.getString(15) %></td>
        		      <td><%=rs.getString(2) %></td>
                      <td><%=rs.getString(8) %></td>
                      <td><%=rs.getInt(10) %></td>
                      <td><%=rs.getString(11) %></td>
                      <td><%=rs.getString(12) %></td>
                      <td><%=rs.getString(13) %></td>
                      <td><%=rs.getString(14) %></td>
                      <td><%=rs.getString(16) %></td>
                      <td><%=rs.getString(17) %></td>
                      <td><%=rs.getString(18) %></td>
                      <td></td>
                      <td><%=rs.getString(20) %></td>
                      <td><a href="cancelOrdersAction.jsp?id=<%=rs.getInt(1) %>&email=<%=rs.getString(6) %>">Cancel</a></td>
                      <td><a href="deliveredOrdersAction.jsp?id=<%=rs.getInt(1) %>&email=<%=rs.getString(6) %>">Delivered</a></td>
        		   </tr>
        	   <%}
           }catch(Exception e){
        	   out.println(e);
           }
       %>
       
   </table> 
</body>
</html>