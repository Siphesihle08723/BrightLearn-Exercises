---------------------------------------------------------------------------
-- BrightLearn UNION & UNION ALL Exercise
-- Create Tables and Insert Data (Q1 - Q5)
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Q1
-- Create branch_sandton_accounts table
---------------------------------------------------------------------------

CREATE TABLE branch_sandton_accounts (
    account_id VARCHAR(10),
    account_holder VARCHAR(100)
);

INSERT INTO branch_sandton_accounts VALUES
('A001','Nomvula Dlamini'),
('A002','David Mokoena'),
('A003','Lerato Sithole'),
('A004','Peter Nkosi');

---------------------------------------------------------------------------
-- Create branch_rosebank_accounts table
---------------------------------------------------------------------------

CREATE TABLE branch_rosebank_accounts (
    account_id VARCHAR(10),
    account_holder VARCHAR(100)
);

INSERT INTO branch_rosebank_accounts VALUES
('A003','Lerato Sithole'),
('A004','Peter Nkosi'),
('A005','Zanele Khumalo'),
('A006','Thabo Motha');

---------------------------------------------------------------------------
-- Q2
-- Create savings_products table
---------------------------------------------------------------------------

CREATE TABLE savings_products (
    product_code VARCHAR(10),
    product_name VARCHAR(100)
);

INSERT INTO savings_products VALUES
('SV01','Basic Savings'),
('SV02','Premium Savings'),
('SV03','Youth Savings'),
('SV04','Business Savings');

---------------------------------------------------------------------------
-- Create current_products table
---------------------------------------------------------------------------

CREATE TABLE current_products (
    product_code VARCHAR(10),
    product_name VARCHAR(100)
);

INSERT INTO current_products VALUES
('CR01','Standard Current'),
('CR02','Gold Current'),
('SV03','Youth Savings'),
('CR03','Business Current');

---------------------------------------------------------------------------
-- Q3
-- Create retail_banking_staff table
---------------------------------------------------------------------------

CREATE TABLE retail_banking_staff (
    staff_id VARCHAR(10),
    staff_name VARCHAR(100)
);

INSERT INTO retail_banking_staff VALUES
('S001','Mpho Radebe'),
('S002','Brian Tshabalala'),
('S003','Aisha Patel'),
('S004','Kabelo Moabelo');

---------------------------------------------------------------------------
-- Create corporate_banking_staff table
---------------------------------------------------------------------------

CREATE TABLE corporate_banking_staff (
    staff_id VARCHAR(10),
    staff_name VARCHAR(100)
);

INSERT INTO corporate_banking_staff VALUES
('S003','Aisha Patel'),
('S005','Nandi Dube'),
('S006','Sipho Khumalo'),
('S004','Kabelo Moabelo');

---------------------------------------------------------------------------
-- Q4
-- Create mobile_branch_cities table
---------------------------------------------------------------------------

CREATE TABLE mobile_branch_cities (
    city_code VARCHAR(10),
    city_name VARCHAR(100)
);

INSERT INTO mobile_branch_cities VALUES
('C01','Johannesburg'),
('C02','Pretoria'),
('C03','Cape Town'),
('C04','Durban');

---------------------------------------------------------------------------
-- Create digital_branch_cities table
---------------------------------------------------------------------------

CREATE TABLE digital_branch_cities (
    city_code VARCHAR(10),
    city_name VARCHAR(100)
);

INSERT INTO digital_branch_cities VALUES
('C03','Cape Town'),
('C05','Polokwane'),
('C06','Port Elizabeth'),
('C01','Johannesburg');

---------------------------------------------------------------------------
-- Q5
-- Create push_notification_targets table
---------------------------------------------------------------------------

CREATE TABLE push_notification_targets (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100)
);

INSERT INTO push_notification_targets VALUES
('C1001','Nomsa Zwane'),
('C1002','Andile Buthelezi'),
('C1003','Fatima Mahomed'),
('C1004','Ryno van Zyl');

---------------------------------------------------------------------------
-- Create inapp_banner_targets table
---------------------------------------------------------------------------

CREATE TABLE inapp_banner_targets (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100)
);

INSERT INTO inapp_banner_targets VALUES
('C1003','Fatima Mahomed'),
('C1005','Thandeka Cele'),
('C1006','Samuel Nkosi'),
('C1002','Andile Buthelezi');

---------------------------------------------------------------------------

---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- Q1: Combine account holders from Sandton and Rosebank branches.
-- Use UNION to remove duplicate account holders.
---------------------------------------------------------------------------

SELECT
    account_id,
    account_holder,
    'Sandton' AS city
FROM branch_sandton_accounts
UNION
SELECT
    account_id,
    account_holder,
    'Rosebank' AS city
FROM branch_rosebank_accounts;


---------------------------------------------------------------------------
-- Q2: Create a unique banking product catalogue.
-- Use UNION so duplicate products appear only once.
---------------------------------------------------------------------------

SELECT
    product_code,
    product_name,
    'Savings' AS product_type
FROM savings_products
UNION
SELECT
    product_code,
    product_name,
    'Current' AS product_type
FROM current_products;


---------------------------------------------------------------------------
-- Q3: Create a unique staff list.
-- Remove duplicate employees working in multiple departments.
---------------------------------------------------------------------------

SELECT
    staff_id,
    staff_name,
    'retail@nexbank.co.za' AS email
FROM retail_banking_staff
UNION
SELECT
    staff_id,
    staff_name,
    'corporate@nexbank.co.za' AS email
FROM corporate_banking_staff;


---------------------------------------------------------------------------
-- Q4: Create a unique list of cities served by NexBank.
---------------------------------------------------------------------------

SELECT
    city_code,
    city_name,
    'Mobile Branch' AS region
FROM mobile_branch_cities
UNION
SELECT
    city_code,
    city_name,
    'Digital Branch' AS region
FROM digital_branch_cities;


---------------------------------------------------------------------------
-- Q5: Create a unique list of customers targeted by marketing campaigns.
---------------------------------------------------------------------------

SELECT
    customer_id,
    customer_name,
    'Push Notification' AS segment
FROM push_notification_targets
UNION
SELECT
    customer_id,
    customer_name,
    'In-App Banner' AS segment
FROM inapp_banner_targets;
