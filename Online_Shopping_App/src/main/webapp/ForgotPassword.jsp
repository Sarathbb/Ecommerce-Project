<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password Page</title>
<link rel="stylesheet" type="text/css" href="CSS/Signup.css">
</head>
<body>
   <div class="main-box">
       <div class="left-box">
       <%
          String msg = request.getParameter("msg");
          if("done".equals(msg))
          {%>
        	  <h2>Successfully Updated</h2>
          <%}
          if("invalid".equals(msg))
          {%>
        	  <h2>Somthing Went Wrong!Try Agin!</h2>
         <%}
       %>
           
           
           <h3>Online Shopping</h3>
           <p>The Online Shopping System is the Application that allows the users to shop online without going to the shops to buy them.</p>
       </div>
       <div class="right-box">
           <form action="forgotPasswordAction.jsp" method="post">
               <input type="email" placeholder="Enter Email" name="email" required="required">
               <input type="number" placeholder="Enter Mobile Number" name="mobileNumber" required="required">
               <select name="sequrityQuestion" required="required">
                  <option value="What was your first car?">What was your first car?</option>
                  <option value="What is the name of your first pet?">What is the name of your first pet?</option>
                  <option value="What elementary school did you attend?">What elementary school did you attend?</option>
               </select>
               <input type="text" placeholder="Enter Answer" name="answer" required="required">
               <input type="password" placeholder="Enter New Password" name="password" required="required">
               <input type="submit" value="Save">
               <a href="Login.jsp">Login</a>
           </form>
       </div>
   </div>
</body>
</html>