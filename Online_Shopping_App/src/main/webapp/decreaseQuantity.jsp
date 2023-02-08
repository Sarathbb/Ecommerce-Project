<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
   String id = request.getParameter("id");
   String email = session.getAttribute("email").toString();
   String qua = request.getParameter("qun");
   int quantity = Integer.parseInt(qua);
   int price = 0;
   int total = 0;
   
   
   Connection conn = ConnectionProvider.getConnection();
   try{
	   Statement stmt = conn.createStatement();
	   ResultSet rs = stmt.executeQuery("select price from cart where product_id = '"+id+"';");
	   while(rs.next())
	   {
		   price = rs.getInt(1);
	   }
	   if(quantity <= 1)
	   {
		   response.sendRedirect("myCart.jsp?msg=notPossible");
		   quantity = 1;
		   total = quantity * price;
	   }
	   else{
		   quantity-=1;
		   total = quantity * price;
	   }
	   
	   
	   PreparedStatement ps = conn.prepareStatement("update cart set quantity = '"+quantity+"',total = '"+total+"' where email = '"+email+"'and product_id ='"+id+"'");
	   ps.executeUpdate();
	   response.sendRedirect("myCart.jsp?msg=dec");
   }catch(Exception e){
	   out.println(e);
   }
%>