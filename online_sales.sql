-- sales_trend_analysis.sql

-- 🔁 DROP TABLE IF EXISTS
DROP TABLE IF EXISTS online_sales;

-- 🧱 CREATE TABLE
CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC(10, 2),
    product_id INT
);

-- 📥 INSERT SAMPLE DATA
INSERT INTO online_sales (order_date, amount, product_id) VALUES
('2023-01-15', 250.00, 101),
('2023-01-20', 150.00, 102),
('2023-02-03', 300.00, 103),
('2023-02-10', 500.00, 104),
('2023-03-05', 120.00, 101),
('2023-03-15', 220.00, 102),
('2023-04-01', 350.00, 105),
('2023-04-10', 450.00, 106),
('2023-05-22', 600.00, 103),
('2023-05-30', 700.00, 104),
('2023-06-10', 180.00, 101),
('2023-06-20', 230.00, 107),
('2023-07-12', 900.00, 105),
('2023-07-18', 1000.00, 106),
('2023-08-05', 110.00, 108),
('2023-08-25', 150.00, 102),
('2023-09-10', 500.00, 104),
('2023-09-20', 550.00, 103),
('2023-10-02', 720.00, 109),
('2023-10-18', 800.00, 101);

-- ✅ A. Extract Month and Year
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM 
    online_sales;

-- ✅ B. Group By Year and Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- ✅ C. Calculate Total Revenue (SUM)
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- ✅ D. Count Order Volume
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

-- ✅ E. Sort By Month
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    order_year, order_month;

-- ✅ F. Filter Time Period or Use LIMIT
-- Top 3 highest revenue months
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY 
    total_revenue DESC
LIMIT 3;
