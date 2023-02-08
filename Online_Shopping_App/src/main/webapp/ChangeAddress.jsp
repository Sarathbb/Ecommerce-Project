<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@include file="ChangeDetailsHeader.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body {
	display: flex;
	justify-content: center;
}

.content {
	margin-top: 130px;
}

.content .box {
	margin-top: 10px;
	width: 900px;
	height: 100px;
	border-bottom: 2px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
.content .msg{
    width: 900px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
}
.box label {
	font-size: 24px;
	margin-bottom: 10px;
}
.box input{
    width: 400px;
    height: 30px;
    padding-left: 10px;
    font-size: 16px;
}
.box button{
    width: 200px;
    height: 40px;
    font-size: 18px;
    font-weight: 500;
    background-color: green;
    color: white;
    border-radius: 9px;
    cursor: pointer;
}
.box button:hover {
	background-color: buttonshadow;
	color: black;
}
</style>
</head>
<body>
<%
String emailId = session.getAttribute("email").toString();
Connection conn = ConnectionProvider.getConnection();
try{
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM cart WHERE email ='"+emailId+"'");
	while(rs.next())
	{%>
		<div class="content">
		<%
           String msg = request.getParameter("msg");
           if("valid".equals(msg))
           {
           %><div class="msg">
               <h2 style="color: green;">Successfully Updated !</h2>
             </div>
           <%} 
           if("incorrect".equals(msg))
           {
           %><div class="msg">
               <h2 style="color: red;">Something Went Wrong!pls Try Agin!</h2>
             </div>
           <%}
            
%>
    <form action="ChangeAdressAction.jsp" method="post">
		<div class="box">
			<label>Enter Address</label>
			<input type="text" name="address" placeholder="Enter Address" required="required"
			value="<%=rs.getString(6)%>">
		</div>
		<div class="box">
			<label>Enter City</label>
			<input type="text" name="city" placeholder="Enter City" required="required" 
			value="<%=rs.getString(7)%>">
		</div>
		<div class="box">
			<label>Enter State</label>
			<input type="text" name="state" placeholder="Enter State" required="required" 
			value="<%=rs.getString(8)%>">
		</div>
		<div class="box">
			<label>Enter Country</label>
			<input type="text" name="country" placeholder="Enter Contry" required="required" 
			value="<%=rs.getString(9)%>">
		</div>
		<div class="box">
			<button type="submit">Save</button>
		</div>
	</form>
</div>
	<%}
}catch(Exception e){
	
}
%>


</body>
</html>