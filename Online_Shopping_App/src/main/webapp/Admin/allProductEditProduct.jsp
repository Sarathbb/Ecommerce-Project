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
	position: absolute;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: #f0f5f1
}
table{
	width: 90%;
}
table tr th{
	padding: 20px 50px;
	align-items: center;
}
table  td{
    padding: 20px 70px;
    align-items: center;
    background-color: #eae4ed;
}
table tr td:nth-child(even){
   background-color: #c1e7e8;
}
table tr td a:hover{
    font-size: 15px;
    color: red;
}
h1{
    margin-top: 80px;
    background-color: #f0f5f1;
}
</style>
</head>
<body>
   <h1>All Products & Edit Products</h1>
   <table>
     <tr>
       <th>ID</th>
       <th>NAME</th>
       <th>CATEGORY</th>
       <th>PRICE</th>
       <th>STATUS</th>
       <th>EDIT</th>
     </tr>
     <%
        try{
        	Connection conn = ConnectionProvider.getConnection();
        	Statement stmt = conn.createStatement();
        	ResultSet rs = stmt.executeQuery("select * from product;");
        	while(rs.next())
        	{%>
        		<tr>
        		  <td><%=rs.getInt(1) %></td>
        		  <td><%=rs.getString(2) %></td>
        		  <td><%=rs.getString(3) %></td>
        		  <td><%=rs.getInt(4) %></td>
        		  <td><%=rs.getString(5) %></td>
        		  <td><a href="editProduct.jsp?id=<%=rs.getInt(1) %>">Edit</a></td>
        		</tr>
        	<%}
        }catch(Exception e){
        	
        }
     %>
   </table>
</body>
</html>