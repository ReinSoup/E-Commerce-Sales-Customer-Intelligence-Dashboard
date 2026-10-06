-- Product & Regional Analysis


-- Revenue and profit by sub-category


SELECT
    "Sub-Category",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;





-- Top 10 products by revenue


SELECT
    "Product Name",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Product Name"
ORDER BY total_revenue DESC
LIMIT 10;





--Top 10 products by profit


SELECT
    "Product Name",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;






-- Bottom 10 products by profit


SELECT
    "Product Name",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Product Name"
ORDER BY total_profit ASC
LIMIT 10;





-- Revenue and profit by region


SELECT
    "Region",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data
GROUP BY "Region"
ORDER BY total_profit DESC;





--  Orders by region


SELECT
    "Region",
    COUNT(DISTINCT "Order ID") AS total_orders,
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Region"
ORDER BY total_orders DESC;





--  Regional performance by category


SELECT
    "Region",
    "Category of Goods",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data
GROUP BY
    "Region",
    "Category of Goods"
ORDER BY
    "Region",
    total_profit DESC;





--  Top sub-category in each region by profit


SELECT
    "Region",
    "Sub-Category",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY
    "Region",
    "Sub-Category"
ORDER BY
    "Region",
    total_profit DESC;




--  Product performance by category


SELECT
    "Category of Goods",
    COUNT(DISTINCT "Product Name") AS product_count,
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit,
    SUM("Profit") / SUM("Sales") AS profit_margin
FROM sales_data
GROUP BY "Category of Goods"
ORDER BY total_profit DESC;





--  Products with high revenue but negative profit


SELECT
    "Product Name",
    SUM("Sales") AS total_revenue,
    SUM("Profit") AS total_profit
FROM sales_data
GROUP BY "Product Name"
HAVING SUM("Profit") < 0
ORDER BY total_revenue DESC;



