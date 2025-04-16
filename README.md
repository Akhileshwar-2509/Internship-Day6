# Internship-Day6
🔍 Overview
This project demonstrates how to analyze monthly sales trends using SQL aggregations in PostgreSQL. We work with a dataset online_sales that includes order details like order_date, amount, and product_id.

📊 Dataset Structure

Column      	Data Type       	Description
order_id	    SERIAL	            Unique Order ID
order_date	     DATE	            Date of the order
amount	        NUMERIC(10,2)	    Revenue from the order
product_id	      INT	        ID of the product sold

🔧 SQL Commands & Results

CREATING TABLE:
```sql
DROP TABLE IF EXISTS online_sales;

CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount NUMERIC(10, 2),
    product_id INT
);
```
![Creating](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/creating.png)


INSERTING VALUES:
```sql

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
```

![Inserting](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/inserting.png)
✅ A. Extract Month and Year
```sql
SELECT 
    order_id,
    order_date,
    EXTRACT(MONTH FROM order_date) AS order_month,
    EXTRACT(YEAR FROM order_date) AS order_year
FROM 
    online_sales;
```
![A](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/a.png)
✅ B. Group By Year and Month
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

```
![B](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/b.png)
✅ C. Calculate Total Revenue (SUM)
```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);


```
![C](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/c.png)

✅ D. Count Order Volume

```sql
SELECT 
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM 
    online_sales
GROUP BY 
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date);

```
![D](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/d.png)
✅ E. Sort By Month
```sql
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

```
![E](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/e.png)
✅ F. Filter Time Period or Use LIMIT
```sql
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

```
![F](https://github.com/Akhileshwar-2509/Internship-Day6/blob/main/Screenshots/f.png)

✅ Final Result
Year | Month | Revenue | Volume
2023 | 1 | 400.00 | 2
2023 | 2 | 800.00 | 2
... | ... | ... | ...


🏁 Conclusion
This project demonstrates how SQL can be leveraged for time-based sales trend analysis using core aggregation techniques such as SUM, COUNT, GROUP BY, and EXTRACT. Through these step-by-step queries, we analyzed:

Monthly revenue trends

Order volume insights

Time period filtering

Chronological and revenue-based sorting

These queries are not only helpful for business intelligence and reporting but also form a strong foundation for performing more advanced analytics using SQL.

📌 Next Steps: You can extend this analysis by adding product-wise trends, category grouping, or visualizing the results in tools like Power BI, Tableau, or Python (Matplotlib/Seaborn).