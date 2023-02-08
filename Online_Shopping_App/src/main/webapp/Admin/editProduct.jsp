<%@include file="adminHeader.jsp" %>
<%@include file="../Footer.jsp" %>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
*{
   margin: 0;
   padding: 0;
   box-sizing: border-box;
}
body {
	width: 100%;
	min-width: 100vh;
	height: 100vh;
	background-color: #f0f5f1;
	display: flex;
	justify-content: center;
	align-items: center;
}
form{
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 800px;
    height: 450px;
    border: 1px solid black;
    padding-top: 20px;
}
.container{
    margin: 20px 0;
}
.container input,select {
	font-size: 20px;
	text-align: center;
	padding: 5px 30px;
}
.container select{
    width: 320px;
}
</style>
</head>
<body>
   <form action="editProductAction.jsp" method="post">
     <div class="container">
     <%
        String msg = request.getParameter("msg");
        String id = request.getParameter("id");
        if("done".equals(msg))
        {%>
        	<h3>Product Editted Successfully</h3>
        	<%response.sendRedirect("allProductEditProduct.jsp"); %>
       <% }
        if("wrong".equals(msg))
        {%>
        	<h3>Something Went Wrong!Try Again</h3>
        <%}
     %>
       
       
     </div>
     <%
        
        try{
        	Connection conn = ConnectionProvider.getConnection();
        	Statement stmt = conn.createStatement();
        	ResultSet rs = stmt.executeQuery("select * from product where id ='"+id+"';");
            while(rs.next())
            {%>
            	<div class="container">
       <h2>Edit Product</h2>
     </div>
       <input type="hidden" name="id" value="<%out.println(id);%>">
     <div class="container">
       <input type="text" placeholder="Enter Name" name="name" value="<%=rs.getString(2)%>">
       <input type="text" placeholder="Enter Category" name="category" value="<%=rs.getString(3)%>">
     </div>
     <div class="container">
       <input type="number" placeholder="Enter Price" name="price" value="<%=rs.getInt(4)%>">
       <select name="active">
         <option value="yes">Active</option>
         <option value="no">Not Active</option>
       </select>
     </div>
     <div class="container">
       <input type="submit" value="Edit Products">
     </div>
            <%}
        }catch(Exception e){
        	
        }
     %>
     
   </form>
</body>
</html>