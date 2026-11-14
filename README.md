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

Right-click Java DB again and click Create Database. Name the database "campus_facility_db".

Once created, right-click the new test database connection and select Connect.

Next open the files tab beside services and expand the project file.

You will find a folder called SQL, expand that folder and open both files called "data.sql" and "schema.sql".

Open the schema.sql file and run the command making sure you are connected to the database which should appear on the bar on the top of the page.

The database table should now be created and ready to run, you also have the data.sql file with sample SQL code to test out.

Step 4: Run the Application

Go back to the Projects tab and just click on the green run button.
