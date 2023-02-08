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
	   PreparedStatement pstmt = conn.prepareStatement("update product set name = ?,category = ?,price = ?,active = ? where id = ?;");
	   pstmt.setString(1, name);
	   pstmt.setString(2, category);
	   pstmt.setString(3, price);
	   pstmt.setString(4, active);
	   pstmt.setString(5, id);
	   
	   pstmt.executeUpdate();
	   
	   if(active.equals("no"))
	   {
		   pstmt.executeUpdate("delete from cart where product_id = '"+id+"' and address is NULL");
	   }
	   response.sendRedirect("editProduct.jsp?msg=done");
   }catch(Exception e){
	   response.sendRedirect("editProduct.jsp?msg=wrong");
   }
%>