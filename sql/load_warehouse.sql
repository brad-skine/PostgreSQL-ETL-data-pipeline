INSERT INTO warehouse.dim_customer (name, city, zip)
SELECT DISTINCT 
	customer_name as name,
	NULL AS city,
	NULL::INT AS zip
FROM staging.sales_cleaned;


INSERT INTO warehouse.dim_date (order_date, year, month, day)
SELECT DISTINCT 
	order_date,
	EXTRACT(day FROM order_date) as day,
	EXTRACT(month FROM order_date) as month,
	EXTRACT(year FROM order_date) as year
FROM staging.sales_cleaned
WHERE order_date IS NOT NULL;
	
	
	
	