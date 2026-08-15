<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
</head>
<body>
<h2>Feedback</h2>
<form action="feedback" method="post">
  <input type="text" name="name" placeholder="Name" required><br><br>
  <textarea name="message" placeholder="Message" required></textarea><br><br>
  <button type="submit">Submit</button>
</form>
</body>
</html>