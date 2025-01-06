<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CheckOut Page</title>
    <style>
        /* General Styling */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Navigation Bar */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #4CAF50;
            padding: 15px 20px;
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

        .checkout-container {
            width: 600px;
            margin: 40px auto; /* Added space between navbar and container */
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            font-size: 14px;
            color: #333;
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        textarea,
        input,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        button {
            background: #4CAF50;
            color: white;
            font-size: 16px;
            padding: 12px;
            border: none;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background: #45a049;
        }

        input:invalid,
        textarea:invalid,
        select:invalid {
            border-color: #ff4444;
        }

        input:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 3px rgba(76, 175, 80, 0.5);
        }
        
        .checkout-footer a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .checkout-footer a:hover {
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

    <div class="checkout-container">
        <form class="checkout-form">
            <div class="form-group">
                <label for="address">Delivery Address</label>
                <textarea 
                    id="address" 
                    name="address" 
                    rows="3" 
                    required 
                    placeholder="Enter your complete address"
                ></textarea>
            </div>

            <div class="form-group">
                <label for="mobile">Mobile Number</label>
                <input 
                    type="tel" 
                    id="mobile" 
                    name="mobile" 
                    required 
                    pattern="[0-9]{10}" 
                    placeholder="Enter 10-digit mobile number"
                >
            </div>

            <div class="form-group">
                <label for="payment">Payment Mode</label>
                <select id="payment" name="payment" required>
                    <option value="">Select payment mode</option>
                    <option value="credit">Credit Card</option>
                    <option value="debit">Debit Card</option>
                    <option value="cash">Cash on Delivery</option>
                    <option value="upi">UPI</option>
                </select>
            </div>
            
            <button formaction="CheckOutServlet" type="submit">Place Order</button>
        </form>
    </div>
</body>
</html>
