<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="CSS/Signup.css">
</head>
<body>
    <div class="main-box">
       <div class="left-box">
       <%
          String msg = request.getParameter("msg");
          if("notexist".equals(msg))
          {%>
        	  <h2>Incorrect Username or Password</h2>
         <% }
          if("invalid".equals(msg))
          {%>
        	  <h2>Somthing Went Wrong!Try Agin!</h2>
          <%}
       %>
           
           
           <h3>Online Shopping</h3>
           <p>The Online Shopping System is the Application that allows the users to shop online without going to the shops to buy them.</p>
       </div>
       <div class="right-box">
           <form action="loginAction.jsp" method="post">
               <input type="email" placeholder="Enter Emil" name="email" required="required">
               <input type="password" placeholder="Enter Password" name="password" required="required"
               minlength="6" maxlength="10">
               <input type="submit" value="Login">
               <a href="Signup.jsp">Signup</a>
               <a href="ForgotPassword.jsp">Forgot Password?</a>
           </form>
       </div>
   </div>
</body>
</html>