package com;
import java.sql.*;

public class DBConnection {
    public static Connection getConnection(){
        Connection con = null;
        try{
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database Connection Setup
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nearbyme", "root", "");
        } catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}