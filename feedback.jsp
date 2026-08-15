<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2>Submit Feedback</h2>
<form action="FeedbackServlet" method="post">
  Name: <input type="text" name="user_name" required><br>
  Message: <textarea name="message" required></textarea><br>
  <button type="submit">Submit</button>
</form>
</body>
</html>