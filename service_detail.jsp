<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int id = Integer.parseInt(request.getParameter("id"));
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
String name = "";
String description = "";

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme", "root", "");
    
    ps = con.prepareStatement("SELECT name, description FROM services WHERE id=?");
    ps.setInt(1, id);
    rs = ps.executeQuery();
    
    if(rs.next()){
        name = rs.getString("name");
        description = rs.getString("description");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Service Details</title>
</head>
<body>
<h2><%= name %></h2>
<p><%= description %></p>
<br>
<a href="javascript:history.back()">⬅ Back</a>
</body>
</html>
<%
} catch(Exception e){
    e.printStackTrace();
} finally {
    if(rs != null) rs.close();
    if(ps != null) ps.close();
    if(con != null) con.close();
}
%>