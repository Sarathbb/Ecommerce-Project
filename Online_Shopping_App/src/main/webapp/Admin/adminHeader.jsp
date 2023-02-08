<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
   *{
      font-family: sans-serif;
   }
   header{
      width: 100%;
      height: 60px;
      display: flex;
      align-items: center;
      justify-content: space-around;
      position: fixed;
      top: 0;
      left: 0;
      background-color: #2874f0;
   }
   .logo{
      display: flex;
      align-items: center;
   }
   .nav-bar{
      display: flex;
      align-items: center;
   }
   .nav-bar a{
      text-decoration: none;
      padding: 0 20px;
      font-size: 18px;
      color: #ffffff;
   }
   .icon{
   width: 200px;
   height: 100%;
   display: flex;
   flex-direction: column;
   align-items: flex-end;
}
.icon img{
   height: 20px;
   width: 75px;
   margin-top: 11px;
}
.icon .explore{
   height: 15px;
   width: 75px;
   display: flex;
   align-items: center;
   cursor: pointer;
}
.icon .explore:hover{
   border-bottom: 1px solid white;
}
.icon .explore img {
	width: 10px;
	height: 10px;
	margin-bottom: 15px;
	margin-left: 2px;
}
.icon .explore .lbl-one{
    font-size: 11px;
    font-style: italic;
    color: white;
    font-weight: 600;
}
.icon .explore .lbl-two{
    color: #ffe500;
    font-size: 11px;
    font-style: italic;
    margin-left: 2px;
    font-weight: 600;
}
.nav-bar a:active {
	color: red;
}
.nav-bar a:hover{
    font-size: 19px;
    border-bottom: 1px solid white;
}
</style>
</head>
<body>
   <header>
       <div class="icon">
          <img alt="" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/flipkart-plus_8d85f4.png">
         <div class="explore">
           <a class="lbl-one" href="">Explore</a>
           <a class="lbl-two" href="">Plus</a>
           <img alt="" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/plus_aef861.png">
         </div>
       </div>
       <div class="nav-bar">
          <a href="addNewProducts.jsp">Add New Products</a>
          <a href="allProductEditProduct.jsp">All Products & Edit Products</a>
          <a href="messageReceived.jsp">Massages Received</a>
          <a href="ordersReceived.jsp">Orders Received</a>
          <a href="cancelOrders.jsp">Cancel orders</a>
          <a href="deliveredOrders.jsp">Delevered Orders</a>
          <a href="../logout.jsp">Logout</a>
       </div>
       
   </header>
</body>
</html>