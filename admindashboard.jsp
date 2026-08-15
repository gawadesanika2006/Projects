<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
 int userCount = 0, feedbackCount = 0, serviceCount = 0;
 Connection con = null;
 try {
   Class.forName("com.mysql.cj.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme","root","");
   
   Statement st1 = con.createStatement(); 
   ResultSet u = st1.executeQuery("SELECT COUNT(*) FROM users");
   if(u.next()) userCount = u.getInt(1);
   
   Statement st2 = con.createStatement(); 
   ResultSet f = st2.executeQuery("SELECT COUNT(*) FROM feedback");
   if(f.next()) feedbackCount = f.getInt(1);
   
   Statement st3 = con.createStatement(); 
   ResultSet s = st3.executeQuery("SELECT COUNT(*) FROM services");
   if(s.next()) serviceCount = s.getInt(1);
 } catch(Exception e) { 
   e.printStackTrace(); 
 }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
</head>
<body>
<h1>Admin Dashboard</h1>
<p>Total Users: <%= userCount %> | Total Feedback: <%= feedbackCount %> | Total Services: <%= serviceCount %></p>

<h3>Add New Service</h3>
<form action="add_service.jsp" method="post">
  <input type="text" name="name" placeholder="Service Name" required><br><br>
  <input type="text" name="description" placeholder="Description" required><br><br>
  <select name="category">
    <option value="Mess">Mess</option>
    <option value="Hotel">Hotel</option>
    <option value="Hospital">Hospital</option>
    <option value="Mobile">Mobile Shop</option>
  </select><br><br>
  <button type="submit">Add Service</button>
</form>
</body>
</html>