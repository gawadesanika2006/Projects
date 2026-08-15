<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("user") == null){
    response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nearby Me</title>
</head>
<body>
<div class="navbar">
    <div><b>Nearby Me</b></div>
    <div>
        <a href="home.jsp">Home</a>
        <a href="services.jsp">Services</a>
        <a href="feedback.jsp">Feedback</a>
        <a href="logout.jsp">Logout</a>
    </div>
</div>

<div class="search-box">
    <form action="services.jsp">
        <input type="text" name="search" placeholder="Search services...">
        <button type="submit">Search</button>
    </form>
</div>

<div class="container">
    <div class="card" onclick="location.href='services.jsp?search=Mess'">🍽 Mess</div>
    <div class="card" onclick="location.href='services.jsp?search=Hotel'">🏨 Hotel</div>
    <div class="card" onclick="location.href='services.jsp?search=Hospital'">🏥 Hospital</div>
    <div class="card" onclick="location.href='services.jsp?search=Mobile'">📱 Mobile Shop</div>
</div>
</body>
</html>