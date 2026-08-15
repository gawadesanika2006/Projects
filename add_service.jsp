<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Service</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
String name = request.getParameter("name");
String description = request.getParameter("description");
String category = request.getParameter("category");

Connection con = null;
PreparedStatement ps = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme", "root", "");
    
    ps = con.prepareStatement("INSERT INTO services(name, description, category) VALUES(?,?,?)");
    ps.setString(1, name);
    ps.setString(2, description);
    ps.setString(3, category);
    
    ps.executeUpdate();
    response.sendRedirect("admindashboard.jsp");
} catch(Exception e){
    e.printStackTrace();
} finally {
    if(ps != null) ps.close();
    if(con != null) con.close();
}
%>
</body>
</html>