<%@page import="java.sql.*"%>
<%@page import="project.ConnectionProvider"%>

<%
   String id = request.getParameter("id");
   String email = request.getParameter("email");
   
   Connection conn = ConnectionProvider.getConnection();
   try{
	   PreparedStatement ps = conn.prepareStatement("update cart set status = 'Delivered' where product_id ='"+id+"' and email='"+email+"'and address is not NULL");
	   ps.executeUpdate();
	   response.sendRedirect("ordersReceived.jsp?msg=delivered");
   }catch(Exception e){
	   out.println(e);
   }
%>