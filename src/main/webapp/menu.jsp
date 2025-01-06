<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.FoodAppModel.MenuModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu</title>
<style>
	* {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	}
	
	body {
	    background-color: #f5f5f5;
	    padding: 20px;
	}
	
	/* Navigation Bar */
    .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #4CAF50;
        padding: 10px 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
	
	header {
	    text-align: center;
	    margin-bottom: 40px;
	    padding: 20px;
	}
	
	header h1 {
	    color: #333;
	    font-size: 2.5rem;
	}
	
	.menu-container {
	    max-width: 1200px;
	    margin: 0 auto;
	    background-color: white;
	    border-radius: 12px;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	    overflow: hidden;
	}
	
	.menu-table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	.menu-table th {
	    background-color: #f8f9fa;
	    padding: 15px;
	    text-align: left;
	    color: #333;
	    font-weight: 600;
	    border-bottom: 2px solid #dee2e6;
	}
	
	.menu-table td {
	    padding: 15px;
	    border-bottom: 1px solid #dee2e6;
	    vertical-align: middle;
	}
	
	.item-image {
	    width: 100px;
	    height: 100px;
	    object-fit: cover;
	    border-radius: 8px;
	}
	
	.item-name {
	    font-weight: 600;
	    color: #333;
	    font-size: 1.1rem;
	}
	
	.item-description {
	    color: #666;
	    font-size: 0.9rem;
	    max-width: 400px;
	    line-height: 1.4;
	}
	
	.item-price {
	    font-weight: 600;
	    color: #2e7d32;
	    font-size: 1.1rem;
	}
	
	.status {
	    padding: 6px 12px;
	    border-radius: 20px;
	    font-size: 0.9rem;
	    font-weight: 500;
	    display: inline-block;
	}
	
	.status.available {
	    background-color: #e8f5e9;
	    color: #2e7d32;
	}
	
	.status.unavailable {
	    background-color: #ffebee;
	    color: #c62828;
	}
	
	/* Responsive Design */
	@media (max-width: 768px) {
	    .menu-container {
	        margin: 0;
	        border-radius: 0;
	    }
	
	    .menu-table {
	        display: block;
	    }
	
	    .menu-table thead {
	        display: none;
	    }
	
	    .menu-table tbody {
	        display: block;
	    }
	
	    .menu-table tr {
	        display: block;
	        margin-bottom: 15px;
	        border-bottom: 2px solid #dee2e6;
	    }
	
	    .menu-table td {
	        display: block;
	        text-align: right;
	        padding: 10px 15px;
	        border: none;
	    }
	
	    .menu-table td::before {
	        content: attr(data-label);
	        float: left;
	        font-weight: 600;
	        color: #333;
	    }
	
	    .item-image {
	        width: 100%;
	        height: 200px;
	    }
	
	    .item-description {
	        max-width: 100%;
	    }
	}
	.cart-button {
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: background-color 0.2s ease;
        }
	.cart-button.available {
            background-color: #4F46E5;
            color: white;
        }
    .cart-button.available:hover {
            background-color: #4338CA;
        }

    .cart-button.available:focus {
            outline: 2px solid #4F46E5;
            outline-offset: 2px;
        }
     .cart-button.unavailable {
            background-color: #D1D5DB;
            color: #6B7280;
            cursor: not-allowed;
        }

        /* Make sure the button aligns well in the table cell */
        td{
            padding: 16px;
            vertical-align: middle;
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
	
	<header>
        <h1>The Gourmet Kitchen Menu</h1>
    </header>
    
    <main>
        <div class="menu-container">
            <table class="menu-table">
                <thead>
                    <tr>
                        <th>Image</th>
                        <th>Item Name</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Availability</th>
                    </tr>
                </thead>
                <tbody>
	                <%ArrayList<MenuModel> mList=(ArrayList<MenuModel>)session.getAttribute("MenuList");
		        for(MenuModel menu:mList){
		        %>
                    <tr>
                        <td>
                            <img src=<%out.println(menu.getImagePath());%> alt="Margherita Pizza" class="item-image">
                        </td>
                        <td class="item-name"><%out.println(menu.getName()); %></td>
                        <td class="item-description"><%out.println(menu.getDescription()); %></td>
                        <td class="item-price">₹<%out.println(menu.getPrice()); %></td>
                        <td><span class="status available"><%out.println(menu.isAvailable()); %></span></td>
                        <td>
                        <form action="CartServlet" method="post">
                        	<input type="hidden" name="menuId" value=<%=menu.getMenuId()%>>
                        	<input type="hidden" name="action" value="add">
                            <button class="cart-button <%=menu.isAvailable() ? "available" : "unavailable"%>"
                                    <%=!menu.isAvailable() ? "disabled" : ""%>>
                                <%=menu.isAvailable() ? "ADD" : "Out of Stock"%>
                            </button>
                         </form>
                         </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>