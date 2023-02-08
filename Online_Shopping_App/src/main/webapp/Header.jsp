<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<script src="https://kit.fontawesome.com/f23120adf0.js" crossorigin="anonymous"></script>
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
   .logo a{
      padding: 0 2px;
   }
   .nav-bar{
      display: flex;
      align-items: center;
   }
   .nav-bar a{
      text-decoration: none;
      padding: 0 15px;
      font-size: 18px;
      color: #ffffff;
   }
   .search-box{
      display: flex;
      align-items: center;
      height: 28px;
      
   }
   .search-box input{
      height: 100%;
      border: 0;
      outline: none;
      width: 280px;
      padding: 0px 5px;
   }
   .search-box button{
      cursor: pointer;
      height: 100%;
      background-color: white;
      border: 0;
      outline: none;
   }
   a{
   text-decoration: none;
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
.nav-bar a:hover{
    font-size: 19px;
}
</style>
</head>
<body>
<% 
   String email = session.getAttribute("email").toString();
%>
   <header>
       <div class="icon">
          <img alt="" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/flipkart-plus_8d85f4.png">
         <div class="explore">
           <a class="lbl-one" href="">Explore</a>
           <a class="lbl-two" href="">Plus</a>
           <img alt="" src="https://static-assets-web.flixcart.com/fk-p-linchpin-web/fk-cp-zion/img/plus_aef861.png">
         </div>
         
       </div>
       <a href=""><%=email %></a>
       <div class="nav-bar">
          <a href="Home.jsp">Home</a>
          <a href="myCart.jsp">My Cart</a>
          <a href="myOrder.jsp">My Orders</a>
          <a href="changeDetails.jsp">Change Details</a>
          <a href="messageUs.jsp">Message us</a>
          <a href="">About</a>
          <a href="logout.jsp">Logout</a>
       </div>
       <form action="searchHome.jsp" method="post" class="search-box">
          <input type="text" placeholder="Search for products,brands and more" name="search">
          <button type="submit"><a href=""><i class="fa-solid fa-magnifying-glass" style="color: #2874f0;font-size: 20px;"></i></a></button>
       </form>
   </header>
</body>
</html>