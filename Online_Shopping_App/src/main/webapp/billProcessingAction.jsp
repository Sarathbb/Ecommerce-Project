<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
    String status = "Processing";
    String email = session.getAttribute("email").toString();
    
    Connection conn = ConnectionProvider.getConnection();
    try{
    	PreparedStatement ps = conn.prepareStatement("update cart set status = ? where email = ? and status = 'Bill'");
    	ps.setString(1, status);
    	ps.setString(2, email);
    	
    	ps.executeUpdate();
    	response.sendRedirect("Home.jsp");
    }catch(Exception e){
    	out.println(e);
    }
    
%>