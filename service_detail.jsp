<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Detail</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
int id = Integer.parseInt(request.getParameter("id"));
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme","root","");
  PreparedStatement ps = con.prepareStatement("SELECT * FROM services WHERE id=?");
  ps.setInt(1, id);
  ResultSet rs = ps.executeQuery();
  if(rs.next()){
%>
  <h2><%= rs.getString("name") %></h2>
  <p>Category: <%= rs.getString("category") %></p>
  <p>Description: <%= rs.getString("description") %></p>
<%
  }
} catch(Exception e) { 
  e.printStackTrace(); 
}
%>

<h3>Feedback</h3>
<form action="FeedbackServlet" method="post">
  Name: <input type="text" name="user_name" required><br>
  Message: <textarea name="message" required></textarea><br>
  <button type="submit">Submit</button>
</form>
</body>
</html>