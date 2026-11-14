<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajman University | Receipt</title>
    <style>
        body {
            font-family: 'Times New Roman', Times, serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }
        .container {
            background: #ffffff;
            width: 100%;
            max-width: 450px;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
            border-top: 6px solid #002b49;
            padding: 30px;
        }
        h2 {
            color: #002b49;
            margin-top: 0;
            text-align: center;
            border-bottom: 2px solid #cbd5e1;
            padding-bottom: 15px;
        }
        .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 12px;
            font-size: 16px;
            color: #1e293b;
        }
        .row span:first-child {
            font-weight: bold;
        }
        .total-row {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 2px solid #002b49;
            font-size: 18px;
            font-weight: bold;
            color: #002b49;
        }
        .btn-back {
            display: block;
            width: 100%;
            background-color: #c59b27;
            color: #ffffff;
            text-align: center;
            text-decoration: none;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 4px;
            margin-top: 25px;
            box-sizing: border-box;
        }
        .btn-back:hover {
            background-color: #a37f1e;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Official Receipt</h2>
    <%
    // Declare vars and from the req object
        String customerName = (String) request.getAttribute("userName");
        String role = (String) request.getAttribute("userRole");
        String item = (String) request.getAttribute("itemCategory");
        Integer qty = (Integer) request.getAttribute("quantity");
        Integer days = (Integer) request.getAttribute("bookingDays");
        Double rate = (Double) request.getAttribute("dailyRate");
        Double sub = (Double) request.getAttribute("subtotal");
        Double discount = (Double) request.getAttribute("discountAmount");
        Double net = (Double) request.getAttribute("netTotal");
    %>
    <div class="row"><span>Name:</span> <span><%= customerName %></span></div>
    <div class="row"><span>Role:</span> <span><%= role %></span></div>
    <div class="row"><span>Item:</span> <span><%= item %></span></div>
    <div class="row"><span>Quantity:</span> <span><%= qty %></span></div>
    <div class="row"><span>Duration:</span> <span><%= days %> Days</span></div>
    <div class="row"><span>Daily Rate:</span> <span><%= rate %> AED</span></div>
    
    <br>
    
    <div class="row"><span>Subtotal:</span> <span><%= sub %> AED</span></div>
    <div class="row"><span>Discount Applied:</span> <span>-<%= discount %> AED</span></div>
    
    <div class="total-row"><span>Net Total:</span> <span><%= net %> AED</span></div>

    <a href="booking_form.jsp" class="btn-back">Make Another Reservation</a>
</div>

</body>
</html>