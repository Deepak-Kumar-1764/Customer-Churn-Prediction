
-- Preparing Data



-- Creating a Database
CREATE DATABASE Company;
USE Company;

-- Customer Demographics
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    location VARCHAR(100)
);

-- Transaction History 
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    transaction_date DATE,
    total_spent DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Customer Service
CREATE TABLE customer_service (
    complaint_id INT PRIMARY KEY AUTO_INCREMENT,   -- Unique identifier for each complaint
    customer_id INT,                         
    complaint_date DATE,                           -- Date the complaint was registered
    complaint_description VARCHAR(255),            
    complaint_status VARCHAR(20),                  -- Status of the complaint (e.g., 'Resolved', 'Unresolved')
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Engagement Data
CREATE TABLE engagement (
    login_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    login_date DATE,
    activity_type VARCHAR(50),  -- e.g., 'Web', 'Mobile'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- subsciption Data
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,         -- Unique identifier for each subscription
    customer_id INT,                         -- Foreign key from customers table
    subscription_start_date DATE,            -- Start date of the subscription
    subscription_end_date DATE,              -- End date of the subscription
    auto_renew BOOLEAN,                      -- Indicates whether the subscription is set to auto-renew
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insertin some data inside tables
INSERT INTO customers (first_name, last_name, age, gender, location)
VALUES 
('Deepak', 'Kumar', 30, 'Male', 'Barabanki'),
('Minakshi', 'Tiwari', 28, 'Femal','Lucknow');

SELECT * FROM customers;



-- Adding more complaints for customers with complaint_id > 5 to push them above the threshold

INSERT INTO customer_service (complaint_id, customer_id, complaint_date, complaint_description, complaint_status)
VALUES
(201, 1, '2023-11-25', 'Late delivery', 'Resolved'),
(202, 2, '2024-01-15', 'Damaged product received', 'Unresolved'),
(203, 3, '2023-12-05', 'Payment issue', 'Resolved'),
(204, 4, '2023-10-20', 'Refund not processed', 'Resolved'),
(205, 5, '2023-09-10', 'Poor packaging', 'Resolved'),
(206, 6, '2024-01-02', 'Wrong item delivered', 'Unresolved'),
(207, 7, '2023-11-30', 'Delayed service', 'Resolved'),
(208, 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
(209, 9, '2023-08-20', 'Multiple failed payments', 'Resolved'),
(210, 10, '2023-07-18', 'Customer service unresponsive', 'Resolved'),
(211, 11, '2023-06-12', 'Late refund processing', 'Resolved'),
(212, 12, '2023-11-15', 'Product never delivered', 'Unresolved'),
(213, 13, '2024-01-08', 'Faulty product received', 'Resolved'),
(214, 14, '2023-09-28', 'Incorrect item in order', 'Resolved'),
(215, 15, '2023-10-10', 'Delayed shipment', 'Unresolved');

INSERT INTO customer_service (customer_id, complaint_date, complaint_description, complaint_status)
VALUES
(2, '2024-01-15', 'Delayed delivery', 'Resolved'),   
(2, '2024-01-20', 'Product damaged', 'Resolved'),  
(2, '2024-01-22', 'Wrong item delivered', 'Resolved'), 
(2, '2024-01-25', 'Refund not processed', 'Resolved'), 
(2, '2024-01-28', 'Late refund', 'Unresolved'),       
(2, '2024-01-10', 'Incorrect billing', 'Unresolved'),
(2, '2023-12-25', 'Inaccurate product description', 'Resolved'),
(2, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
( 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
(6, '2024-01-18', 'Multiple failed payments', 'Unresolved'); 




INSERT INTO transactions (customer_id, transaction_date, total_spent)
VALUES
(8, '2023-11-30', 750.00),
(1, '2023-12-15', 300.00),
(14, '2023-09-05', 2000.00),
(11, '2023-06-22', 1400.00),
(5, '2023-12-01', 400.00),
(4, '2023-10-15', 320.00),
(3, '2023-11-25', 1200.00),
(9, '2023-05-20', 600.00),
(6, '2023-07-15', 800.00),
(2, '2023-11-05', 150.50),
(10, '2024-01-12', 600.00),
(3, '2010-10-30', 850.00),
(12, '2012-11-15', 900.00),
(7, '2024-06-20', 300.00),
(15, '2022-09-22', 2200.00),
(2, '2023-12-20', 500.00),
(1, '2024-01-10', 250.75),
(13, '2023-12-28', 1300.00),
(6, '2024-09-18', 2300.00),
(4, '2043-09-10', 450.00),
(7, '2024-08-25', 450.00),
(10, '2023-11-01', 700.00),
(15, '2024-08-15', 900.00),
(11, '2024-04-15', 500.00),
(13, '2023-11-10', 750.00),
(5, '2024-08-05', 150.00),
(14, '2023-10-30', 1800.00),
(12, '2023-10-10', 300.00),
(8, '2023-10-25', 500.00),
(9, '2020-07-10', 400.00);



select* from transactions;

ALTER TABLE engagement 
ADD platform VARCHAR(50);        -- Platform column to capture where the engagement occurred (e.g., mobile app, web)

INSERT INTO customer_service (complaint_id, customer_id, complaint_date, complaint_description, complaint_status)
VALUES
(201, 1, '2023-11-25', 'Late delivery', 'Resolved'),
(202, 2, '2024-01-15', 'Damaged product received', 'Unresolved'),
(203, 3, '2024-05-05', 'Payment issue', 'Resolved'),
(204, 4, '2024-05-20', 'Refund not processed', 'Resolved'),
(205, 5, '2024-09-10', 'Poor packaging', 'Resolved'),
(206, 6, '2024-01-02', 'Wrong item delivered', 'Unresolved'),
(207, 7, '2023-11-30', 'Delayed service', 'Resolved'),
(208, 8, '2023-12-25', 'Inaccurate product description', 'Resolved'),
(209, 9, '2024-08-20', 'Multiple failed payments', 'Resolved'),
(210, 10, '2023-07-18', 'Customer service unresponsive', 'Resolved'),
(211, 11, '2024-06-12', 'Late refund processing', 'Resolved'),
(212, 12, '2023-11-15', 'Product never delivered', 'Unresolved'),
(213, 13, '2024-01-08', 'Faulty product received', 'Resolved'),
(214, 14, '2024-09-28', 'Incorrect item in order', 'Resolved'),
(215, 15, '2024-09-10', 'Delayed shipment', 'Unresolved');


INSERT INTO engagement (login_id, customer_id, login_date, activity_type, platform)
VALUES
(301, 1, '2024-01-10', 'login', 'mobile_app'),
(302, 2, '2024-09-15', 'purchase', 'web'),
(303, 3, '2024-08-20', 'login', 'mobile_app'),
(304, 4, '2024-02-25', 'purchase', 'mobile_app'),
(305, 5, '2024-01-12', 'login', 'web'),
(306, 6, '2024-09-18', 'login', 'mobile_app'),
(307, 7, '2024-08-22', 'purchase', 'web'),
(308, 8, '2023-11-30', 'login', 'mobile_app'),
(309, 9, '2024-07-10', 'login', 'mobile_app'),
(310, 10, '2024-01-12', 'purchase', 'web'),
(311, 11, '2024-06-22', 'login', 'mobile_app'),
(312, 12, '2024-05-15', 'purchase', 'web'),
(313, 13, '2024-09-28', 'login', 'mobile_app'),
(314, 14, '2023-10-30', 'login', 'web'),
(315, 15, '2024-09-22', 'login', 'mobile_app');



INSERT INTO subscriptions (subscription_id, customer_id, subscription_start_date, subscription_end_date, auto_renew)
VALUES
(401, 1, '2023-01-01', '2024-01-01', TRUE),
(402, 2, '2023-12-15', '2023-12-15', FALSE),
(403, 3, '2024-06-22', '2022-06-22', FALSE),
(404, 4, '2023-01-05', '2024-01-05', TRUE),
(405, 5, '2024-10-10', '2023-10-10', TRUE),
(406, 6, '2024-07-01', '2024-07-01', FALSE),
(407, 7, '2023-09-15', '2024-09-15', TRUE),
(408, 8, '2024-08-22', '2023-08-22', FALSE),
(409, 9, '2024-05-10', '2024-05-10', TRUE),
(410, 10, '2023-11-15', '2023-11-15', TRUE),
(411, 11, '2023-12-01', '2022-12-01', FALSE),
(412, 12, '2024-06-18', '2024-06-18', FALSE),
(413, 13, '2024-02-25', '2024-02-25', TRUE),
(414, 14, '2024-05-15', '2023-05-15', TRUE),
(415, 15, '2023-04-20', '2024-04-20', FALSE);



-- Joining here all data in single file
SELECT 
    c.customer_id,
    c.age,
    c.gender,
    c.location,
    SUM(t.total_spent) AS total_spent,
    COUNT(t.transaction_id) AS transaction_count,
    MAX(t.transaction_date) AS last_purchase_date,
    s.subscription_start_date,
    s.subscription_end_date,
    s.auto_renew,
    COUNT(cs.complaint_id) AS total_complaints,
    MAX(cs.complaint_date) AS last_complaint_date,
    COUNT(e.login_id) AS total_logins,
    MAX(e.login_date) AS last_login_date
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
LEFT JOIN 
    customer_service cs ON c.customer_id = cs.customer_id
LEFT JOIN 
    subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN 
    engagement e ON c.customer_id = e.customer_id
GROUP BY 
    c.customer_id, c.age, c.gender, c.location, s.subscription_start_date, s.subscription_end_date, s.auto_renew;



-- Predicting here We can give conditions according data
SELECT 
    c.customer_id,
    DATEDIFF(NOW(), MAX(t.transaction_date)) AS days_since_last_purchase,
    DATEDIFF(NOW(), MAX(e.login_date)) AS days_since_last_login,
    CASE 
        WHEN COUNT(cs.complaint_id) > 5 THEN 'High'
        ELSE 'Low'
    END AS complaint_risk,
    CASE
        WHEN DATEDIFF(NOW(), MAX(t.transaction_date)) > 180 THEN 'Likely to Churn'
        ELSE 'Active'
    END AS churn_label
FROM 
    customers c
LEFT JOIN 
    transactions t ON c.customer_id = t.customer_id
LEFT JOIN 
    customer_service cs ON c.customer_id = cs.customer_id
LEFT JOIN 
    engagement e ON c.customer_id = e.customer_id
GROUP BY 
    c.customer_id;
select* from customer_service;
    
    
