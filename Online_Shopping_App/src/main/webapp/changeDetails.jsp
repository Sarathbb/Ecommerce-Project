<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ include file="ChangeDetailsHeader.jsp"%>
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
	height: 60px;
	border-bottom: 2px solid black;
	display: flex;
	justify-content: center;
	align-items: center;
}

.box label {
	font-size: 24px;
}
</style>
</head>
<body>
	<%
	String emailId = session.getAttribute("email").toString();
	Connection conn = ConnectionProvider.getConnection();
	try {
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE email ='"+emailId+"'");
		while (rs.next()) {
	%>
	<div class="content">
		<div class="box">
			<label>Name :</label><label><%=rs.getString(1) %></label>
		</div>
		<div class="box">
			<label>Email :</label><label><%=rs.getString(2) %></label>
		</div>
		<div class="box">
			<label>Mobile Number :</label><label><%=rs.getString(3) %></label>
		</div>
		<div class="box">
			<label>Security Qustion :</label><label><%=rs.getString(4) %></label>
		</div>
	</div>
	<%
	}
	} catch (Exception e) {
	System.out.println(e);
	}
	%>

</body>
</html>