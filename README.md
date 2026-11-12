Campus Reservation Project Setup

Follow these simple steps to set up and run the Campus Reservation web application on your local machine.

Step 1: Download and Open the Project

Download the project folder as a .zip file.

Unzip the downloaded file and place the extracted folder into your standard NetBeans project folder (usually Documents/NetBeansProjects).

Open Apache NetBeans, go to File > Open Project, and select the project folder.

Step 2: Configure the Java Version

Right-click the project in the Projects tab and select Properties.

Go to the Libraries section on the left.

Make sure the Java Platform is set to use Zulu 17 or JDK 17. Click OK.

Step 3: Set Up the Database

In NetBeans, go to the Services tab on the left side.

Expand the Databases folder, right-click Java DB, and select Start Server.

Right-click Java DB again and click Create Database. Name the database test (set both username and password to app).

Once created, right-click the new test database connection and select Connect.

Right-click the connection again and choose Execute Command.

Copy and paste the following SQL code into the window and run it to create the required table:

CREATE TABLE reservations (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_name VARCHAR(100),
    user_role VARCHAR(50),
    item_category VARCHAR(50),
    quantity INT,
    booking_days INT,
    daily_rate DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    net_total DECIMAL(10,2)
);


Step 4: Run the Application

Go back to the Projects tab, right-click the project, and click Clean and Build.

Right-click the project again and click Run.

Open your web browser and go to the following URL to access the form:
http://localhost:8080/CampusJakarta/booking_form.jsp
