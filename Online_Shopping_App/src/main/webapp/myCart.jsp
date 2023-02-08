<%@include file="Header.jsp" %>
<%--@include file="Footer.jsp" --%>
<%@page import="java.sql.*" %>
<%@page import="project.ConnectionProvider" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/home-style.css">
<style type="text/css">
body{
   background-color: #f0f5f1;
   min-height: 100vh;
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
table tr th a:hover{
    font-size: 15px;
    color: red;
}
table tr td a:hover{
    font-size: 15px;
    color: red;
}
table .total{
   background-color: yellow;
   padding: 0 20px;
}
table tr .inline{
   display: flex;
   height: 100%;
}
table tr .inline button {
	margin: 0 5px;
}
footer{
      width: 100%;
      background-color: #172337;
      color: #ffffff;
      display: flex;
      justify-content: center;
      padding: 10px 0;
      margin-top: 10px;
      
   }
</style>
</head>
<body>
    <h1>My Cart</h1>
    <%
       String msg = request.getParameter("msg");
       if("notPossible".equals(msg))
       {%>
    	   <h3>There is only one quantity! so click on remove !</h3>
       <%}
       if("inc".equals(msg))
       {%>
           <h3>Quantity increased successfully !</h3>
       <%}
       if("dec".equals(msg))
       {%>
           <h3>Quantity decreased successfully !</h3>
       <%}
       if("removed".equals(msg))
       {%>
           <h3>Product successfully removed!</h3>
       <%}
       if("process".equals(msg))
       {%>
           <h3>Product status is Proccessing!Cannot Remove!!!</h3>
       <%}
    %>
    <table>
    <%
      int total = 0;
      int sno = 0;
      try{
    	  Connection conn = ConnectionProvider.getConnection();
          Statement stmt = conn.createStatement();
          ResultSet rs = stmt.executeQuery("select sum(total) from cart where email = '"+email+"';");
          while(rs.next())
          {
        	  total = rs.getInt(1);
          }
    	  
      
    %>
     <tr>
       <th class="total">TOTAL : <%=total %> Rs</th>
       <%
       if(total > 0)
       {%>
    	   <th><a href="proceedToOrder.jsp" style="color: white;">PROCEED TO ORDER</a></th>
       <%}
       %>
       
     </tr>
     <tr>
       <th>S NO</th>
       <th>PRODUCT NAME</th>
       <th>CATEGORY</th>
       <th>PRICE</th>
       <th>QUANTITY</th>
       <th>SUB TOTAL</th>
       <th>REMOVE</th>
     </tr>
     <tr>
     <%
       ResultSet rs1 = stmt.executeQuery("select * from product inner join cart on product.id = cart.product_id and cart.email ='"+email+"';");
       while(rs1.next())
       {
    	   sno = sno + 1;
     %>
       <td><%=sno %></td>
       <td><%=rs1.getString(2) %></td>
       <td><%=rs1.getString(3) %></td>
       <td><%=rs1.getString(4) %></td>
       <td class="inline"><button><a  href="increaseQuantity.jsp?qun=<%=rs1.getString(8)%>&id=<%=rs1.getString(1) %>">+</a></button> <%=rs1.getString(8) %> <button><a  href="decreaseQuantity.jsp?qun=<%=rs1.getString(8)%>&id=<%=rs1.getString(1) %>">-</a></button></td>
       <td><%=rs1.getString(10) %></td>
       <td><a href="removeFromCart.jsp?id=<%=rs1.getString(1) %>">Remove</a></td>
       </tr>
       <%}
      }catch(Exception e){
    	  out.println(e);
      }
       %>
     
    </table>
    
</body>
</html>