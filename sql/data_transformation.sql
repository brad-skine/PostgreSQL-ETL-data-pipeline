DROP TABLE IF EXISTS staging.sales_cleaned;
CREATE TABLE staging.sales_cleaned AS 
SELECT 
	sale_id,
	INITCAP(customer_name) as customer_name,
	INITCAP(product_name) as product_name,
	promotion_name as promotion_name,
	units_sold,
	price,
	order_date,
	units_sold * price AS total_revenue
FROM raw.sales_raw
WHERE units_sold > 0 AND price > 0;
	