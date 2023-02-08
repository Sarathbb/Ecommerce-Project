<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
   String email = session.getAttribute("email").toString();
   String subject = request.getParameter("subject");
   String message = request.getParameter("message");
   
   Connection conn = ConnectionProvider.getConnection();
   try{
	   PreparedStatement ps = conn.prepareStatement("insert into message (email,subjectt,body) values(?,?,?)");
	   ps.setString(1, email);
	   ps.setString(2, subject);
	   ps.setString(3, message);
	   
	   ps.executeUpdate();
	   
	   response.sendRedirect("messageUs.jsp?msg=done");
   }catch(Exception e){
	   out.println(e);
	   response.sendRedirect("messageUs.jsp?msg=error");
   }
%>