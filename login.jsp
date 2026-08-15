<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String msg = request.getParameter("msg");
if("success".equals(msg)){
%>
<script>
alert("Registration Successful!");
</script>
<%
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<div class="card">
 <h2>Login</h2>
 <form action="login" method="post">
   <input type="text" name="email" placeholder="Enter Email" required><br>
   <input type="password" name="password" placeholder="Enter Password" required><br>
   <button type="submit">Login</button>
 </form>
 <a href="register.jsp">Register</a>
</div>
</body>
</html>