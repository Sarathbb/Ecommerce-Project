<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
   String id = request.getParameter("id");
   String name = request.getParameter("name");
   String category = request.getParameter("category");
   String price = request.getParameter("price");
   String active = request.getParameter("active");
   
   try{
	   Connection conn = ConnectionProvider.getConnection();
	   PreparedStatement pstmt = conn.prepareStatement("insert into product values(?,?,?,?,?);");
	   pstmt.setString(1, id);
	   pstmt.setString(2, name);
	   pstmt.setString(3, category);
	   pstmt.setString(4, price);
	   pstmt.setString(5, active);
	   
	   pstmt.executeUpdate();
	   response.sendRedirect("addNewProducts.jsp?msg=done");
   }catch(Exception e){
	   response.sendRedirect("addNewProducts.jsp?msg=wrong");
   }
%>