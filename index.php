<?php 
// --- DATABASE CONNECTION --- 
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$database = "website_db"; 
 
$conn = new mysqli($servername, $username, $password, $database); 
if ($conn->connect_error) { 
    die("Connection failed: " . $conn->connect_error); 
} 
 
// MESSAGES 
$success = $error = ""; 
 
// --- FEEDBACK SUBMIT --- 
if (isset($_POST['submit_feedback'])) { 
    $name = trim($_POST['name']); 
    $email = trim($_POST['email']); 
    $message = trim($_POST['message']); 
     
    if ($name != "" && $email != "" && $message != "") { 
        $stmt = $conn->prepare("INSERT INTO feedback (name, email, message) 
VALUES (?, ?, ?)"); 
 
 
        $stmt->bind_param("sss", $name, $email, $message); 
        if ($stmt->execute()) $success = "Feedback submitted successfully!"; 
        else $error = "Error saving feedback!"; 
        $stmt->close(); 
    } else $error = "All fields required!"; 
} 
 
// --- REGISTRATION SUBMIT --- 
if (isset($_POST['register_user'])) { 
    $reg_name = trim($_POST['reg_name']); 
    $reg_email = trim($_POST['reg_email']); 
    $reg_pass = trim($_POST['reg_pass']); 
 
    if ($reg_name != "" && $reg_email != "" && $reg_pass != "") { 
        $stmt = $conn->prepare("INSERT INTO users (name, email, password) 
VALUES (?, ?, ?)"); 
        $stmt->bind_param("sss", $reg_name, $reg_email, $reg_pass); 
        if ($stmt->execute()) $success = "Registration successful!"; 
        else $error = "Email already exists!"; 
        $stmt->close(); 
    } else $error = "All fields required!"; 
} 
 
// --- LOGIN SUBMIT --- 
if (isset($_POST['login_user'])) { 
 
 
    $log_email = trim($_POST['log_email']); 
    $log_pass = trim($_POST['log_pass']); 
 
    // Check login 
    $query = $conn->prepare("SELECT * FROM users WHERE email=? AND 
password=?"); 
    $query->bind_param("ss", $log_email, $log_pass); 
    $query->execute(); 
    $result = $query->get_result(); 
 
    if ($result->num_rows > 0) { 
        // Store login record 
        $insert = $conn->prepare("INSERT INTO logins (email, password) 
VALUES (?, ?)"); 
        $insert->bind_param("ss", $log_email, $log_pass); 
        $insert->execute(); 
         
        $success = "Login successful!"; 
    } 
    else $error = "Invalid email or password"; 
 
    $query->close(); 
} 
?> 
<!DOCTYPE html> 
 
 
<html> 
<head> 
<title>Artificial Intelligence Portal</title> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<style> 
*{margin:0;padding:0;box-sizing:border-box;font-family:'Segoe UI',Arial,sans
serif;} 
 
body{ 
    background:#f3f4f6; 
    color:#374151; 
} 
 
header{ 
    background:linear-gradient(90deg,#d8b4fe,#c7d2fe); 
    padding:20px; 
    text-align:center; 
    position:relative; 
    color:#312e81; 
    box-shadow:0 2px 8px rgba(0,0,0,0.1); 
} 
 
.login-btn{ 
    position:absolute; 
    top:10px; 
 
 
    right:10px; 
    background:#a78bfa; 
    color:#fff; 
    padding:8px 16px; 
    border-radius:6px; 
    cursor:pointer; 
    text-decoration:none; 
    font-weight:bold; 
    transition:0.3s; 
} 
.login-btn:hover{ 
    background:#c4b5fd; 
    color:#1e1b4b; 
} 
 
nav{ 
    background:#e0e7ff; 
    padding:10px; 
    text-align:center; 
} 
nav a{ 
    color:#4338ca; 
    text-decoration:none; 
    padding:10px 20px; 
 
 
    display:inline-block; 
    font-weight:500; 
    border-radius:5px; 
    transition:0.3s; 
} 
nav a:hover{ 
    background:#c7d2fe; 
} 
 
section{ 
    display:none; 
    padding:30px; 
    animation:fade 0.4s; 
} 
@keyframes fade{from{opacity:0}to{opacity:1}} 
 
form{ 
    max-width:450px; 
    margin:auto; 
    background:#f9fafb; 
    padding:20px; 
    border-radius:10px; 
    box-shadow:0 0 10px rgba(0,0,0,0.08); 
} 
 
 
 
input,textarea{ 
    width:100%; 
    padding:10px; 
    margin:8px 0; 
    border-radius:6px; 
    border:1px solid #d1d5db; 
    background:#f3f4f6; 
    color:#374151; 
    font-size:15px; 
} 
 
input[type=submit]{ 
    background:#a78bfa; 
    border:none; 
    cursor:pointer; 
    color:white; 
    font-weight:bold; 
    transition:0.3s; 
} 
input[type=submit]:hover{ 
    background:#c4b5fd; 
    color:#1e1b4b; 
} 
 
 
 
.success{ 
    background:#dcfce7; 
    color:#166534; 
    padding:10px; 
    margin:10px auto; 
    text-align:center; 
    border-radius:5px; 
    max-width:500px; 
} 
.error{ 
    background:#fee2e2; 
    color:#991b1b; 
    padding:10px; 
    margin:10px auto; 
    text-align:center; 
    border-radius:5px; 
    max-width:500px; 
} 
</style> 
</head> 
<body> 
 
<header><h1>Artificial Intelligence Portal</h1></header> 
 
 
 
<a class="login-btn" onclick="showSection('login')">Login</a> 
 
<nav> 
    <a class="active" onclick="showSection('home')">Home</a> 
    <a onclick="showSection('about')">About Us</a> 
    <a onclick="showSection('register')">Registration</a> 
    <a onclick="showSection('contact')">Contact</a> 
    <a onclick="showSection('feedback')">Feedback</a> 
</nav> 
 
<?php 
if($success) echo "<div class='success'>$success</div>"; 
if($error) echo "<div class='error'>$error</div>"; 
?> 
 
<section id="home" style="display:block;"> 
<h2>Welcome to Artificial Intelligence</h2> 
<p>AI makes machines think, learn and make smart decisions...</p> 
</section> 
 
<section id="about"> 
<h2>About AI</h2> 
<p>AI includes machine learning, neural networks, automation, etc.</p> 
 
 
</section> 
 
<section id="register"> 
<h2>User Registration</h2> 
<form method="post"> 
<label>Name</label> 
<input type="text" name="reg_name" required> 
<label>Email</label> 
<input type="email" name="reg_email" required> 
<label>Password</label> 
<input type="password" name="reg_pass" required> 
<input type="submit" name="register_user" value="Register"> 
</form> 
</section> 
 
<section id="contact"> 
<h2>Contact Us</h2> 
<p>Email: example@gmail.com</p> 
<p>Phone: +91 9000000000</p> 
<p>Location: Satara, Maharashtra, India</p> 
</section> 
 
<section id="feedback"> 
<h2>Feedback Form</h2> 
 
 
<form method="post"> 
<label>Name</label> 
<input type="text" name="name" required> 
<label>Email</label> 
<input type="email" name="email" required> 
<label>Message</label> 
<textarea name="message" required></textarea> 
<input type="submit" name="submit_feedback" value="Send Feedback"> 
</form> 
</section> 
 
<section id="login"> 
<h2>User Login</h2> 
<form method="post"> 
<label>Email</label> 
<input type="email" name="log_email" required> 
<label>Password</label> 
<input type="password" name="log_pass" required> 
<input type="submit" name="login_user" value="Login"> 
</form> 
</section> 
 
<script> 
function showSection(id){ 
 
 
    document.querySelectorAll('section').forEach(s=>s.style.display="none"); 
    document.getElementById(id).style.display="block"; 
} 
</script> 
 
</body> 
</html> 
 
<?php $conn->close(); ?>