
-- Customer Analysis



-- Average orders per customer

SELECT COUNT(DISTINCT "Order ID") * 1.0 / COUNT(DISTINCT "Customer ID") AS avg_orders_per_cust
FROM sales_data




-- Customer order frequency

SELECT order_count, COUNT(*) AS customer_count
FROM(
	SELECT "Customer ID", COUNT(DISTINCT "Order ID") AS order_count
	FROM sales_data
	GROUP BY "Customer ID"
)
GROUP BY order_count 
ORDER BY order_count;



-- One time vs repeat customers


SELECT 
	CASE 
		WHEN order_count = 1 THEN "One-Time"
		ELSE "Repeat"
	END AS customer_type,
	COUNT(*) AS Customer_count
FROM(
	SELECT "Customer ID",
	COUNT(DISTINCT "Order ID") AS order_count
	FROM sales_data
	GROUP BY "Customer ID"
)
GROUP BY customer_type 




-- do repeat customers generate more revenue?


WITH customer_summary AS (
    SELECT
        "Customer ID",
        COUNT(DISTINCT "Order ID") AS order_count,
        SUM("Sales") AS total_revenue,
        SUM("Profit") AS total_profit
    FROM sales_data
    GROUP BY "Customer ID"
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    SUM(total_revenue) AS total_revenue,
    SUM(total_profit) AS total_profit
FROM customer_summary
GROUP BY customer_type;

	
-- how valuable is an individual repeat customer compared with an individual one time customer?


WITH customer_summary AS(
	SELECT "Customer ID", 
	COUNT(DISTINCT "Order ID") AS order_count,
	SUM("Sales") AS total_revenue,
	SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Customer ID" 
)
SELECT 
	CASE
		WHEN order_count = 1 THEN "One-Time"
		ELSE "Repeat"
	END AS customer_type,
	COUNT(*) AS customer_count,
	SUM(total_revenue) / COUNT(*) AS revenue_per_cust,
	SUM(total_profit) / COUNT(*) AS profit_per_cust
	FROM customer_summary
	GROUP BY customer_type;
	



-- Revenue Contribution by Customer Type

WITH customer_summary AS (
    SELECT
        "Customer ID",
        COUNT(DISTINCT "Order ID") AS order_count,
        SUM("Sales") AS total_revenue
    FROM sales_data
    GROUP BY "Customer ID"
)
SELECT
    CASE
        WHEN order_count = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    SUM(total_revenue) AS total_revenue,
    SUM(total_revenue) * 1.0 /
        (SELECT SUM("Sales") FROM sales_data) AS revenue_share
FROM customer_summary
GROUP BY customer_type;
	


--Repeat Customer Rate by Segment

WITH customer_summary AS (
    SELECT
        "Customer ID",
        "Segment",
        COUNT(DISTINCT "Order ID") AS order_count
    FROM sales_data
    GROUP BY "Customer ID", "Segment"
)
SELECT
    "Segment",
    COUNT(*) AS total_customers,
    SUM(order_count > 1) AS repeat_customers,
    SUM(order_count > 1) * 1.0 / COUNT(*) AS repeat_rate
FROM customer_summary
GROUP BY "Segment"
ORDER BY repeat_rate DESC;






-- Average Orders per Customer by Segment

SELECT
    "Segment",
    COUNT(DISTINCT "Order ID") * 1.0
        / COUNT(DISTINCT "Customer ID") AS avg_orders_per_customer
FROM sales_data
GROUP BY "Segment"
ORDER BY avg_orders_per_customer DESC;





