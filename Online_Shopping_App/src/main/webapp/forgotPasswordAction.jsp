<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
   String email = request.getParameter("email");
   String mobileNumber = request.getParameter("mobileNumber");
   String sequrityQuestion = request.getParameter("sequrityQuestion");
   String answer = request.getParameter("answer");
   String password = request.getParameter("password");
   
   try{
	   int check = 0;
	   Connection conn = ConnectionProvider.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rs = stmt.executeQuery("select * from user where email = '"+email+"'and mobileNumber ='"+mobileNumber+"'and securityQuestion ='"+sequrityQuestion+"'and answer ='"+answer+"'");
	   while(rs.next())
	   {
		   check = 1;
		   stmt.executeUpdate("update user set password ='"+password+"'where email ='"+email+"'");
		   response.sendRedirect("ForgotPassword.jsp?msg=done");
	   }
	   if(check == 0)
	   {
		   response.sendRedirect("ForgotPassword.jsp?msg=invalid");
	   }
   }catch(Exception e){
	   
   }
%>