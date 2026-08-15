<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Admin Dashboard</h2>
<h3>Add New Service</h3>
<form action="add_service.jsp" method="post">
  Name: <input type="text" name="name" required><br>
  Category: <input type="text" name="category" required><br>
  Description: <textarea name="description" required></textarea><br>
  <button type="submit">Add Service</button>
</form>
</body>
</html>