<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*,com.FoodAppModel.RestaurantModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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
		
		.restaurant-grid {
		    display: grid;
		    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
		    gap: 20px;
		    max-width: 1200px;
		    margin: 0 auto;
		}
		
		.restaurant-card {
		    background: white;
		    border-radius: 12px;
		    overflow: hidden;
		    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		    transition: transform 0.2s ease;
		}
		
		.restaurant-card:hover {
		    transform: translateY(-5px);
		}
		
		.restaurant-image {
		    height: 200px;
		    overflow: hidden;
		}
		
		.restaurant-image img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		
		.restaurant-info {
		    padding: 20px;
		}
		
		.restaurant-info h2 {
		    color: #333;
		    font-size: 1.5rem;
		    margin-bottom: 10px;
		}
		
		.restaurant-meta {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 15px;
		}
		
		.cuisine-chip {
		    background-color: #e3f2fd;
		    color: #1976d2;
		    padding: 5px 12px;
		    border-radius: 20px;
		    font-size: 0.9rem;
		    font-weight: 500;
		}
		
		.rating {
		    color: #ffa000;
		    font-weight: 600;
		}
		
		.delivery-info {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    color: #666;
		    font-size: 0.9rem;
		}
		
		.delivery-time {
		    color: #666;
		}
		
		.status {
		    padding: 4px 8px;
		    border-radius: 4px;
		    font-size: 0.8rem;
		    font-weight: 500;
		}
		
		.status.active {
		    background-color: #e8f5e9;
		    color: #2e7d32;
		}
		
		.status.inactive {
		    background-color: #ffebee;
		    color: #c62828;
		}
		
		.view-menu-btn {
		    width: 100%;
		    padding: 10px;
		    background-color: #4CAF50;
		    color: white;
		    border: none;
		    border-radius: 6px;
		    font-size: 1rem;
		    font-weight: 500;
		    cursor: pointer;
		    transition: background-color 0.2s ease;
		}

		.view-menu-btn:hover {
		    background-color: #45a049;
		}
		
		.view-menu-btn:active {
		    transform: scale(0.98);
		}
		
		@media (max-width: 768px) {
		    .restaurant-grid {
		        grid-template-columns: 1fr;
		    }
		    
		    header h1 {
		        font-size: 2rem;
		    }
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
        <h1>Restaurants Near You</h1>
    </header>
    
    <main class="restaurant-grid" >
        <!-- Sample Restaurant Cards -->
        
        <%ArrayList<RestaurantModel> rList=(ArrayList<RestaurantModel>)session.getAttribute("RestaurantList");
        for(RestaurantModel rest:rList){
        %>
        <div class="restaurant-card" name="MenuServlet">
            <div class="restaurant-image">
                <img src=<%out.println(rest.getImagePath()); %> alt="Restaurant 1">
            </div>
            <div class="restaurant-info">
                <h2><%out.println(rest.getName()); %></h2>
                <div class="restaurant-meta">
                    <span class="cuisine-chip"><%out.println(rest.getCuisineType()); %></span>
                    <span class="rating">⭐<%out.println(rest.getRatings()); %></span>
                </div>
                <div class="delivery-info">
                    <span class="delivery-time"><%out.println(rest.getDeliveryTime()+" mins"); %></span>
                    <span class="status active"><%out.println(rest.getIsActive()); %></span>
                    
                </div>
                <br>
                <form action="Menu?restaurantId<%= rest.getRestaurantId()%>>" method="GET">
                    <input type="hidden" name="restaurantId" value=<%= rest.getRestaurantId()%>>
                    <input type="hidden" name="restaurantName" value="The Gourmet Kitchen">
                    <button type="submit" class="view-menu-btn">View Menu</button>
                </form>
            </div>
        </div>
		<%} %>
        
    </main>
</body>
</html>