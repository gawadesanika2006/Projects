<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String search = request.getParameter("search");
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme", "root", "");
    
    if(search != null && !search.trim().isEmpty()){
        ps = con.prepareStatement("SELECT * FROM services WHERE name LIKE ?");
        ps.setString(1, "%" + search + "%");
    } else {
        ps = con.prepareStatement("SELECT * FROM services");
    }
    
    rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Services</title>
</head>
<body>
<h2>Our Services</h2>
<% 
    while(rs.next()){ 
%>
 <div class="card">
   <h3><%= rs.getString("name") %></h3>
   <p><%= rs.getString("description") %></p>
   <button onclick="location.href='service_detail.jsp?id=<%= rs.getInt("id") %>'">More Info</button>
 </div>
 <hr>
<% 
    } 
%>
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