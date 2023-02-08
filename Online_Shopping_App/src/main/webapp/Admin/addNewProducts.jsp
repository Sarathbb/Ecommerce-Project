<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../Footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../CSS/proceedOrder.css">
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
	flex-direction: column;
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
h1{
    background-color: #f0f5f1;
}

</style>
</head>
<body>
   <h1>Add New products</h1>
   <form action="addNewProductAction.jsp" method="post">
     <div class="container">
     <%
        String msg = request.getParameter("msg");
        if("done".equals(msg))
        {%>
        	<h3>Product Added Successfully</h3>
       <% }
        if("wrong".equals(msg))
        {%>
        	<h3>Something Went Wrong!Try Again</h3>
        <%}
     %>
       
       
     </div>
     <%
        int id = 1;
        try{
        	Connection conn = ConnectionProvider.getConnection();
        	Statement stmt = conn.createStatement();
        	ResultSet rs = stmt.executeQuery("select max(id) from product;");
            while(rs.next())
            {
            	id = rs.getInt(1);
            	id = id + 1;
            }
        }catch(Exception e){
        	
        }
     %>
     <div class="container">
       <h3>Product ID : <%=id %></h3>
     </div>
       <input type="hidden" name="id" value="<%out.println(id);%>">
     <div class="container">
       <input type="text" placeholder="Enter Name" name="name">
       <input type="text" placeholder="Enter Category" name="category">
     </div>
     <div class="container">
       <input type="number" placeholder="Enter Price" name="price">
       <select name="active">
         <option>Active</option>
         <option>Not Active</option>
       </select>
     </div>
     <div class="container">
       <input type="submit" value="Add Products">
     </div>
   </form>
</body>
</html>