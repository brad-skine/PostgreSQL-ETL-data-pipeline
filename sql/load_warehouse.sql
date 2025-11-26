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


INSERT INTO warehouse.dim_product (name, price, catagory)
SELECT DISTINCT 
	product_name AS name,
	price,
	NULL as catagory
FROM staging.sales_cleaned;


INSERT INTO warehouse.dim_promotion (name,ad_type,coupon_type,
	discount,start_date, end_date, active, updatetime)
SELECT DISTINCT  -- default values
    promotion_name,
    'Unknown' AS ad_type,
    'None' AS coupon_type,
    0 AS discount,
    CURRENT_DATE AS start_date,
    CURRENT_DATE + INTERVAL '3 years' AS end_date,
    TRUE AS active,
    CURRENT_TIMESTAMP AS updatetime
FROM staging.sales_cleaned
WHERE promotion_name IS NOT NULL;

	
	
	
	
	