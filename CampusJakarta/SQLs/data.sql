/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  YE
 * Created: Nov 13, 2026
 */
-- Connect to jdbc:derby://localhost:1527/campus_facility_db;
INSERT INTO reservations (user_name, user_role, item_category, quantity, booking_days, daily_rate, subtotal, net_total) 
VALUES ('AHMED KHALID', 'STUDENT', 'LAPTOP', 1, 3, 50.00, 150.00, 150.00);

INSERT INTO reservations (user_name, user_role, item_category, quantity, booking_days, daily_rate, subtotal, net_total) 
VALUES ('DR. IRMAN', 'FACULTY', 'PROJECTOR', 2, 1, 80.00, 160.00, 136.00);
