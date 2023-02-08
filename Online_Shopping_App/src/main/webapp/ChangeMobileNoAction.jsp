<%@page import="java.sql.PreparedStatement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email = session.getAttribute("email").toString();
String newMobNo = request.getParameter("NewmobileNumber");
String pass = request.getParameter("password");

Connection conn = ConnectionProvider.getConnection();
try{
	PreparedStatement pstmt = conn.prepareStatement("UPDATE user SET mobileNumber=? WHERE email=? and password=?");
	pstmt.setString(1, newMobNo);
	pstmt.setString(2, email);
	pstmt.setString(3, pass);
	
	int i = pstmt.executeUpdate();
	if(i >= 1)
	   response.sendRedirect("ChangeMobileNo.jsp?msg=valid");
	else
		response.sendRedirect("ChangeMobileNo.jsp?msg=invalid");
}catch(Exception e){
	response.sendRedirect("ChangeMobileNo.jsp?msg=invalid");
}
%>
