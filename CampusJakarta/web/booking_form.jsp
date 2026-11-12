<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ajman University | Facility Reservation</title>
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
            max-width: 500px;
            border-radius: 6px;
            box-shadow: 0 3px 12px rgba(0, 0, 0, 0.1);
            border-top: 6px solid #c59b27;
            overflow: hidden;
        }
        .header {
            background-color: #002b49;
            color: #ffffff;
            padding: 20px 25px;
        }
        .header h2 {
            margin: 0;
            font-size: 22px;
        }
        .header p {
            margin: 5px 0 0;
            font-size: 14px;
            color: #e2e8f0;
        }
        form {
            padding: 25px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            font-size: 16px;
            color: #1e293b;
        }
        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 9px 10px;
            border: 1px solid #cbd5e1;
            border-radius: 4px;
            font-size: 15px;
            font-family: 'Times New Roman', Times, serif;
            box-sizing: border-box;
        }
        .btn-submit {
            width: 100%;
            background-color: #002b49;
            color: #ffffff;
            border: none;
            padding: 12px;
            font-size: 16px;
            font-family: 'Times New Roman', Times, serif;
            font-weight: bold;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 8px;
        }
        .btn-submit:hover {
            background-color: #00406c;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2>Campus Facility Reservation</h2>
        <p>Ajman University — Campus Operations</p>
    </div>

    <form action="ReservationServlet" method="POST">
        <div class="form-group">
            <label for="userName">Full Name</label>
            <input type="text" id="userName" name="userName" placeholder="Enter full name" required>
        </div>

        <div class="form-group">
            <label for="userRole">University Role</label>
            <select id="userRole" name="userRole" required>
                <option value="" disabled selected>Select Role</option>
                <option value="STUDENT">STUDENT — Standard Rate</option>
                <option value="FACULTY">FACULTY — 15% Discount</option>
            </select>
        </div>

        <div class="form-group">
            <label for="itemCategory">Equipment Category</label>
            <select id="itemCategory" name="itemCategory" required>
                <option value="" disabled selected>Select Equipment</option>
                <option value="LAPTOP">LAPTOP — 50 AED per day</option>
                <option value="PROJECTOR">PROJECTOR — 80 AED per day</option>
                <option value="POD">STUDY POD — 100 AED per day</option>
            </select>
        </div>

        <div class="form-group">
            <label for="quantity">Quantity</label>
            <input type="number" id="quantity" name="quantity" min="1" max="50" value="1" required>
        </div>

        <div class="form-group">
            <label for="bookingDays">Booking Days</label>
            <input type="number" id="bookingDays" name="bookingDays" min="1" max="30" value="1" required>
        </div>

        <button type="submit" class="btn-submit">Submit Reservation</button>
    </form>
</div>

</body>
</html>