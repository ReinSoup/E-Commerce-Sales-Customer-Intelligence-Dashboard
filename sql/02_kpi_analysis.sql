

-- KPI Analysis of Ecommerce dataset





-- Total Revenue:
SELECT 
	SUM("Sales") AS total_revenue
	FROM sales_data;



--Total Profit:
SELECT 
	SUM("Profit") AS total_profit
FROM sales_data;



-- Profit Margin:
SELECT SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data;
-- 25.62%



-- Total Orders:
SELECT COUNT(DISTINCT "Order ID") AS total_orders
FROM sales_data;





-- Average Order Value (AOV):

SELECT 
	SUM("Sales") / COUNT(DISTINCT "Order ID") AS average_order_value
FROM sales_data;
-- 1782.83

-- aov answers : on avg, how much revenue does one order generate?




-- UNITS sold:

SELECT
	SUM("Quantity") AS total_units_sold
FROM sales_data;
--243345 units




-- Average Discount:

SELECT AVG(Discount) as Avg_Discount
FROM sales_data;
-- approx 12.89%




-- REVENUE BY YEAR:

SELECT Year, SUM("Sales") as Total_Revenue
FROM sales_data
GROUP BY "Year" 
ORDER BY "Year"
-- Stable revenue. 




-- Profit by Year:

SELECT Year, SUM("Profit") as Total_Profit
FROM sales_data
GROUP BY "Year" 
ORDER BY "Year"




-- Profit Margin By Year:

SELECT Year, SUM(Profit) / SUM(Sales) as Profit_Margin
FROM sales_data
GROUP BY "Year" 
ORDER BY "Year"
-- stable margins



-- Monthly Revenue and Profit

SELECT Year, Month, SUM(Sales) AS Total_Revenue, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Year, Month 
ORDER BY Year, Month





