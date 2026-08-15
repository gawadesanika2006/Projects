<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
String cat = request.getParameter("category");
%>
<h2>Services for: <%= cat %></h2>

<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme","root","");
  PreparedStatement ps = con.prepareStatement("SELECT * FROM services WHERE category=?");
  ps.setString(1, cat);
  ResultSet rs = ps.executeQuery();
  while(rs.next()){
%>
  <p>
    <b><%= rs.getString("name") %></b> - <%= rs.getString("description") %> 
    <a href="service_detail.jsp?id=<%= rs.getInt("id") %>">Details</a>
  </p>
<%
  }
} catch(Exception e) { 
  e.printStackTrace(); 
}
%>
</body>
</html>