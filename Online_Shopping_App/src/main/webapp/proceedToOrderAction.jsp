<%@ page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
     String email = session.getAttribute("email").toString();
     String address = request.getParameter("address");
     String country = request.getParameter("country");
     String state = request.getParameter("state");
     String city = request.getParameter("city");
     String mobNumber = request.getParameter("mobNumber");
     String payment = request.getParameter("Select way of Payment");
     String transactionId = "";
     String status = "Bill";
     
     Connection conn = ConnectionProvider.getConnection();
     try{
    	 PreparedStatement pstmt = conn.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobileNumber=?,orderDate=now(),deliveryDate=Date_add(orderDate,interval 7 day),paymentMethod=?,transaction_id=?,status=? where email='"+email+"'");
    	 pstmt.setString(1, address);
    	 pstmt.setString(2, city);
    	 pstmt.setString(3, state);
    	 pstmt.setString(4, country);
    	 pstmt.setString(5, mobNumber);
    	 pstmt.setString(6, payment);
    	 pstmt.setString(7, transactionId);
    	 pstmt.setString(8, status);
    	 
    	 pstmt.executeUpdate();
    	 
    	 PreparedStatement pstmt1 = conn.prepareStatement("update user set address=?,city=?,state=?,country=? where email='"+email+"'");
    	 pstmt1.setString(1, address);
    	 pstmt1.setString(2, city);
    	 pstmt1.setString(3, state);
    	 pstmt1.setString(4, country);
    	 
    	 pstmt1.executeUpdate();
    	 response.sendRedirect("bill.jsp");
    	 
     }catch(Exception e){
    	 out.println(e);
     }
%>