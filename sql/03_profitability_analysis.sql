
-- Profitability Analysis 





-- Revenue and profit by category

SELECT "Category of Goods",
	SUM("Sales") AS total_revenue,
	SUM("Profit") AS total_profit,
	SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data 
GROUP BY "Category of Goods" 
ORDER BY "Category of Goods";



-- Discount Range


SELECT
	MIN(Discount) as Minimum_Discount,
	MAX(Discount) AS Maximum_Discount
FROM sales_data
 
-- Discount vs Profitability

SELECT
	CASE
		WHEN "Discount" < 0.05 THEN '0% - 5%'
		WHEN "Discount" < 0.10 THEN '5% - 10%'
		WHEN "Discount" < 0.15 THEN '10% - 15%'
		WHEN "Discount" < 0.20 THEN '15% - 20%'
		WHEN "Discount" < 0.25 THEN '20% - 25%'
		WHEN "Discount" < 0.30 THEN '25% - 30%'
		WHEN "Discount" < 0.35 THEN '30% - 35%'
		WHEN "Discount" < 0.40 THEN '35% - 40%'
		WHEN "Discount" < 0.45 THEN '40% - 45%'
		ELSE '45%+'
	END AS discount_band,
	SUM(Sales) AS total_revenue,
	SUM(Profit) AS total_profit,
	SUM(Profit) / SUM(Sales) AS profit_margin
FROM sales_data
GROUP BY discount_band 
ORDER BY MIN(Discount);




-- Revenue and Profit by Sub-Category

SELECT "Sub-Category",
	SUM("Sales") AS total_revenue,
	SUM("Profit") AS total_profit,
	SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data 
GROUP BY "Sub-Category"
ORDER BY total_profit DESC



-- Revenue and Profit by Region

SELECT
    "Region",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data
GROUP BY "Region"
ORDER BY total_profit DESC;
 	




-- Revenue and Profit by Customer Segment
SELECT "Segment",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin,
    COUNT(DISTINCT "Customer ID") AS unique_customers
FROM sales_data
GROUP BY "Segment"
ORDER BY total_profit DESC;



-- Average Customer Value by Segment
SELECT Segment,
	COUNT(DISTINCT "Customer ID") AS Unique_customers,
	SUM("Sales") AS total_revenue,
	SUM("Profit") AS total_profit,
	SUM("Profit") / COUNT(DISTINCT "Customer ID") AS profit_per_customer,
	SUM("Sales") / COUNT(DISTINCT "Customer ID") AS revenue_per_customer
FROM sales_data
GROUP BY Segment 
ORDER BY total_profit DESC

