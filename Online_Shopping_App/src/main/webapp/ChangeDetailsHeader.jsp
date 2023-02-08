<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
body{
   background-color: #f0f5f1;
   min-height: 100vh;
}
  header{
     width: 100%;
     height: 60px;
     background-color: #2874f0;
     position: fixed;
     top: 0;
     left: 0;
     display: flex;
     align-items: center;
     justify-content: space-around;
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
      
      <a href="changeDetails.jsp"><%=email %></a>
      
      <div class="nav-bar">
          <a href="ChangePassword.jsp">Change Password</a>
          <a href="ChangeAddress.jsp">Add or Change Address</a>
          <a href="ChangeQuestion.jsp">Change Security Qustion</a>
          <a href="ChangeMobileNo.jsp">Change Mobile Number</a>
          <a href="Home.jsp">Back To Home</a>
       </div>
  </header>
  
</body>
</html>