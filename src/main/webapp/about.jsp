<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        color: #333;
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
        max-width: 800px;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        margin: 40px auto; /* Increased margin to add space between navbar and container */
        text-align: center;
    }

    h1 {
        font-size: 2.5rem;
        color: #4CAF50;
        margin-bottom: 20px;
    }

    p {
        font-size: 1.1rem;
        line-height: 1.8;
        color: #666;
        margin-bottom: 20px;
    }

    p span {
        color: #1976D2;
        font-weight: bold;
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
        <h1>About Us</h1>
        <p>Welcome to FoodApp, your ultimate companion for discovering the finest restaurants, cafes, and dining experiences near you. Whether you're craving authentic local dishes, international cuisines, or quick bites on the go,FoodApp makes it effortless to find exactly what you need.</p>
        <p>Explore a curated selection of top-rated eateries, from cozy brunch spots to vibrant dining experiences, all tailored to satisfy your taste buds. Our mission is to connect you with the best-rated restaurants, provide real-time updates on reviews and offers, and ensure every meal is a delightful experience.</p>
        <p>With FoodApp, dining is more than just food it's about creating memories, celebrating connections, and enjoying the joy of a great meal. Start your journey with us today and discover a world of flavors waiting for you! Bon Appétit! 🌮🍣🍕</p>
    </div>
</body>
</html>
