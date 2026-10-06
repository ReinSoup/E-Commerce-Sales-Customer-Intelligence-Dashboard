


-- Data Validation 





-- Total records in dataset

SELECT COUNT (*) AS total_rows
FROM sales_data;





-- Total number of unique orders

SELECT COUNT(DISTINCT "Order ID") AS total_orders
FROM sales_data;





--Total number of unique customers

SELECT COUNT (DISTINCT "Customer ID") AS total_customers
FROM sales_data;





-- Total number of distinct products

SELECT COUNT(DISTINCT "Product ID") AS total_products
FROM sales_data;





-- Overall financials

SELECT 
SUM("Sales") AS total_revenue,
SUM("Profit") AS total_profit,
SUM("Quantity") AS total_units_sold
FROM sales_data;





-- Date ranges

SELECT 
	MIN("Order Date") AS first_order,
	MAX("Order Date") AS last_order
FROM sales_data;





-- Available product categories

SELECT DISTINCT "Category of Goods"
FROM sales_data
ORDER BY "Category of Goods";




-- Available customer segments

SELECT DISTINCT Segment
FROM sales_data
ORDER BY Segment;




-- Available Regions

SELECT DISTINCT Region
FROM sales_data
ORDER BY Region;




-- Customers with more than one order

SELECT "Customer ID", COUNT(DISTINCT "Order ID") AS total_orders
FROM sales_data
GROUP BY "Customer ID" 
HAVING COUNT(DISTINCT "Order ID") > 1
ORDER BY total_orders DESC





