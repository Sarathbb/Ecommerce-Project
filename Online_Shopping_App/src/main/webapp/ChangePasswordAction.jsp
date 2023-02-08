<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<% 
String oldPass = request.getParameter("oldpwd");
String newPass = request.getParameter("newpwd");
String confPwd = request.getParameter("confirmPwd");

String email = session.getAttribute("email").toString();

Connection conn = ConnectionProvider.getConnection();
try{
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE email = '"+email+"'");
	while(rs.next())
	{
		if(rs.getString(6).equals(oldPass))
		{
			if(newPass.equals(confPwd))
			{
				PreparedStatement pstmt = conn.prepareStatement("UPDATE user SET password =? WHERE email=?");
				pstmt.setString(1, newPass);
				pstmt.setString(2, email);
				pstmt.executeUpdate();
				response.sendRedirect("ChangePassword.jsp?msg=valid");
			}else{
				response.sendRedirect("ChangePassword.jsp?msg=incorrect");
			}
		}else{
			response.sendRedirect("ChangePassword.jsp?msg=invalid");
		}
	}
}catch(Exception e){
	
}
%>