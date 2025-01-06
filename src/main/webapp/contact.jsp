<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
    }
    
    /* Navigation Bar */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #4CAF50;
        padding: 15px 20px; /* Increased padding */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .navbar .logo {
        font-size: 24px;
        font-weight: bold;
        color: white;
        text-decoration: none;
    }

    .navbar ul {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    .navbar ul li {
        margin: 0 15px;
    }

    .navbar ul li a {
        text-decoration: none;
        color: white;
        font-size: 16px;
        font-weight: bold;
        transition: color 0.3s;
    }

    .navbar ul li a:hover {
        color: #FFD700;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .navbar ul {
            display: none;
            flex-direction: column;
            background: #4CAF50;
            position: absolute;
            top: 60px;
            right: 0;
            width: 200px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .navbar ul.show {
            display: flex;
        }

        .navbar .menu-toggle {
            display: block;
            cursor: pointer;
            font-size: 24px;
            color: white;
        }
    }

    /* Desktop Menu Toggle Hidden */
    .menu-toggle {
        display: none;
    }
    
    .container {
        max-width: 600px;
        margin: 40px auto; /* Added margin to add space between navbar and container */
        background: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    form {
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 8px;
        color: #555;
    }

    input,
    textarea {
        margin-bottom: 15px;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }

    button {
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }

    button:hover {
        background-color: #45a049;
    }

    .contact-info {
        margin-top: 20px;
        text-align: center;
    }

    .contact-info p {
        color: #555;
        margin-bottom: 5px;
    }

    .contact-info a {
        color: #4CAF50;
        text-decoration: none;
    }

    .contact-info a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

	<!-- Navigation Bar -->
    <nav class="navbar">
        <a href="#" class="logo">HealthyFood</a>
        <ul id="nav-links">
            <li><a href="home.jsp">Home</a></li>
            <li><a href="about.jsp">AboutUs</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="contact.jsp">ContactUs</a></li>
            <li><a href="login.jsp">Login</a></li>
        </ul>
        <div class="menu-toggle" onclick="toggleMenu()">☰</div>
    </nav>
    
    <!-- JavaScript for Responsive Menu -->
    <script>
        function toggleMenu() {
            const navLinks = document.getElementById("nav-links");
            navLinks.classList.toggle("show");
        }
    </script>
	
    <div class="container">
        <h1>Contact Us</h1>
        <form action="ContactServlet" method="POST">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Your Name" required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Your Email" required>
            
            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
            
            <button type="submit">Send Message</button>
        </form>
    </div>
</body>
</html>
