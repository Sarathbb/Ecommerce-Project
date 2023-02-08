<%@ page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
   String name = request.getParameter("name");
   String email = request.getParameter("email");
   String mobileNumber = request.getParameter("mobileNumber");
   //int moNum = Integer.parseInt(mobileNumber);
   String sequrityQuestion = request.getParameter("sequrityQuestion");
   String answer = request.getParameter("answer");
   String password = request.getParameter("password");
   String address = "";
   String city = "";
   String state = "";
   String country = "";

   Connection conn = ConnectionProvider.getConnection();
   try{
	   PreparedStatement pstmt = conn.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");
	   pstmt.setString(1, name);
	   pstmt.setString(2, email);
	   pstmt.setString(3, mobileNumber);
	   pstmt.setString(4, sequrityQuestion);
	   pstmt.setString(5, answer);
	   pstmt.setString(6, password);
	   pstmt.setString(7, address);
	   pstmt.setString(8, city);
	   pstmt.setString(9, state);
	   pstmt.setString(10, country);
	   
	   pstmt.executeUpdate();
	   response.sendRedirect("Signup.jsp?msg=valid");
   }catch(Exception e){
	   out.println(e);
	   response.sendRedirect("Signup.jsp?msg=invalid");
   }
%>