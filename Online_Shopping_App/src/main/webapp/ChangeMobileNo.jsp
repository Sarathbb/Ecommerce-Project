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
	margin-top: 160px;
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
.box input,select{
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

<div class="content">
<%
           String msg = request.getParameter("msg");
           if("valid".equals(msg))
           {
           %><div class="msg">
               <h2 style="color: green;">Successfully Updated !</h2>
             </div>
           <%} 
           if("invalid".equals(msg))
           {
           %><div class="msg">
               <h2 style="color: red;">Incorrect Password!pls Try Agin!</h2>
             </div>
           <%}
%>
    <form action="ChangeMobileNoAction.jsp" method="post">
		<div class="box">
			<label>Enter Your New Mobile Number</label>
			<input type="text" placeholder="Enter Mobile Number" name="NewmobileNumber" required="required"
               pattern="[0-9]{10}" >
		</div>
		<div class="box">
			<label>Enter Your Password</label>
			<input type="password" name="password" placeholder="Enter Your Password" required="required" minlength="6" maxlength="10">
		</div>
		<div class="box">
			<button type="submit">Save</button>
		</div>
	</form>
</div>

</body>
</html>