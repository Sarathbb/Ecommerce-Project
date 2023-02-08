<%@page import="java.sql.PreparedStatement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email = session.getAttribute("email").toString();
String address = request.getParameter("address");
String  city = request.getParameter("city");
String  state = request.getParameter("state");
String  country = request.getParameter("country");

Connection conn = ConnectionProvider.getConnection();
try{
	PreparedStatement pstmt = conn.prepareStatement("UPDATE user SET address=?,city=?,state=?,country=? WHERE email=?");
	pstmt.setString(1, address);
	pstmt.setString(2, city);
	pstmt.setString(3, state);
	pstmt.setString(4, country);
	pstmt.setString(5, email);
	
	pstmt.executeUpdate();
	response.sendRedirect("ChangeAddress.jsp?msg=valid");
}catch(Exception e){
	response.sendRedirect("ChangeAddress.jsp?msg=invalid");
}
%>