<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*,com.FoodProject.Controller.Cart,com.FoodAppModel.CartItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
	<style>
		* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    font-family: Arial, sans-serif;
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
		
		.container {
		    max-width: 800px;
		    margin: 0 auto;
		    padding: 20px;
		}
		
		h1 {
		    text-align: center;
		    color: #333;
		    margin-bottom: 30px;
		}
		
		.cart-items {
		    display: flex;
		    flex-direction: column;
		    gap: 20px;
		    margin-bottom: 30px;
		}
		
		.cart-card {
		    background: white;
		    border-radius: 8px;
		    padding: 20px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		.item-info {
		    flex: 1;
		}
		
		.item-info h3 {
		    color: #333;
		    margin-bottom: 5px;
		}
		
		.price {
		    color: #2ecc71;
		    font-weight: bold;
		    font-size: 1.1em;
		}
		
		.item-actions {
		    display: flex;
		    flex-direction: column;
		    align-items: flex-end;
		    gap: 10px;
		}
		
		.quantity-controls {
		    display: flex;
		    align-items: center;
		    gap: 10px;
		}
		
		.quantity-btn {
		    background: #f8f9fa;
		    border: 1px solid #dee2e6;
		    border-radius: 4px;
		    width: 30px;
		    height: 30px;
		    cursor: pointer;
		    font-size: 1.2em;
		    display: flex;
		    align-items: center;
		    justify-content: center;
		}
		
		.quantity-btn:hover {
		    background: #e9ecef;
		}
		
		.quantity {
		    font-weight: bold;
		    min-width: 20px;
		    text-align: center;
		}
		
		.remove-btn {
		    background: #ff4757;
		    color: white;
		    border: none;
		    padding: 8px 16px;
		    border-radius: 4px;
		    cursor: pointer;
		    font-size: 0.9em;
		}
		
		.remove-btn:hover {
		    background: #ff6b81;
		}
		
		.cart-actions {
		    display: flex;
		    gap: 20px;
		    justify-content: center;
		}
		
		.add-more-btn, .checkout-btn {
		    padding: 12px 24px;
		    border: none;
		    border-radius: 6px;
		    font-size: 1em;
		    cursor: pointer;
		    transition: background-color 0.3s;
		}
		
		.add-more-btn {
		    background: #fff;
		    color: #2ecc71;
		    border: 2px solid #2ecc71;
		}
		
		.add-more-btn:hover {
		    background: #f8f9fa;
		}
		
		.checkout-btn {
		    background: #2ecc71;
		    color: white;
		}
		.total_amount{
			text-align:right;
		}
		
		.checkout-btn:hover {
		    background: #27ae60;
		}
		
		@media (max-width: 600px) {
		    .cart-card {
		        flex-direction: column;
		        align-items: stretch;
		        gap: 15px;
		    }
		
		    .item-actions {
		        flex-direction: row;
		        justify-content: space-between;
		        align-items: center;
		    }
		
		    .cart-actions {
		        flex-direction: column;
		    }
	}</style>
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
        <h1>Your Cart</h1>
        
        <% double totalAmount=0;
        Cart cart=(Cart)session.getAttribute("Cart"); 
        if(cart==null || cart.getAllItems().isEmpty()){%>
        	<h2>Your Cart is Empty</h2>
        	
        <%}
        else{
        %>
        
        <div class="cart-items">
            <!-- Sample Cart Items -->
            <% Map<Integer,CartItem> map=cart.getAllItems();
            	Set<Integer> set=map.keySet();
            	for(Integer n:set){
            		CartItem c=map.get(n);
            		totalAmount+=(c.getPrice()*c.getQuantity());
            %>
            <div class="cart-card">
                <div class="item-info">
                    <h3><%out.println(c.getItemName()); %></h3>
                    <p class="price">Rs.<%out.println(c.getPrice()); %></p>
                </div>
                <div class="item-actions">
                    
                    <form action="CartServlet" method="post">
                    	<div class="quantity-controls">
                    		<input type="hidden" name="menuId" value=<%=c.getItemId()%>>
                        	<input type="hidden" name="action" value="update">
                        	
	                        <button class="quantity-btn" name="quantity" value="<%=c.getQuantity()-1%>">-</button>
	                        <span class="quantity"><%out.println(c.getQuantity()); %></span>
	                        <button class="quantity-btn" name="quantity" value="<%=c.getQuantity()+1%>">+</button>
                    	 </div>
                    </form>
                   
                    <form action="CartServlet" method="post">
                        <input type="hidden" name="menuId" value=<%=c.getItemId()%>>
                        <input type="hidden" name="action" value="remove">
                        <button class="remove-btn">Remove</button>
                    </form>
                    
                </div>
            </div>
            <%} %>
            <div class="total_amount">
            <h2>Total Amount</h2>
            <p class="amount">Rs.<%out.println(totalAmount);%></p>
        	</div>
		</div>
		<%} %>
		<br><br>
        <div class="cart-actions">
        	<form action="home.jsp" method="GET">
                    <input type="hidden" name="restaurantId" value="1">
                    <input type="hidden" name="restaurantName" value="margerita pizza">
                    <button class="add-more-btn">Add More Items</button>
             </form>
             <form action="checkout.jsp">
             <button class="checkout-btn">Proceed to Checkout</button>
             </form>
         
            
        </div>
        
    </div>

</body>
</html>