package com;
import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.sql.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String msg = req.getParameter("message");
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO feedback(user_name,message) VALUES(?,?)");
            ps.setString(1, name);
            ps.setString(2, msg);
            ps.executeUpdate();
            res.sendRedirect("feedback.jsp");
        } catch(Exception e){ 
            e.printStackTrace(); 
        }
    }
}