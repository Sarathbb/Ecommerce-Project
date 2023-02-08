<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/proceedOrder.css">
<style type="text/css">
body{
   background-color: #f0f5f1;
}
table tr th{
   background-color: #2874f0;
}
table tr td{
   padding: 20px 70px;
   background-color: #eae4ed;
}
table tr td:nth-child(even){
   background-color: #c1e7e8;
}
table tr td{
   padding: 10px 40px;
}
</style>
</head>
<body>
    <h1>Order List</h1>
    <div class="main-box">
        <div class="left-box">
           <table >
           <%
      int total = 0;
      
      String email = session.getAttribute("email").toString();
      String pNum = session.getAttribute("pNum").toString();
      try{
    	  Connection conn = ConnectionProvider.getConnection();
          Statement stmt1 = conn.createStatement();
          ResultSet rs = stmt1.executeQuery("select sum(total) from cart where email = '"+email+"'and address is NULL;");
          while(rs.next())
          {
        	  total = rs.getInt(1);
          }
    	  
      
    %>
               <tr>
                  <th ><a href="myCart.jsp" style="color: yellow;">BACK</a></th>
                  <th>TOTAL : <%=total %> Rs</th>
                  <th></th>
                  <th></th>
                  <th></th>
                  <th></th>
               </tr>
               <tr>
                  <th>S.NO</th>
                  <th>PRODUCT NAME</th>
                  <th>CATEGORY</th>
                  <th>PRICE</th>
                  <th>QUANTITY</th>
                  <th>SUB TOTAL</th>
               </tr>
               
                  <%
                     int sno = 0;
                    
                     
                    	
                    	 ResultSet rs1 = stmt1.executeQuery("select * from product inner join cart on product.id = cart.product_id and email ='"+email+"';");
                    	 while(rs1.next())
                    	 {
                    		 sno++;%>
                    	   <tr> 
                    		 <td><%=sno %></td>
                             <td><%=rs1.getString(2) %></td>
                             <td><%=rs1.getString(3) %></td>
                             <td><%=rs1.getInt(9) %></td>
                             <td><%=rs1.getInt(8) %></td>
                             <td><%=rs1.getInt(10) %></td>
                           </tr>
                    	 <%}
                     }catch(Exception e){
                    	 out.println(e);
                     }
                  %>
                  
               
           </table>
        </div>
        <div class="right-box">
          <h2>Fill Your Details</h2>
          <form action="proceedToOrderAction.jsp" method="post">
             <div class="two-input-box">
                <input type="text" name="address" placeholder="Enter Address" required="required">
                <input type="text" name="country" placeholder="Enter Country" required="required">
             </div>
             <div class="two-input-box">
                <input type="text" name="state" placeholder="Enter State" required="required">
                <input type="text" name="city" placeholder="Enter City" required="required">
                
             </div>
             <div class="two-input-box">
               <select name="Select way of Payment" required="required">
                   <option value="Online Payment">Online Payment</option>
                   <option value="Cash On Delivery">Cash On Delivary</option>
                </select>
               <input type="number"" name="mobNumber" placeholder="Enter MobileNumber" value="<%=pNum %>" required="required"
               minlength="6" maxlength="10" readonly="readonly">
             </div>
             <div class="button-box">
               <input type="submit" value="Proceed In Generate Bill & Save">
             </div> 
          </form>
        </div>
    </div>
</body>
</html>