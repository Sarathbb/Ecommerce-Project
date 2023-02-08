<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/bill.css">
</head>
<body>
<%
   String mobileNum = "";
   String email = session.getAttribute("email").toString();
   String orderDate = null;
   String expectedDelivery = "";
   String paymentMethod = "";
   String address = "";
   String city = "";
   String state = "";
   String country = "";
   int sno = 0;
   int total = 0;
   String name = session.getAttribute("name").toString();
   Connection conn = ConnectionProvider.getConnection();
   try{
	   Statement st = conn.createStatement();
	   ResultSet rst = st.executeQuery("select * from cart where email = '"+email+"'");
	   while(rst.next())
	   {
		   mobileNum = rst.getString(10);
		   orderDate = rst.getString(11);
		   expectedDelivery = rst.getString(12);
		   paymentMethod = rst.getString(13);
		   address = rst.getString(6);
		   city = rst.getString(7);
		   state = rst.getString(8);
		   country = rst.getString(9);
	   }
%>
   <h2>Online Shopping Bill</h2>
   <hr>
   <div class="main-items">
       <label>Name : <%=name %></label>
       <label>Mobile Number : <%=mobileNum %></label>
       <label>Email : <%=email %></label>
   </div>
   <div class="main-items">
       <label>Order Date : <%=orderDate %></label>
       <label>Expected Delivery : <%=expectedDelivery %></label>
       <label>Payment Method : <%=paymentMethod %></label>
   </div>
   <div class="main-items">
       <label>Transaction ID :</label>
       <label>Address : <%=address %></label>
       <label>City : <%=city %></label>
   </div>
   <div class="main-items">
       <label>State : <%=state %></label>
       <label>Country : <%=country %></label>
   </div>
   <hr>
   <h2>Product Details</h2>
   <div class="table-box">
     <table>
      <tr>
         <th>S no</th>
         <th>Product Name</th>
         <th>Category</th>
         <th>Price</th>
         <th>Quantity</th>
         <th>Sub Total</th> 
      </tr>
      <%
                     
                     //String email = session.getAttribute("email").toString();
                    
                     
                    	 Statement stmt = conn.createStatement();
                    	 ResultSet rs = stmt.executeQuery("select * from product inner join cart on product.id = cart.product_id and email ='"+email+"';");
                    	 while(rs.next())
                    	 {
                    		 sno++;%>
                    	   <tr> 
                    		 <td><%=sno %></td>
                             <td><%=rs.getString(2) %></td>
                             <td><%=rs.getString(3) %></td>
                             <td><%=rs.getInt(9) %></td>
                             <td><%=rs.getInt(8) %></td>
                             <td><%=rs.getInt(10) %></td>
                           </tr>
                    	 <%}
                    	 
                     
                  %>
     </table>
   </div>
   <%
      
      
      
    	  
          
          ResultSet rs1 = stmt.executeQuery("select sum(total) from cart where email = '"+email+"';");
          while(rs1.next())
          {
        	  total = rs1.getInt(1);
          }
         
                     }catch(Exception e){
                    	 out.println(e);
                     }
      
    %>
   <h2>Total : Rs <%=total %></h2>
   <div class="button-box">
      <a href="billProcessingAction.jsp">Continue Shopping</a>
      <a href="">Print</a>
   </div>
</body>
</html>