
-- SQL Environment used: Databricks SQL
-- creating joins_db base on activity excirse
CREATE DATABASE IF NOT EXISTS joins_db;

-----------------------------------------------
--creating table name users
-----------------------------------------------
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    city VARCHAR(50)
);

----------------------------------------
-- inserting values in users table
----------------------------------------
INSERT INTO users VALUES
(1, 'Nomvula', 'Johannesburg'),
(2, 'David', 'Cape Town'),
(3, 'Anele', 'Durban'),
(4, 'Kabelo', 'Pretoria'),
(5, 'Lerato', 'Port Elizabeth');

-------------------------------------
-- creating table name plans
--------------------------------------
CREATE TABLE plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    monthly_price DECIMAL(10,2)
);

--------------------------------------
-- inserting values in plans table
----------------------------------------
INSERT INTO plans VALUES
(10, 'Basic', 79),
(11, 'Standard', 129),
(12, 'Premium', 199),
(13, 'Family', 249),
(14, 'Mobile', 59);

----------------------------------------
-- creating table name subscription
----------------------------------------
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    start_date DATE
);
--------------------------------------------
-- inserting values in subscriptions table
--------------------------------------------
INSERT INTO subscriptions VALUES
(501, 1, 10, '2026-01-15'),
(502, 2, 11, '2026-02-01'),
(503, 1, 12, '2026-03-10'),
(504, 6, 11, '2026-03-20'),
(505, 3, 13, '2026-04-05');

-------------------------------------------
-- creating table name shows
-------------------------------------------
CREATE TABLE shows (
    show_id INT PRIMARY KEY,
    show_title VARCHAR(100),
    genre VARCHAR(50)
);

----------------------------------------
-- inserting values in shows table
----------------------------------------
INSERT INTO shows VALUES
(701, 'Comedy Hour', 'Comedy'),
(702, 'Crime Time', 'Drama'),
(703, 'Tech Tales', 'Documentary'),
(704, 'Cooking Lab', 'Lifestyle'),
(706, 'Wild Earth', 'Documentary');

----------------------------------------
-- creating table name viewing_sessions
----------------------------------------
CREATE TABLE viewing_sessions (
    session_id INT PRIMARY KEY,
    user_id INT,
    show_id INT,
    watch_minutes INT
);

-------------------------------------------------
-- inserting values in viewing sessions table
------------------------------------------------
INSERT INTO viewing_sessions VALUES
(901, 1, 701, 45),
(902, 2, 703, 30),
(903, 1, 702, 60),
(904, 7, 701, 20),
(905, 3, 705, 90);

------------------------------------------------------------
-- Q1: Show every user who has a subscription
------------------------------------------------------------
SELECT 
    u.user_id,
    u.user_name,
    s.subscription_id,
    s.start_date
FROM users u
INNER JOIN subscriptions s
ON u.user_id = s.user_id;

------------------------------------------------------------
-- Q2: Subscription with plan details
------------------------------------------------------------
SELECT 
    s.subscription_id,
    s.user_id,
    p.plan_name,
    p.monthly_price
FROM subscriptions s
INNER JOIN plans p
ON s.plan_id = p.plan_id;

------------------------------------------------------------
-- Q3: Viewing sessions with show details
------------------------------------------------------------
SELECT 
    vs.session_id,
    vs.user_id,
    sh.show_title,
    sh.genre,
    vs.watch_minutes
FROM viewing_sessions vs
INNER JOIN shows sh
ON vs.show_id = sh.show_id;

------------------------------------------------------------
-- Q4: Sessions with user details (only valid users)
------------------------------------------------------------
SELECT 
    u.user_name,
    u.city,
    vs.session_id,
    vs.show_id,
    vs.watch_minutes
FROM users u
INNER JOIN viewing_sessions vs
ON u.user_id = vs.user_id;

------------------------------------------------------------
-- Q5: Users + subscriptions + plans (only complete matches)
------------------------------------------------------------
SELECT 
    u.user_name,
    u.city,
    p.plan_name,
    p.monthly_price,
    s.start_date
FROM users u
INNER JOIN subscriptions s
ON u.user_id = s.user_id
INNER JOIN plans p
ON s.plan_id = p.plan_id;

------------------------------------------------------------
-- Q6: All users with subscriptions (LEFT JOIN)
------------------------------------------------------------
SELECT 
    u.user_id,
    u.user_name,
    s.subscription_id,
    s.start_date
FROM users u
LEFT JOIN subscriptions s
ON u.user_id = s.user_id;

------------------------------------------------------------
-- Q7: All plans with subscriptions
------------------------------------------------------------
SELECT 
    p.plan_id,
    p.plan_name,
    s.subscription_id,
    s.user_id
FROM plans p
LEFT JOIN subscriptions s
ON p.plan_id = s.plan_id;

------------------------------------------------------------
-- Q8: All shows with viewing sessions
------------------------------------------------------------
SELECT 
    sh.show_id,
    sh.show_title,
    vs.session_id,
    vs.watch_minutes
FROM shows sh
LEFT JOIN viewing_sessions vs
ON sh.show_id = vs.show_id;

------------------------------------------------------------
-- Q9: All sessions with users (including missing users)
------------------------------------------------------------
SELECT 
    vs.session_id,
    vs.show_id,
    vs.watch_minutes,
    u.user_id,
    u.user_name
FROM viewing_sessions vs
LEFT JOIN users u
ON vs.user_id = u.user_id;

------------------------------------------------------------
-- Q10: All users with subscriptions + plans (optional match)
------------------------------------------------------------
SELECT 
    u.user_name,
    u.city,
    p.plan_name,
    p.monthly_price
FROM users u
LEFT JOIN subscriptions s
ON u.user_id = s.user_id
LEFT JOIN plans p
ON s.plan_id = p.plan_id;

------------------------------------------------------------
-- Q11: FULL OUTER JOIN users and subscriptions
------------------------------------------------------------
SELECT 
    u.user_id,
    u.user_name,
    s.subscription_id,
    s.start_date
FROM users u
FULL OUTER JOIN subscriptions s
ON u.user_id = s.user_id;

------------------------------------------------------------
-- Q12: FULL OUTER JOIN plans and subscriptions
------------------------------------------------------------
SELECT 
    p.plan_id,
    p.plan_name,
    s.subscription_id,
    s.user_id
FROM plans p
FULL OUTER JOIN subscriptions s
ON p.plan_id = s.plan_id;

------------------------------------------------------------
-- Q13: FULL OUTER JOIN shows and viewing sessions
------------------------------------------------------------
SELECT 
    sh.show_id,
    sh.show_title,
    vs.session_id,
    vs.watch_minutes
FROM shows sh
FULL OUTER JOIN viewing_sessions vs
ON sh.show_id = vs.show_id;

------------------------------------------------------------
-- Q14: FULL OUTER JOIN users and viewing sessions
------------------------------------------------------------
SELECT 
    u.user_id,
    u.user_name,
    vs.session_id,
    vs.show_id,
    vs.watch_minutes
FROM users u
FULL OUTER JOIN viewing_sessions vs
ON u.user_id = vs.user_id;

------------------------------------------------------------
-- Q15: FULL OUTER JOIN users + subscriptions + plans
------------------------------------------------------------
SELECT 
    u.user_id,
    u.user_name,
    s.subscription_id,
    s.plan_id,
    p.plan_name
FROM users u
FULL OUTER JOIN subscriptions s
ON u.user_id = s.user_id
FULL OUTER JOIN plans p
ON s.plan_id = p.plan_id;
