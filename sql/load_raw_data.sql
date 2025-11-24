CREATE TABLE raw.first_sales_raw (
	sale_id INT,
	customer_name TEXT,
	product_name TEXT,
	promotion_name TEXT,
	units_sold INT,
	price NUMERIC,
	order_date DATE
)



COPY raw.first_sales_raw
FROM 'C:\