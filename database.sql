CREATE DATABASE website_db; 
USE website_db; 

-- Registration Table 
CREATE TABLE users ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(100), 
  email VARCHAR(100) UNIQUE, 
  password VARCHAR(100), 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

-- Feedback Table 
CREATE TABLE feedback ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(100), 
  email VARCHAR(100), 
  message TEXT, 
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
); 

-- Login Table 
CREATE TABLE logins ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  email VARCHAR(100), 
  password VARCHAR(100), 
  login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);