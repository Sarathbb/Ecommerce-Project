<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%
String email = session.getAttribute("email").toString();
String question = request.getParameter("sequrityQuestion");
String answer = request.getParameter("answer");
String pass = request.getParameter("password");;

Connection conn = ConnectionProvider.getConnection();
try{
	
	PreparedStatement pstmt = conn.prepareStatement("UPDATE user SET securityQuestion=?,answer=? WHERE email=? and password=?");
	pstmt.setString(1, question);
	pstmt.setString(2, answer);
	pstmt.setString(3, email);
	pstmt.setString(4, pass);
	
	int i = pstmt.executeUpdate();
	if(i >= 1)
	   response.sendRedirect("ChangeQuestion.jsp?msg=valid");
	else
		response.sendRedirect("ChangeQuestion.jsp?msg=invalid");
}catch(Exception e){
	response.sendRedirect("ChangeQuestion.jsp?msg=invalid");
}
%>