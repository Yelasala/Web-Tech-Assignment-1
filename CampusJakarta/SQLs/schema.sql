/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  YE
 * Created: Nov 13, 2026
 */

-- Connect to jdbc:derby://localhost:1527/campus_facility_db;create=true

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