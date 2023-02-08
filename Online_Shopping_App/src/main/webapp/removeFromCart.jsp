<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>

<%
    String id = request.getParameter("id");
    
    Connection conn = ConnectionProvider.getConnection();
    try{
    	PreparedStatement ps = conn.prepareStatement("delete from cart where product_id = '"+id+"' and address is  NULL;");
    	ps.executeUpdate();
    	Statement stmt = conn.createStatement();
    	ResultSet rs = stmt.executeQuery("select * from cart where product_id = '"+id+"'");
    	while(rs.next())
    	{
    		response.sendRedirect("myCart.jsp?msg=process");
    	}
    	response.sendRedirect("myCart.jsp?msg=removed");
    }catch(Exception e){
    	out.println(e);
    }
%>