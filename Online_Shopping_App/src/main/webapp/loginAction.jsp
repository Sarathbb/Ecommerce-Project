<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  
  if("admin@gmail.com".equals(email) && "admin".equals(password))
  {
	  session.setAttribute("email", email);
	  response.sendRedirect("Admin/adminHome.jsp");
  }else{
	  int z = 0;
	  Connection conn = ConnectionProvider.getConnection();
	  try{
	     Statement stmt = conn.createStatement();
	     ResultSet rs = stmt.executeQuery("select * from user where email ='"+email+"' and password ='"+password+"'");
	     while(rs.next())
	     {
		    z = 1;
		    session.setAttribute("name", rs.getString(1));
		    session.setAttribute("pNum", rs.getString(3));
		    session.setAttribute("email", email);
		    response.sendRedirect("Home.jsp");
	     }
	     if(z == 0)
	     {
	    	 response.sendRedirect("Login.jsp?msg=notexist");
	     }
	  }catch(Exception e){
		  System.out.println(e);
		  response.sendRedirect("Login.jsp?msg=invalid");
	  }
  }
%>