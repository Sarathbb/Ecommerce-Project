<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
<link rel="stylesheet" type="text/css" href="CSS/Signup.css">
</head>
<body>
   <div class="main-box">
       <div class="left-box">
           <%
           String msg = request.getParameter("msg");
           if("valid".equals(msg))
           {
           %>
               <h2>Successfully Registered !</h2>
           <%} %>
           <%
           if("invalid".equals(msg))
           {
           %>
              <h2>Somthing Went Wrong!Try Agin!</h2>
           <%} %>
           <h3>Online Shopping</h3>
           <p>The Online Shopping System is the Application that allows the users to shop online without going to the shops to buy them.</p>
       </div>
       <div class="right-box">
           <form action="SignupAction.jsp" method="post">
               <input type="text" placeholder="Enter Name" name="name" required="required">
               <input type="email" placeholder="Enter Email" name="email" required="required">
               <input type="text" placeholder="Enter Mobile Number" name="mobileNumber" required="required" 
               pattern="[7-9]{1}[0-9]{10}" >
               <select name="sequrityQuestion" required="required">
                  <option value="What was your first car?">What was your first car?</option>
                  <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                  <option value="What elementary school did you attend?">What elementary school did you attend?</option>
               </select>
               <input type="text" placeholder="Enter Answer" name="answer" required="required">
               <input type="password" placeholder="Enter Password" name="password" required="required"
               minlength="6" maxlength="10">
               <input type="submit" value="Signup">
               <a href="Login.jsp">Login</a>
           </form>
       </div>
   </div>
</body>
</html>