<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            padding: 40px;
            text-align: center;
        }

        .card img {
            max-width: 200px;
            margin-bottom: 30px;
        }

        .card h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 20px;
        }

        .card p {
            color: #666;
            font-size: 20px;
            margin-bottom: 30px;
        }

        .card button {
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 15px 30px;
            font-size: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .card button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="card">
        <img src="images/scooter_ride_v1_2.gif" alt="Delivery Scooter">
        <h1>Order Confirmed!</h1>
        <p>Thank you for your order. Your food is being prepared and will arrive soon.</p>
        <form action="home.jsp">
        <button class="card button">Go to Home Page</button>
        </form>
    </div>
</body>
</html>