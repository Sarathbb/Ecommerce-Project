<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%
   String email = session.getAttribute("email").toString();
   String product_id = request.getParameter("id");
   int quantity = 1;
   int product_price = 0;
   int product_total = 0;
   int cart_total = 0;
   
   int flag = 0;
   
   try{
	   Connection conn = ConnectionProvider.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rs = stmt.executeQuery("select * from product where id = '"+product_id+"';");
	   while(rs.next())
	   {
		   product_price = rs.getInt(4);
		   product_total = product_price;
	   }
	   ResultSet rs1 = stmt.executeQuery("select * from cart where product_id = '"+product_id+"' and email = '"+email+"' and address is NULL;");
	   while(rs1.next())
	   {
		   cart_total = rs1.getInt(5);
		   cart_total = cart_total + product_total;
		   quantity = rs1.getInt(3);
		   quantity = quantity + 1;
		   flag = 1; 
	   }
	   if(flag == 1)
	   {
		   stmt.executeUpdate("update cart set total ='"+cart_total+"',quantity = '"+quantity+"'where product_id = '"+product_id+"'and email = '"+email+"'and address is NULL");
		   response.sendRedirect("Home.jsp?msg=exist");
	   }
	   if(flag == 0)
	   {
		   PreparedStatement pstmt = conn.prepareStatement("insert into cart(email,product_id,quantity,price,total) values(?,?,?,?,?);");
		   pstmt.setString(1, email);
		   pstmt.setString(2, product_id);
		   pstmt.setInt(3, quantity);
		   pstmt.setInt(4, product_price);
		   pstmt.setInt(5, product_total);
		   
		   pstmt.executeUpdate();
		   response.sendRedirect("Home.jsp?msg=added");
	   }
   }catch(Exception e){
	   response.sendRedirect("Home.jsp?msg=invalid");
   }
%>