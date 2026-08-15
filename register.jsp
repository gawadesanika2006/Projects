<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
</head>
<body>
<div class="card">
 <h2>Register</h2>
 <form action="register" method="post">
   <input type="text" name="name" placeholder="Enter Name" required><br>
   <input type="email" name="email" placeholder="Enter Email" required><br>
   <input type="password" name="password" placeholder="Enter Password" required><br>
   <button type="submit">Register</button>
 </form>
</div>
</body>
</html>